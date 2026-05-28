// ===== НАСТРОЙКИ ЭКРАНА =====
display_set_gui_size(1280, 720);

// ===== СОСТОЯНИЯ =====
enum WakeState {
    BLACK_SCREEN,
    SLOW_WAKE,
    BLUR_FADE,
    PLAYER_RISE,
    DIALOGUE,
    PLAYER_STAND,
    FINAL_TEXT,
    FADE_OUT,
    COMPLETE
}

state = WakeState.BLACK_SCREEN;
state_timer = 0;

// ===== ЭФФЕКТЫ =====
fade_alpha = 1;
blur_alpha = 1;
shake_intensity = 3;

// ===== ИГРОК =====
player_start_y = 0;
player_target_y = 0;

// ===== ДИАЛОГИ =====
dialogues = [
    "Mm... What was that dream?",
    "Where am I? This place seems familiar...",
    "I need to get up and look around.",
    "I feel like something important happened..."
];

current_dialogue = 0;
text_progress = 0;
text_speed = 0.4;
is_text_complete = false;
show_dialogue = false;

// ===== ФИНАЛЬНАЯ НАДПИСЬ =====
final_text = "Is this a dream?";
final_text_alpha = 0;
final_text_timer = 0;