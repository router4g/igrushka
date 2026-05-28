
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1280;
view_hport[0] = 720;
// Отключаем встроенные виды
view_enabled = false;  // ВАЖНО: false, не true

// Размеры камеры для отдаления
var target_w = 853;
var target_h = 480;

// Размер окна
window_set_size(1280, 720);
surface_resize(application_surface, 1280, 720);

// Создаем камеру
view_camera[0] = camera_create_view(0, 0, target_w, target_h, 0, noone, -1, -1, -1, -1);

// Включаем созданную камеру
view_visible[0] = true;
view_enabled = true;