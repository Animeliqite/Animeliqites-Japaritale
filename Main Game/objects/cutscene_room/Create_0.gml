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
	case room_savannah_0:
		if (Flag_Get(FLAG_TYPE.STATIC, FLAG_STATIC.SCENE_001, false) == false) {
			C_Execute(0, variable_instance_set, [camera, "target", noone]);
			C_Execute(0, variable_instance_set, [char_player, "sprite_index", spr_char_kaban_sleep]);
			C_Execute(0, variable_instance_set, [char_player, "_draw_hat", false]);
			char_player.sprite_index = spr_char_kaban_sleep;
		}
		else {
			BGM_Stop(0);
			BGM_Play(0, bgm_birdnoise);
			Cutscene_End(-1);
		}
		break;
	case room_savannah_1:
		if (Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SCENE_002,false)==false){
			char_player.x = -40;
			char_player.y = 230;
			char_player.collision = false;
			char_player.block_enabled = false;
			instance_deactivate_object(hint_landmark);
			instance_deactivate_object(trigger_warp);
		}
		else {
			instance_destroy(char_forcefield);
			char_serval.x = -9999;
			char_serval.y = -9999;
			Cutscene_End(-1);
		}
		break;
}