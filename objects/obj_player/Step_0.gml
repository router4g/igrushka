a = keyboard_check(ord("A"));  
d = keyboard_check(ord("D")); 
w = keyboard_check(ord("W"));  
s = keyboard_check(ord("S")); 

hspd = (d - a) * speed_;
vspd = (s - w) * speed_;
walls = [obj_wall, obj_wall_gr];
move_and_collide(hspd, vspd, walls, 4, 0, 0, speed_, speed_)
if(hp < 0){
	game_restart();
}
//if(keyboard_check_pressed(vk_speed))