
	 if (can_shoot)
{
inst = instance_create_depth(x,y,-10,
plazma);
inst.direction = point_direction(x,y-5, obj_player.x,  obj_player.y);
inst.image_angle = inst. direction;
inst.image_xscale = 500;
can_shoot = false;
alarm[0] = shoot_delay;
 }