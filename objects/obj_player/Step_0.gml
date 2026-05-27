a = keyboard_check(ord("A"));  
d = keyboard_check(ord("D")); 
w = keyboard_check(ord("W"));  
s = keyboard_check(ord("S")); 

hspd = (d - a) * speed_;
vspd = (s - w) * speed_;

move_and_collide(hspd, vspd, obj_wall, 4, 0, 0, speed_, speed_)

//if(keyboard_check_pressed(vk_speed))