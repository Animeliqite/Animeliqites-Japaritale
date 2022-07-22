for (var rot = 0; rot <= 180; rot += 45) {
	draw_line_width(x + (_body_x / 2) - lengthdir_x(sprite_width / 2, -rot), y + (_body_y / 2) - (sprite_height / 2) - lengthdir_y(sprite_height / 2, -rot), xstart - lengthdir_x(1024, -rot), ystart - 25 - (sprite_height / 2) - lengthdir_y(1024, -rot), 4);
	draw_sprite_ext(spr_cellien_big_monster_tentacle_start, 0, x + (_body_x / 2) - lengthdir_x(sprite_width / 2, -rot), y + (_body_y / 2) - (sprite_height / 2) - lengthdir_y(sprite_height / 2, -rot), 1, 1, -rot, c_white, 1);
}

draw_sprite_ext(spr_cellien_big_monster_body, 0, x + _body_x, y + _body_y, 1, 1, 0, c_white, 1);

if (!surface_exists(_surf_eye))
	_surf_eye = surface_create(2048, 2048);
else {
	surface_set_target(_surf_eye);
	draw_clear_alpha(c_black, 0);
	draw_sprite_ext(spr_cellien_big_monster_eye_black, 0, (x + _eye_black_x + _eye_black_x_add) * 2.5, (y - (sprite_height / 2) + _eye_black_y + _eye_black_y_add) * 2.5, _eye_black_scale_x * 2.5, 2.5, 0, c_white, 1);
	gpu_set_colorwriteenable(1, 1, 1, 0);
	draw_sprite_ext(spr_cellien_big_monster_eye, 0, (x + _eye_x + _eye_x_add) * 2.5, (y - (sprite_height / 2) + _eye_y + _eye_y_add) * 2.5, _eye_scale_x * 2.5, 2.5, 0, c_white, 1);
	gpu_set_colorwriteenable(1, 1, 1, 1);
	surface_reset_target();
	draw_surface_ext(_surf_eye, 0, 0, 0.4, 0.4, 0, c_white, 1);
}
draw_sprite_ext(spr_cellien_big_monster_core, 0, x + _body_x + _core_x - _core_x_add, y - (sprite_height / 2) + _body_y, _core_scale_x, 1, 0, c_white, 1);
if (_core_part_show) draw_sprite_ext(spr_cellien_big_monster_core, 0, x + _body_x + _core_x - _core_x_add, y - (sprite_height / 2) + _body_y, _core_scale_x + _core_part_scale_x, 1 + _core_part_scale_y, 0, c_white, _core_part_alpha);

if (_draw_paperplane) {
	var INST=id;
	with(_paperplane){
		x=INST._paperplane_x;
		y=INST._paperplane_y;
		image_xscale=INST._paperplane_dir * INST._paperplane_xscale;
		image_yscale=INST._paperplane_yscale;
		depth=INST.depth + INST._paperplane_depth;
	}
	if (Battle_GetState()==BATTLE_STATE.DIALOG) {
		//Anim_SetPause(id, "_eye_x", true);
		//Anim_SetPause(id, "_eye_y", true);
		
		//Anim_SetPause(id, "_eye_black_x", true);
		//Anim_SetPause(id, "_eye_black_y", true);
		
		_eye_x_add = lerp(_eye_x_add, lengthdir_x(_eye_x_add_speed, point_direction(x, y - (sprite_height / 2), _paperplane_x, _paperplane_y)), 0.5);
		_eye_black_x_add = lerp(_eye_black_x_add, lengthdir_x(_eye_black_x_add_speed, point_direction(x, y - (sprite_height / 2), _paperplane_x, _paperplane_y)), 0.5);
		
		_eye_y_add = lerp(_eye_y_add, lengthdir_y(8, point_direction(x, y - (sprite_height / 2), _paperplane_x, _paperplane_y)), 0.5);
		_eye_black_y_add = lerp(_eye_black_y_add, lengthdir_y(4, point_direction(x, y - (sprite_height / 2), _paperplane_x, _paperplane_y)), 0.5);
	}
}