surface_resize(application_surface, 1600, 1200);
if(_enabled){
	var SW=(window_get_fullscreen() ? display_get_width() : window_get_width());
	var SH=(window_get_fullscreen() ? display_get_height() : window_get_height());
	var SX=SW/2400;
	var SY=SH/1350;
	var SF=min(SX,SY);
	display_set_gui_maximize(SF*2.5,SF*2.5,(SW-2400*SF)/2+(400*SF),(SH-1350*SF)/2+(75*SF));
	if(sprite_exists(_sprite_previous)){
		draw_sprite_ext(_sprite_previous,0,(SW-960*(SF*2.5))/2,(SH-540*(SF*2.5))/2,960/sprite_get_width(_sprite_previous)*(SF*2.5),540/sprite_get_height(_sprite_previous)*(SF*2.5),0,c_white,1);
	}else{
		draw_sprite_ext(spr_pixel,0,(SW-960*(SF*2.5))/2,(SH-540*(SF*2.5))/2,SW,SH,0,c_black,1);
	}
	if(sprite_exists(_sprite)){
		draw_sprite_ext(_sprite,0,(SW-960*(SF*2.5))/2,(SH-540*(SF*2.5))/2,960/sprite_get_width(_sprite)*(SF*2.5),540/sprite_get_height(_sprite)*(SF*2.5),0,c_white,_alpha);
	}else{
		draw_sprite_ext(spr_pixel,0,(SW-960*(SF*2.5))/2,(SH-540*(SF*2.5))/2,SW,SH,0,c_black,_alpha);
	}
	draw_surface_ext(application_surface,(SW-2400*SF)/2+(400*SF),(SH-1350*SF)/2+(75*SF),SF,SF,0,c_white,1);
}else{
	var SW=(window_get_fullscreen() ? display_get_width() : window_get_width());
	var SH=(window_get_fullscreen() ? display_get_height() : window_get_height());
	var SX=SW/1600;
	var SY=SH/1200;
	var SF=min(SX,SY);
	display_set_gui_maximize(SF*2.5,SF*2.5,(SW-1600*SF)/2,(SH-1200*SF)/2);
	draw_surface_ext(application_surface,(SW-1600*SF)/2,(SH-1200*SF)/2,SF,SF,0,c_white,1);
}