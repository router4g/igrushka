
if (mouse_x > x){ 
// сначала отрисуем игрока 
draw_self(); 
// создадим переменную куда подсчитаем направление 
dir_to_mouse = point_direction(x+10, y-15,mouse_x,mouse_y); 
// потом отрисуем оружие  
draw_sprite_ext(spr_pist, -1, x, y-15, 
1, 1,dir_to_mouse,c_white,1); 
//иначе (игрок смотрит влево) 
} else { 
//создадим переменную куда подсчитаем направление 
dir_to_mouse = point_direction(x, y-15,mouse_x,mouse_y); 
// сначала отрисуем оружие  
draw_sprite_ext(spr_pist, -1, x, y-15, 
1, -1,dir_to_mouse,c_white,1);// тут -1 значит отзеркалить по у 
// потом отрисуем игрока 
draw_self();  
}
