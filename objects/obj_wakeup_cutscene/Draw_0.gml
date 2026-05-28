if (state == WakeState.COMPLETE) exit;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// ВАЖНО: Устанавливаем шрифт в каждом кадре
draw_set_font(-1);  // Шрифт по умолчанию

// ===== ДИАЛОГОВОЕ ОКНО =====
if (show_dialogue && current_dialogue < array_length(dialogues)) {
    var box_w = 500;
    var box_h = 120;
    var box_x = 20;
    var box_y = 20;
    
    draw_set_alpha(0.85);
    draw_rectangle_color(box_x, box_y, box_x + box_w, box_y + box_h,
                        c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    
    var display_text = string_copy(dialogues[current_dialogue], 1, text_progress);
    draw_set_color(c_white);
    draw_text_ext(box_x + 15, box_y + 15, display_text, -1, box_w - 30);
    
    if (is_text_complete) {
        draw_set_alpha(0.5 + sin(current_time / 500) * 0.5);
        draw_set_color(c_yellow);
        draw_text(box_x + box_w - 80, box_y + box_h - 25, ">> SPACE");
        draw_set_alpha(1);
    }
}

// ===== ФИНАЛЬНАЯ НАДПИСЬ =====
if (state == WakeState.FINAL_TEXT && final_text_alpha > 0) {
    draw_set_alpha(final_text_alpha);
    
    var shake = sin(current_time / 100) * 5;
    
    draw_set_color(c_black);
    draw_text_transformed(gui_w/2 + 3, gui_h/2 + shake + 3, final_text, 3, 3, 0);
    
    draw_set_color(c_red);
    draw_text_transformed(gui_w/2, gui_h/2 + shake, final_text, 3, 3, 0);
    
    draw_set_alpha(1);
}

// ===== ПОДСКАЗКА ПРОПУСКА =====
draw_set_alpha(0.5);
draw_set_color(c_gray);
draw_text(gui_w - 150, 15, "ESC - skip");
draw_set_alpha(1);