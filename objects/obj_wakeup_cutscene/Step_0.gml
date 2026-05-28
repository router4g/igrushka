state_timer++;

switch (state) {
    // ===== ЭТАП 1: ЧЕРНЫЙ ЭКРАН =====
    case WakeState.BLACK_SCREEN:
        fade_alpha = 1;
        
        if (state_timer > 60) {
            state = WakeState.SLOW_WAKE;
            state_timer = 0;
        }
        break;
        
    // ===== ЭТАП 2: МЕДЛЕННОЕ ПРОБУЖДЕНИЕ =====
    case WakeState.SLOW_WAKE:
        fade_alpha = lerp(fade_alpha, 0.3, 0.01);
        
        if (state_timer < 120) {
            shake_intensity = 2;
        } else {
            shake_intensity = max(0, shake_intensity - 0.05);
        }
        
        blur_alpha = lerp(blur_alpha, 0, 0.005);
        
        if (state_timer > 180) {
            state = WakeState.BLUR_FADE;
            state_timer = 0;
            blur_alpha = 0;
            shake_intensity = 0;
        }
        break;
        
    // ===== ЭТАП 3: ФОКУСИРОВКА =====
    case WakeState.BLUR_FADE:
        fade_alpha = lerp(fade_alpha, 0, 0.02);
        
        if (state_timer > 60) {
            state = WakeState.PLAYER_RISE;
            state_timer = 0;
            
            if (instance_exists(obj_player)) {
                obj_player.y += 20;
                player_start_y = obj_player.y;
                player_target_y = obj_player.y - 20;
                
                with (obj_player) {
                    speed = 0;
                    image_speed = 0.3;
                }
            }
        }
        break;
        
    // ===== ЭТАП 4: ПОДЪЕМ ИГРОКА =====
    case WakeState.PLAYER_RISE:
        if (instance_exists(obj_player)) {
            obj_player.y = lerp(obj_player.y, player_target_y, 0.05);
            obj_player.x += sin(state_timer * 0.1) * 0.3;
            
            if (abs(obj_player.y - player_target_y) < 0.5) {
                obj_player.y = player_target_y;
                state = WakeState.DIALOGUE;
                state_timer = 0;
                show_dialogue = true;
                
                with (obj_player) {
                    image_speed = 1;
                }
            }
        }
        break;
        
    // ===== ЭТАП 5: ДИАЛОГИ =====
    case WakeState.DIALOGUE:
        if (show_dialogue) {
            if (!is_text_complete) {
                text_progress += text_speed;
                
                if (text_progress >= string_length(dialogues[current_dialogue])) {
                    text_progress = string_length(dialogues[current_dialogue]);
                    is_text_complete = true;
                }
            } else {
                if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
                    if (current_dialogue < array_length(dialogues) - 1) {
                        current_dialogue++;
                        text_progress = 0;
                        is_text_complete = false;
                    } else {
                        state = WakeState.PLAYER_STAND;
                        state_timer = 0;
                        show_dialogue = false;
                    }
                }
            }
        }
        break;
        
    // ===== ЭТАП 6: ИГРОК ГОТОВ =====
    case WakeState.PLAYER_STAND:
        fade_alpha = lerp(fade_alpha, -0.5, 0.02);
        
        if (state_timer > 90) {
            state = WakeState.FADE_OUT;
            state_timer = 0;
        }
        break;
        
    // ===== ЭТАП 7: ЗАВЕРШЕНИЕ =====
    case WakeState.FADE_OUT:
        fade_alpha = lerp(fade_alpha, 1, 0.03);
        
        if (fade_alpha > 0.98) {
            state = WakeState.COMPLETE;
            if (instance_exists(obj_player)) {
                with (obj_player) {
                    can_move = true;
                }
            }
            instance_destroy();
        }
        break;
}

// ===== ПРОПУСК КАТ-СЦЕНЫ =====
if (keyboard_check_pressed(vk_escape)) {
    state = WakeState.FADE_OUT;
    state_timer = 80;
    if (instance_exists(obj_player)) {
        with (obj_player) {
            y = player_target_y;
            can_move = true;
        }
    }
}