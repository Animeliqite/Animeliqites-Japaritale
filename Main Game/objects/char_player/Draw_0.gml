draw_self();

if (_draw_hat) {
	var PIXEL_CHECK=(floor(image_index)%2==0);
	switch(dir){
		case DIR.UP:
			draw_sprite_ext(spr_char_kaban_hat,2,x,y-sprite_height+real(PIXEL_CHECK),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			break;
		case DIR.DOWN:
			draw_sprite_ext(spr_char_kaban_hat,0,x,y-sprite_height+real(PIXEL_CHECK),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			break;
		case DIR.LEFT:
			draw_sprite_ext(spr_char_kaban_hat,3,x,y-sprite_height+real(!PIXEL_CHECK),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			break;
		case DIR.RIGHT:
			draw_sprite_ext(spr_char_kaban_hat,1,x,y-sprite_height+real(!PIXEL_CHECK),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			break;
	}
}

draw_text(0,0,move_speed[DIR.DOWN]);

/*
{
	if(keyboard_check(vk_enter)){
		draw_set_color(c_red);
		if(dir==DIR.UP){
			draw_rectangle(x-sprite_width/2+4,y-5,x+sprite_width/2-4,y-sprite_height+5,true);
		}
		if(dir==DIR.DOWN){
			draw_rectangle(x-sprite_width/2+4,y-sprite_height+20,x+sprite_width/2-4,y+15,true);
		}
		if(dir==DIR.LEFT){
			draw_rectangle(x,y-sprite_height+19,x+sprite_width/2-15,y,true);
		}
		if(dir==DIR.RIGHT){
			draw_rectangle(x,y-sprite_height+19,x+sprite_width/2+15,y,true);
		}
	}
}
*/