draw_sprite_ext(spr_dialogbox_slice_noicon, 0, _bg_x - thickness_frame_collision, _bg_y - thickness_frame_collision, (_bg_width + thickness_frame_collision * 2) / 112, (_bg_height + thickness_frame_collision * 2) / 112,_angle,color,alpha_bg);

if(_angle%360==0){
	draw_surface_part_ext(_surface,_surface_x,_surface_y,_surface_width,_surface_height,_surface_x,_surface_y,1,1,color,alpha);
}else{
	draw_surface(_surface,0,0);
}