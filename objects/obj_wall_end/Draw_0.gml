if(rel and ((x-global.x_p)*(x-global.x_p) + (y-global.y_p)*(y-global.y_p) <visor_forse)){
	alarm[1] = 600;
draw_sprite_ext(spr_wall_invert_end,1,x,y,self.image_xscale,self.image_yscale,0,c_white,1);	
}else{
draw_self();	
}