if(rel and (x-x_p)){
	alarm[1] = 600;
draw_sprite_ext(spr_wall_invert,1,x,y,self.image_xscale,self.image_yscale,0,c_white,1);	
}else{
draw_self();	
}