for (var rot = 0; rot <= 180; rot += 45) {
	draw_sprite_ext(spr_cellien_big_monster_tentacle_start, 0, x + (_body_x / 2) - lengthdir_x(sprite_width / 2, -rot), y + (_body_y / 2) - (sprite_height / 2) - lengthdir_y(sprite_height / 2, -rot), 1, 1, -rot, c_white, 1);
	draw_line_width(x + (_body_x / 2) - lengthdir_x(sprite_width / 2, -rot), y + (_body_y / 2) - (sprite_height / 2) - lengthdir_y(sprite_height / 2, -rot), xstart - lengthdir_x(1024, -rot), ystart - 25 - (sprite_height / 2) - lengthdir_y(1024, -rot), 10);
}

draw_sprite_ext(spr_cellien_big_monster_body, 0, x + _body_x, y + _body_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_cellien_big_monster_eye_black, 0, x + _eye_black_x + _eye_black_x_add, y - (sprite_height / 2) + _eye_black_y + _eye_black_y_add, _eye_black_scale_x, 1, 0, c_white, 1);
draw_sprite_ext(spr_cellien_big_monster_eye, 0, x + _eye_x + _eye_x_add, y - (sprite_height / 2) + _eye_y + _eye_y_add, _eye_scale_x, 1, 0, c_white, 1);
draw_sprite_ext(spr_cellien_big_monster_core, 0, x - _eye_black_x - _eye_black_x_add, y - (sprite_height / 2), max(0,-_eye_black_scale_x + 1), 1, 0, c_white, 1);

if (_draw_paperplane) {
	if(_actually_draw_paperplane)
		draw_sprite_ext(spr_cellien_big_paperplane, 0, _paperplane_x, _paperplane_y, _paperplane_dir * _paperplane_xscale, _paperplane_yscale, 0, c_white, 1);
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