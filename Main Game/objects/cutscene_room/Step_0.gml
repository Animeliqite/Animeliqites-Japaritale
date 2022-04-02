switch(room){
	case room_caverns:
		if (cutscene._current_order == 3) {
			for (var i = 0; i < instance_number(char_mover); i++) {
				with (instance_find(char_mover, i)) {
					if (_moving_object == char_serval) {
						char_player.sprite_index = spr_char_kaban_right;
						char_serval.sprite_index = spr_char_serval_right;
						spd += 0.05;
						spd = min(spd, 4);
					}
				}
			}
		}
		else if (cutscene._current_order < 3)
			char_player.sprite_index = spr_char_kaban_right_lookup;
		if (cutscene._current_order < 5)
			camera.x = median(0, char_player.x - (camera.width / camera.scale_x / 2));
		else if (cutscene._current_order < 10) {
			for (var i = 0; i < instance_number(char_mover); i++) {
				with (instance_find(char_mover, i)) {
					if (_moving_object == char_player) {
						spd -= 0.1;
						spd = max(spd, 1);
					}
				}
			}
		}
		else if (cutscene._current_order == 14) {
			if (global.event == 1) {
				char_cellien_small.sprite_index = spr_char_cellien;
			}
			if (global.event == 2) {
				char_cellien_small.sprite_index = spr_char_cellien_shocked;
			}
			if (global.event == 3) {
				char_cellien_small.sprite_index = spr_char_cellien_happy;
			}
			if (global.event == 4) {
				char_cellien_small.sprite_index = spr_char_cellien_sad;
			}
			if (global.event == 5) {
				char_cellien_small.sprite_index = spr_char_cellien_question;
			}
			if (global.event == 6) {
				char_cellien_small.sprite_index = spr_char_cellien_blink;
			}
		}
		C_FadeFader(0, 1, 0, 30, 0, c_white);
		C_Execute(0, variable_instance_set, [camera, "target", noone]);
		C_CreateAnim(0, camera, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, 0, room_height - (camera.height / camera.scale_y), 120, false);
		C_MoveChar(0, char_player, 460, 380, false, 200);
		C_MoveChar(0, char_serval, room_width + 110, 380, false, 300);
		C_Wait(0, 1);
		C_Wait(1, 29);
		C_Execute(2, variable_instance_set, [fader, "alpha", 0]);
		C_Execute(2, variable_instance_set, [fader, "color", c_black]);
		C_Wait(2, 60);
		C_Execute(3, BGM_SetVolume, [0, 0, 60]);
		C_Wait(3, 50);
		C_Execute(4, BGM_Stop, [0]);
		C_CreateAnim(4, camera, "x", 0, 0, camera.x, char_cellien_small.x - (camera.width / camera.scale_x / 2), 30, false);
		C_Wait(4, 30);
		C_Execute(5, variable_instance_set, [char_player, "image_index", 0]);
		C_Execute(5, variable_instance_set, [char_player, "image_speed", 0]);
		C_Wait(5, 1);
		C_PlaySfx(6, snd_jump);
		C_CreateAnim(6, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.IN, char_cellien_small.x, 460, 10, false);
		C_CreateAnim(6, char_cellien_small, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.y, 330, 10, false);
		C_Wait(6, 1);
		C_Wait(7, 6);
		C_Execute(8, layer_destroy, [layer_get_id("Rocks_Highest")]);
		C_CreateAnim(8, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.x, 480, 10, false);
		C_CreateAnim(8, char_cellien_small, "y", ANIM_TWEEN.SINE, ANIM_EASE.IN, char_cellien_small.y, 380, 10, false);
		C_Wait(8, 1);
		C_Wait(9, 9);
		C_CreateAnim(10, char_player, "x", 0, 0, char_player.x, -50, 5, true);
		C_CancelCharMovement(6, char_player);
		C_PlaySfx(10, snd_impact);
		C_Execute(10, Camera_Shake, [3, 3]);
		C_Execute(10, Object_Shake, [3, "x", char_cellien_small]);
		C_Wait(10, 20);
		C_Execute(11, variable_instance_set, [char_cellien_small, "sprite_index", spr_char_cellien_shocked]);
		C_CreateAnim(11, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.x, 440, 15, false);
		C_Execute(11, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.0"), "{voice 2}{face 1}{face_emotion 1}"]);
		C_Wait(11, 1);
		C_Execute(12, Dialog_Start);
		C_WaitUntilDestroy(12, ui_dialog);
		C_Execute(13, variable_instance_set, [char_cellien_small, "sprite_index", spr_char_cellien_blink]);
		C_CreateAnim(13, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.x, 480, 15, false);
		C_Wait(13, 30);
		C_Execute(14, BGM_Play, [0, bgm_cellien_small]);
		C_Execute(14, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.1"), "{event 5}{voice 2}{face 1}{face_emotion 4}"]);
		C_Execute(14, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.2"), "{event 6}{voice 2}{face 1}{face_emotion 5}"]);
		C_Execute(14, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.3"), "{event 2}{voice 2}{face 1}{face_emotion 1}"]);
		C_Execute(14, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.4"), "{event 3}{voice 2}{face 1}{face_emotion 2}"]);
		C_Execute(14, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.5"), "{event 1}{voice 2}{face 1}{face_emotion 0}"]);
		C_Execute(14, Dialog_Start);
		C_WaitUntilDestroy(14, ui_dialog);
		C_Execute(15, Encounter_Start, [3, true, false]);
		C_Wait(15, 15);
		Cutscene_End(16);
		break;
	case room_beginning_void:
		if (phase == 0) {
			char_cellien_small.image_blend = merge_color(c_white, c_black, _merge_amount_0);
			if (global.event == 1) {
				char_cellien_small.sprite_index = spr_char_cellien;
			}
			if (global.event == 2) {
				char_cellien_small.sprite_index = spr_char_cellien_shocked;
			}
			if (global.event == 3) {
				char_cellien_small.sprite_index = spr_char_cellien_happy;
			}
			if (global.event == 4) {
				char_cellien_small.sprite_index = spr_char_cellien_sad;
			}
			if (global.event == 5) {
				char_cellien_small.sprite_index = spr_char_cellien_question;
			}
			if (global.event == 6) {
				char_cellien_small.sprite_index = spr_char_cellien_blink;
			}
			
			if (cutscene._current_order < 4) char_player.sprite_index = spr_char_kaban_lie;
			/*if (cutscene._current_order >= 14 && cutscene._current_order < 50) {
				char_player.move_speed[DIR.UP] = 0;
				char_player.move[DIR.UP] = 2;
			}*/
			C_Execute(0, variable_instance_set, [char_player, "sprite_index", spr_char_kaban_lie]);
			C_Execute(0, variable_instance_set, [camera, "scale_x", 4]);
			C_Execute(0, variable_instance_set, [camera, "scale_y", 4]);
			C_Wait(0, 30);
			C_CreateAnim(1, camera, "scale_x", 0, 0, 4, 2, room_speed * 1.5, false);
			C_CreateAnim(1, camera, "scale_y", 0, 0, 4, 2, room_speed * 1.5, false);
			C_Execute(1, variable_instance_set, [camera, "target", marker]);
			C_Wait(1, 60);
			C_PlaySfx(2, snd_bump);
			C_Execute(2, Object_Shake, [5, "x", char_player, 0, true]);
			C_Execute(2, Object_Shake, [5, "y", char_player, 0, true]);
			C_Wait(2, 5);
			C_PlaySfx(3, snd_bump);
			C_Execute(3, Object_Shake, [5, "x", char_player, 0, true]);
			C_Execute(3, Object_Shake, [5, "y", char_player, 0, true]);
			C_Wait(3, 5);
			C_PlaySfx(4, snd_bump);
			C_Execute(4, Object_Shake, [5, "x", char_player, 0, true]);
			C_Execute(4, Object_Shake, [5, "y", char_player, 0, true]);
			C_Wait(4, 10);
			C_PlaySfx(5, snd_wing);
			C_Execute(5, variable_instance_set, [char_player, "sprite_index", spr_char_kaban_down]);
			C_Execute(5, Object_Shake, [5, "x", char_player, 0, true]);
			C_Execute(5, Object_Shake, [5, "y", char_player, 0, true]);
			C_Wait(5, 29);
			//C_CreateAnim(6, camera, "offset_amount_y", 0, 0, 1, 0.75, room_speed, false);
			C_Wait(6, 1);
			C_Execute(7, variable_instance_set, [camera, "target", char_player]);
			C_Execute(7, instance_destroy, [marker]);
			C_Execute(7, variable_instance_set, [char_player, "dir", DIR.LEFT]);
			C_Wait(7, 10);
			C_Execute(8, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
			C_Wait(8, 10);
			C_Execute(9, variable_instance_set, [char_player, "dir", DIR.UP]);
			C_Wait(9, 10);
			C_Execute(10, variable_instance_set, [char_player, "dir", DIR.DOWN]);
			C_Wait(10, 30);
			C_Execute(11, variable_instance_set, [char_player, "dir", DIR.UP]);
			C_Wait(11, 30);
			C_Execute(12, instance_create_depth, [char_player.x - 3, char_player.y - char_player.sprite_height - 3, -9999, exclamation]);
			C_Wait(12, 30);
			C_MoveChar(13, char_player, char_player.x, 280, false, room_speed * 2);
			C_Wait(13, 75);
			C_Execute(14, variable_instance_set, [camera, "target", noone]);
			C_MoveChar(14, camera, char_player.x - (camera.width / camera.scale_x / 2), char_cellien_small.y - (camera.height / camera.scale_y / 2), false, room_speed * 2);
			C_Wait(14, 75);
			C_Execute(15, Dialog_Add_Ext, [Lang_GetString("cutscene.beginning.question.0")]);
			C_Execute(15, Dialog_Add_Ext, [Lang_GetString("cutscene.beginning.question.1")]);
			C_Execute(15, Dialog_Start);
			C_WaitUntilDestroy(15, ui_dialog);
			C_MoveChar(16, camera, char_player.x - (camera.width / camera.scale_x / 2), char_player.y - (camera.height / camera.scale_y / 2), false, room_speed * 2);
			C_Wait(16, 75);
			C_Execute(17, Dialog_Add_Ext, [Lang_GetString("cutscene.beginning.question.2")]);
			C_Execute(17, Dialog_Start);
			C_WaitUntilDestroy(17, ui_dialog);
			C_MoveChar(18, camera, char_player.x - (camera.width / camera.scale_x / 2), char_cellien_small.y - (camera.height / camera.scale_y / 2), false, room_speed * 2);
			C_MoveChar(18, char_player, char_player.x, char_cellien_small.y + 60, false, room_speed * 2);
			C_Wait(18, 75);
			C_Execute(19, BGM_SetVolume, [0, 0, room_speed]);
			C_Wait(19, 30);
			C_PlaySfx(20, snd_appear);
			C_CreateAnim(20, id, "_merge_amount_0", 0, 0, _merge_amount_0, 0, room_speed / 2, false);
			C_Execute(20, BGM_Stop, [0]);
			C_Wait(20, 60);
			C_Execute(21, BGM_Play, [0, bgm_cellien_small]);
			C_Execute(21, BGM_SetVolume, [0, 1, 0]);
			C_Execute(21, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.0"), "{event 1}{voice 2}{face 1}{face_emotion 0}"]);
			C_Execute(21, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.1"), "{event 5}{voice 2}{face 1}{face_emotion 4}"]);
			C_Execute(21, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.2"), "{event 6}{voice 2}{face 1}{face_emotion 5}"]);
			C_Execute(21, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.3"), "{event 3}{voice 2}{face 1}{face_emotion 2}"]);
			C_Execute(21, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.4"), "{event 5}{voice 2}{face 1}{face_emotion 4}"]);
			C_Execute(21, Dialog_Start);
			C_WaitUntilDestroy(21, ui_dialog);
			C_Execute(22, Encounter_Start, [3, true, false]);
			C_Execute(22, part_system_destroy, [particle.partsystem]);
			C_Wait(22, 15);
			Cutscene_End(23);
			//C_CreateAnim(1, marker, "scale_x", 0, 0, 4, 2, room_speed * 1.5, false);
			//C_Execute(7, variable_instance_set, [object_index, "phase", 1]);
			//Cutscene_End(7);
		}
		break;
}