if (image_alpha <= 0.01) exit;

draw_set_alpha(image_alpha);
draw_sprite_ext(spr_light_rays, 0, room_width/2, room_height/3,
               3, 3, angle, c_yellow, 0.8);
draw_set_alpha(1);