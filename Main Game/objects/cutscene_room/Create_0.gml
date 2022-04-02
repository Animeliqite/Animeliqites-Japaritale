Cutscene_Begin();
_merge_amount_0 = 1;
phase = 0;

switch(room){
	case room_caverns:
		C_FadeFader(0, 1, 0, 30, 0, c_white);
		C_Execute(0, variable_instance_set, [char_serval, "sprite_index", spr_char_serval_right_look]);
		C_Execute(0, variable_instance_set, [char_player, "sprite_index", spr_char_kaban_right_lookup]);
		break;
	case room_beginning_void:
		C_Execute(0, variable_instance_set, [camera, "scale_x", 4]);
		C_Execute(0, variable_instance_set, [camera, "scale_y", 4]);
		C_Execute(0, variable_instance_set, [camera, "offset_amount_y", 1]);
		C_Execute(0, variable_instance_set, [char_player, "sprite_index", spr_char_kaban_lie]);
		C_Execute(0, variable_instance_set, [char_player, "_draw_hat", false]);
		char_player.sprite_index = spr_char_kaban_lie;
		break;
}