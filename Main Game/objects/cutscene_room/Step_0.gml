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
	case room_savannah_0:
		if (Flag_Get(FLAG_TYPE.STATIC, FLAG_STATIC.SCENE_001, false) == false) {
			if (cutscene._current_order < 1)
				char_player.sprite_index = spr_char_kaban_sleep;
			
			C_Execute(0, BGM_Play, [0, bgm_birdnoise]);
			C_Wait(0, 60);
			C_PlaySfx(1, snd_wing);
			C_Execute(1, Object_Shake, [4, "x", char_player, 0, true]);
			C_Execute(1, Object_Shake, [4, "y", char_player, 0, true]);
			C_Execute(1, variable_instance_set, [camera, "target", noone]);
			C_Execute(1, variable_instance_set, [char_player, "sprite_index", spr_char_kaban_down]);
			C_Execute(1, variable_instance_set, [char_player, "dir", DIR.DOWN]);
			C_Wait(1, 30);
			C_Execute(2, variable_instance_set, [char_player, "dir", DIR.LEFT]);
			C_Wait(2, 10);
			C_Execute(3, variable_instance_set, [char_player, "dir", DIR.UP]);
			C_Wait(3, 10);
			C_Execute(4, variable_instance_set, [char_player, "dir", DIR.DOWN]);
			C_Wait(4, 30);
			C_Execute(5, instance_create_depth, [char_player.x, char_player.y - char_player.sprite_width - 15, 0, exclamation]);
			C_Execute(5, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
			C_Execute(5, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.0"), "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
			C_Execute(5, Dialog_Start, [true]);
			C_WaitUntilDestroy(5, ui_dialog);
			C_Execute(6, variable_instance_set, [char_player, "dir", DIR.DOWN]);
			C_MoveChar(6, char_serval, 200, 265, false, 60);
			C_Execute(6, BGM_SetVolume, [0, 0, 30]);
			C_Wait(6, 60);
			C_Execute(7, BGM_Stop, [0]);
			C_Execute(7, BGM_Play, [0, bgm_serval]);
			C_Execute(7, variable_instance_set, [char_serval, "dir", DIR.UP]);
			C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.1"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.2"), "{char_link 2}{voice 4}{face 2}{face_emotion 1}"]);
			C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.3"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(7, Dialog_Start, [true]);
			C_WaitUntilDestroy(7, ui_dialog);
			C_Wait(8, 30);
			C_Execute(9, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.4"), "{char_link 2}{voice 4}{face 2}{face_emotion 4}"]);
			C_Execute(9, Dialog_Start, [true]);
			C_WaitUntilDestroy(9, ui_dialog);
			C_Execute(10, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.5"), "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
			C_Execute(10, Dialog_Start, [true]);
			C_WaitUntilDestroy(10, ui_dialog);
			C_Execute(11, variable_instance_set, [char_serval, "dir", DIR.UP]);
			C_Execute(11, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.6"), "{char_link 2}{voice 4}{face 2}{face_emotion 4}"]);
			C_Execute(11, Dialog_Start, [true]);
			C_WaitUntilDestroy(11, ui_dialog);
			C_Execute(12, variable_instance_set, [char_player, "dir", DIR.UP]);
			/*C_Wait(4, 30);
			C_MoveChar(5, char_player, 0, -20, true, 30);
			C_Wait(5, 30);
			C_PlaySfx(6, snd_exclamation);
			C_CreateAnim(6, char_serval, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_serval.y, -5, 3, true);
			C_CreateAnim(6, char_serval, "y", ANIM_TWEEN.SINE, ANIM_EASE.IN, char_serval.y, 5, 3, true, 3);
			C_Wait(6, 6);
			C_CreateAnim(7, char_serval, "y", 0, 0, char_serval.y, char_player.y, 5, false);
			C_CreateAnim(7, char_serval, "y", 0, 0, char_serval.y, 250, 5, false, 5);
			C_CreateAnim(7, char_player, "y", 0, 0, char_player.y, 250, 5, false, 5);
			C_Wait(7, 10);
			C_PlaySfx(8, snd_noise);
			C_Execute(8, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
			C_Execute(8, variable_instance_set, [char_serval, "dir", DIR.LEFT]);
			C_CreateAnim(8, char_serval, "x", 0, 0, char_serval.x, 40, 30, true);
			C_CreateAnim(8, char_serval, "image_index", 0, 0, 0, 8, 30, false);
			*/
			C_Wait(12, 60);
			C_Execute(13, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.7"), "{voice 4}{face 2}{face_emotion 4}"]);
			C_Execute(13, Dialog_Start, [true]);
			C_WaitUntilDestroy(13, ui_dialog);
			C_Execute(14, variable_instance_set, [char_serval, "dir", DIR.DOWN]);
			C_Wait(14, 30);
			C_Execute(15, variable_instance_set, [char_serval, "dir", DIR.UP]);
			C_PlaySfx(15, snd_exclamation);
			C_CreateAnim(15, char_serval, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_serval.y, -5, 3, true);
			C_CreateAnim(15, char_serval, "y", ANIM_TWEEN.SINE, ANIM_EASE.IN, char_serval.y, 5, 3, true, 3);
			C_Wait(15, 15);
			C_CreateAnim(16, char_serval, "y", 0, 0, char_serval.y, char_player.y, 5, false);
			C_CreateAnim(16, char_serval, "y", 0, 0, char_serval.y-(char_serval.y-char_player.y), 250, 5, false, 5);
			C_CreateAnim(16, char_player, "y", 0, 0, char_player.y, 250, 5, false, 5);
			C_Wait(16, 10);
			C_PlaySfx(17, snd_noise);
			C_Execute(17, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
			C_Execute(17, variable_instance_set, [char_serval, "dir", DIR.LEFT]);
			C_CreateAnim(17, char_serval, "x", 0, 0, char_serval.x, 40, 30, true);
			C_CreateAnim(17, char_serval, "image_index", 0, 0, 0, 8, 30, false);
			C_Wait(17, 30);
			C_Execute(18, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.8"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
			C_Execute(18, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.9"), "{char_link 2}{voice 4}{face 2}{face_emotion 5}"]);
			C_Execute(18, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.10"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(18, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.greet.11"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
			C_Execute(18, Dialog_Start, [true]);
			C_WaitUntilDestroy(18, ui_dialog);
			C_MoveChar(19, char_serval, 420, 260, false, 60);
			C_Execute(19, BGM_SetVolume, [0, 0, room_speed]);
			C_Wait(19, 60);
			C_MoveChar(20, camera, char_player.x - (camera.width / camera.scale_x / 2), char_player.y - (camera.width / camera.scale_y / 2), false, 30);
			C_Wait(20, 30);
			C_Execute(21, variable_instance_set, [camera, "target", char_player]);
			C_Execute(21, Flag_Set, [FLAG_TYPE.STATIC, FLAG_STATIC.SCENE_001, true]);
			Cutscene_End(21);
		}
		else {
			instance_destroy(char_serval);
		}
		break;
	case room_savannah_1:
		if (Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SCENE_002,false)==false){
			if (Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.HAD_CONVERSATION)==false){
				if (phase == 0) {
					C_Wait(0, 1);
					C_MoveChar(1, char_player, 40, 230, false, 30);
					C_Wait(1, 29);
					C_Execute(2, variable_instance_set, [char_player, "dir", DIR.UP]);
					C_Wait(2, 30);
					C_Execute(3, instance_create_depth, [char_serval.x, char_serval.y - char_serval.sprite_height - 5, 0, exclamation]);
					C_Execute(3, variable_instance_set, [char_serval, "dir", DIR.DOWN]);
					C_Execute(3, variable_instance_set, [char_player, "dir", DIR.UP]);
					C_Execute(3, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.new_friend.0"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(3, Dialog_Start, [true]);
					C_WaitUntilDestroy(3, ui_dialog);
					C_Execute(4, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
					C_Execute(4, variable_instance_set, [char_serval, "dir", DIR.RIGHT]);
					C_Execute(4, variable_instance_set, [camera, "target", noone]);
					C_MoveChar(4, camera, 330 - (camera.width / camera.scale_x / 2), char_player.y - (camera.width / camera.scale_x / 2), false, 60);
					C_Wait(4, 60);
					C_Wait(5, 30);
					C_MoveChar(6, camera, max(0, char_player.x - (camera.width / camera.scale_x / 2)), char_player.y - (camera.width / camera.scale_x / 2), false, 60);
					C_Wait(6, 90);
					C_Execute(7, variable_instance_set, [camera, "target", char_player]);
					C_Execute(7, variable_instance_set, [char_player, "dir", DIR.UP]);
					C_Execute(7, variable_instance_set, [char_serval, "dir", DIR.DOWN]);
					C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.new_friend.1"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.new_friend.2"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.new_friend.3"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(7, Dialog_Start, [true]);
					C_WaitUntilDestroy(7, ui_dialog);
					C_Execute(8, variable_instance_set, [char_serval, "dir", DIR.RIGHT]);
					C_Wait(8, 30);
					C_Execute(9, variable_instance_set, [char_serval, "dir", DIR.DOWN]);
					C_Execute(9, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.new_friend.4"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(9, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.new_friend.5"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(9, Dialog_Start, [true]);
					C_WaitUntilDestroy(9, ui_dialog);
					C_Execute(10, variable_instance_set, [cutscene_room, "phase", 1]);
					C_Execute(10, instance_activate_object, [char_forcefield]);
					Cutscene_End(10);
				}
				else if (phase == 1) {
					char_player.collision = true;
					char_player.block_enabled = true;
					instance_activate_object(char_forcefield);
					if (char_player.x > 300) {
						Cutscene_Begin();
						phase = 2;
					}
				}
				else if (phase == 2) {
					C_Execute(0, instance_create_depth, [char_zebra.x, char_zebra.y - char_zebra.sprite_height - 5, 0, exclamation]);
					C_Wait(0, 30);
					C_Execute(1, variable_instance_set, [char_zebra, "sprite_index", spr_char_zebra_shy]);
					C_Execute(1, variable_instance_set, [char_zebra, "interacted", true]);
					C_Execute(1, array_set, [char_zebra.res_idle_sprite, DIR.DOWN, spr_char_zebra_shy]);
					C_Execute(1, array_set, [char_zebra.res_talk_sprite, DIR.DOWN, spr_char_zebra_shy]);
					C_Execute(1, Dialog_Add_Ext, [Lang_GetString("cutscene.zebra.greet.0"), "{voice 6}{char_link 3}"]);
					C_Execute(1, Dialog_Add_Ext, [Lang_GetString("cutscene.zebra.greet.1"), "{voice 6}{char_link 3}"]);
					C_Execute(1, Dialog_Start, [true]);
					C_WaitUntilDestroy(1, ui_dialog);
					C_Execute(2, variable_instance_set, [char_zebra, "sprite_index", spr_char_zebra_happy]);
					C_Execute(2, array_set, [char_zebra.res_idle_sprite, DIR.DOWN, spr_char_zebra_happy]);
					C_Execute(2, array_set, [char_zebra.res_talk_sprite, DIR.DOWN, spr_char_zebra_happy]);
					C_Wait(2, 30);
					C_Execute(3, Dialog_Add_Ext, [Lang_GetString("cutscene.zebra.greet.2"), "{voice 6}{char_link 3}"]);
					C_Execute(3, Dialog_Start, [true]);
					C_WaitUntilDestroy(3, ui_dialog);
					C_Execute(4, variable_instance_set, [cutscene_room, "phase", 0]);
					C_Execute(4, Encounter_Start, [4, true, false]);
					C_Execute(4, part_system_destroy, [particle.partsystem]);
					Cutscene_End(4);
				}
				else if (phase == 3) {
					/*randomize();
					var rndm = random(100);
					if (rndm > 98) {
						Object_Shake(2, "x", char_zebra, 0, true);
						Object_Shake(2, "y", char_zebra, 0, true);
					}*/
				}
			}
			else {
				if (phase == 0) {
					if(char_player.x<=210) {
						Cutscene_Begin();
						phase = 1;
					}
				}
				if (phase == 1) {
					C_MoveChar(0, char_serval, char_player.x - 50, char_player.y, false, 30);
					C_Wait(0, 60);
					C_Execute(1, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.post_convo.0"), "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
					C_Execute(1, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.post_convo.1"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
					C_Execute(1, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.post_convo.2"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(1, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.post_convo.3"), "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
					C_Execute(1, Dialog_Start, [true]);
					C_WaitUntilDestroy(1, ui_dialog);
					C_MoveChar(2, char_serval, 170, 230, false, 15);
					C_Wait(2, 30);
					C_MoveChar(3, char_serval, 170, 360, false, 30);
					C_Wait(3, 60);
					C_Execute(4, Flag_Set, [FLAG_TYPE.STATIC, FLAG_STATIC.SCENE_002, true]);
					C_Execute(4, instance_destroy, [char_serval]);
					C_Execute(4, instance_destroy, [char_forcefield]);
					C_Execute(4, instance_activate_object, [trigger_warp]);
					Cutscene_End(4);
				}
			}
		}
		else {
			if (teleportedChar == true) { 
				instance_destroy(char_zebra);
			}
			instance_destroy(char_serval);
			instance_destroy(char_forcefield);
		}
		break;
	case room_savannah_2:
		camera.offset_amount_y=0.9;
		if (Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SCENE_003,false)==false){
			if (phase == 0) {
				if (char_player.x > 500) {
					Cutscene_Begin();
					phase = 1;
				}
				else Cutscene_End(-1);
			}
			else if (phase == 1) {
				C_MoveChar(0, char_player, char_serval.x - 25, char_serval.y, false, 30);
				C_Wait(0, 60);
				C_Execute(1, variable_instance_set, [char_serval, "dir", DIR.LEFT]);
				C_Wait(1, 30);
				C_Execute(2, variable_instance_set, [char_serval, "dir", DIR.UP]);
				C_Wait(2, 30);
				C_Execute(3, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.mountain.0"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
				C_Execute(3, Dialog_Start, [false]);
				C_WaitUntilDestroy(3, ui_dialog);
				C_Execute(4, variable_instance_set, [char_player, "dir", DIR.UP]);
				C_Wait(4, 30);
				C_Execute(5, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.mountain.1"), "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
				C_Execute(5, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.mountain.2"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
				C_Execute(5, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.mountain.3"), "{char_link 2}{voice 4}{face 2}{face_emotion 4}"]);
				C_Execute(5, Dialog_Start, [false]);
				C_WaitUntilDestroy(5, ui_dialog);
				C_Execute(6, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
				C_Wait(6, 30);
				C_Execute(7, Dialog_Add_Ext, [Lang_GetString("cutscene.serval.mountain.4"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
				C_Execute(7, Dialog_Start, [false]);
				C_WaitUntilDestroy(7, ui_dialog);
				C_Execute(8, variable_instance_set, [char_serval, "dir_locked", true]);
				C_Execute(8, Flag_Set, [FLAG_TYPE.STATIC, FLAG_STATIC.SCENE_003, true]);
				Cutscene_End(8);
			}
		}
		else {
		}
		break;
	case room_savannah_3:
		if (Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.SCENE_004,false)==false){
			if (phase == 0) {
				if (char_player.x > 160) {
					Cutscene_Begin();
					phase = 1;
				}
				else Cutscene_End(-1);
			}
			else if (phase == 1) {
				if (global.event == 1) {
					char_hippo.sprite_index = spr_char_hippo_water_talk_laugh;
					char_hippo.res_idle_sprite[DIR.DOWN] = spr_char_hippo_water_talk_laugh;
					char_hippo.res_talk_sprite[DIR.DOWN] = spr_char_hippo_water_talk_laugh;
					char_hippo.dir = DIR.DOWN;
				}
				if (global.event == 2) {
					char_hippo.res_idle_sprite[DIR.DOWN] = spr_char_hippo_water_idle;
					char_hippo.res_talk_sprite[DIR.DOWN] = spr_char_hippo_water_talk;
					char_hippo.dir = DIR.DOWN;
				}
				if (global.event == 3) {
					char_hippo.sprite_index = spr_char_hippo_water_talk_shocked;
					char_hippo.res_idle_sprite[DIR.DOWN] = spr_char_hippo_water_talk_shocked;
					char_hippo.res_talk_sprite[DIR.DOWN] = spr_char_hippo_water_talk_shocked;
					char_hippo.dir = DIR.DOWN;
				}
				
				C_Execute(0, BGM_SetVolume, [0, 0, 30]);
				C_MoveChar(0, char_player, 280, 310, false, 30);
				C_Wait(0, 30);
				C_Execute(1, variable_instance_set, [char_player, "dir", DIR.UP]);
				C_Wait(1, 30);
				C_Execute(2, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.0"), ""]);
				C_Execute(2, Dialog_Start, [false]);
				C_WaitUntilDestroy(2, ui_dialog);
				C_Wait(3, 60);
				C_FadeFader(4, 1, 0, 7, 0, c_white);
				C_PlaySfx(4, bgm_hippo_appear, 0.95);
				C_PlaySfx(4, snd_damage, 0.95);
				C_Execute(4, variable_instance_set, [camera, "target", char_hippo]);
				C_Execute(4, variable_instance_set, [camera, "scale_x", 3]);
				C_Execute(4, variable_instance_set, [camera, "scale_y", 3]);
				C_Execute(4, variable_instance_set, [camera, "angle", 6]);
				C_Execute(4, Camera_Shake, [10, 10, 0, 0, true, true]);
				C_Execute(4, instance_create_depth, [camera.x, camera.y, 0, ui_action_lines]);
				C_Execute(4, variable_instance_set, [char_hippo, "visible", true]);
				C_Execute(4, variable_instance_set, [char_hippo, "sprite_index", spr_char_hippo_water]);
				C_Execute(4, variable_instance_set, [char_hippo, "image_speed", 1]);
				C_Wait(4, 33);
				C_CreateAnim(5, camera, "target", 0, 0, camera.target, noone, 1, false, 15);
				C_CreateAnim(5, camera, "target", 0, 0, noone, char_player, 1, false, 30);
				C_CreateAnim(5, camera, "scale_x", ANIM_TWEEN.CIRC, ANIM_EASE.OUT, camera.scale_x, 2, 15, false);
				C_CreateAnim(5, camera, "scale_y", ANIM_TWEEN.CIRC, ANIM_EASE.OUT, camera.scale_y, 2, 15, false);
				C_CreateAnim(5, camera, "angle", ANIM_TWEEN.CIRC, ANIM_EASE.OUT, camera.angle, 0, 15, false);
				C_CreateAnim(5, ui_action_lines, "image_alpha", 0, 0, 1, 0, 15, false, 15);
				C_CreateAnim(5, camera, "x", 0, 0, char_hippo.x - (camera.width / 4), char_player.x - (camera.width / 4), 15, false, 15);
				C_CreateAnim(5, camera, "y", 0, 0, char_hippo.y - (camera.width / 4), char_player.y - (camera.width / 4), 15, false, 15);
				C_Execute(5, variable_instance_set, [char_hippo, "sprite_index", spr_char_hippo_water_appear]);
				C_Execute(5, variable_instance_set, [char_hippo, "direction", point_direction(char_hippo.x, char_hippo.y, char_player.x, char_player.y)]);
				C_Execute(5, array_set, [char_hippo.res_idle_sprite, DIR.DOWN, spr_char_hippo_water_idle_angry]);
				C_Execute(5, array_set, [char_hippo.res_talk_sprite, DIR.DOWN, spr_char_hippo_water_talk_angry]);
				C_Wait(5, 45);
				C_Execute(6, instance_destroy, [ui_action_lines]);
				C_Execute(6, variable_instance_set, [camera, "target", noone]);
				C_Execute(6, BGM_Stop, [0]);
				C_Execute(6, BGM_Play, [0, bgm_hippo]);
				C_Execute(6, BGM_SetPitch, [0, 0.95]);
				C_Execute(6, variable_instance_set, [char_hippo, "image_speed", 1]);
				C_Execute(6, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.1"), "{char_link 4}{voice 5}"]);
				C_Execute(6, Dialog_Start, [false]);
				C_WaitUntilDestroy(6, ui_dialog);
				C_Execute(7, variable_instance_set, [char_hippo, "speed", 0.25]);
				C_Execute(7, variable_instance_set, [char_player, "vspeed", 0.1]);
				C_Execute(7, variable_instance_set, [char_player, "image_speed", 0.25]);
				C_Wait(7, 30);
				C_Execute(8, variable_instance_set, [char_hippo, "speed", 0]);
				C_Execute(8, variable_instance_set, [char_player, "vspeed", 0]);
				C_Execute(8, variable_instance_set, [char_player, "image_index", 0]);
				C_Execute(8, variable_instance_set, [char_player, "image_speed", 0]);
				C_Execute(8, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.2"), "{char_link 4}{voice 5}"]);
				C_Execute(8, Dialog_Start, [false]);
				C_WaitUntilDestroy(8, ui_dialog);
				C_Execute(9, variable_instance_set, [char_hippo, "speed", 0.25]);
				C_Execute(9, variable_instance_set, [char_player, "vspeed", 0.1]);
				C_Execute(9, variable_instance_set, [char_player, "image_speed", 0.25]);
				C_Wait(9, 30);
				C_Wait(10, 30);
				C_Execute(11, BGM_Stop, [0]);
				C_Execute(11, variable_instance_set, [char_hippo, "speed", 0]);
				C_Execute(11, variable_instance_set, [char_player, "vspeed", 0]);
				C_Execute(11, variable_instance_set, [char_player, "image_index", 0]);
				C_Execute(11, variable_instance_set, [char_player, "image_speed", 0]);
				C_Execute(11, array_set, [char_hippo.res_idle_sprite, DIR.DOWN, spr_char_hippo_water_idle_blink]);
				C_Execute(11, array_set, [char_hippo.res_talk_sprite, DIR.DOWN, spr_char_hippo_water_talk_blink]);
				C_Execute(11, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.3"), "{char_link 4}{effect 0}{voice 5}"]);
				C_Execute(11, Dialog_Start, [false]);
				C_WaitUntilDestroy(11, ui_dialog);
				C_Execute(12, array_set, [char_hippo.res_idle_sprite, DIR.DOWN, spr_char_hippo_water_idle_shocked]);
				C_Execute(12, array_set, [char_hippo.res_talk_sprite, DIR.DOWN, spr_char_hippo_water_talk_shocked]);
				C_Execute(12, instance_create_depth, [char_hippo.x, char_hippo.y - char_hippo.sprite_height - 5, 0, exclamation]);
				C_Execute(12, instance_create_depth, [char_player.x, char_player.y - char_player.sprite_height - 5, 0, exclamation]);
				C_Execute(12, variable_instance_set, [char_hippo, "sprite_index", spr_char_hippo_water_idle_shocked]);
				C_Execute(12, variable_instance_set, [char_player, "dir", DIR.LEFT]);
				C_Execute(12, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.4"), "{voice 4}{face 2}{face_emotion 6}"]);
				C_Execute(12, Dialog_Start, [true]);
				C_WaitUntilDestroy(12, ui_dialog);
				C_Execute(13, instance_create_depth, [110, 240, -2000, char_serval]);
				C_MoveChar(13, char_serval, 150, 310, false, 30);
				C_Wait(13, 30);
				C_Execute(14, variable_instance_set, [char_hippo, "sprite_index", spr_char_hippo_water_idle]);
				C_Execute(14, array_set, [char_hippo.res_idle_sprite, DIR.DOWN, spr_char_hippo_water_idle]);
				C_Execute(14, array_set, [char_hippo.res_talk_sprite, DIR.DOWN, spr_char_hippo_water_talk]);
				C_Execute(14, array_set, [char_hippo.res_move_sprite, DIR.RIGHT, spr_char_hippo_water_idle]);
				C_MoveChar(14, char_serval, char_player.x - 30, char_player.y, false, 30);
				C_Wait(14, 30);
				C_Execute(15, variable_instance_set, [char_serval, "dir", DIR.UP]);
				C_Execute(15, variable_instance_set, [char_player, "dir", DIR.UP]);
				C_Wait(15, 30);
				C_Execute(16, BGM_Play, [0, bgm_savannah]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.5"), "{char_link 2}{voice 4}{face 2}{face_emotion 6}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.6"), "{char_link 4}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.7"), "{char_link 2}{voice 4}{face 2}{face_emotion 6}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.8"), "{char_link 4}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.9"), "{char_link 2}{voice 4}{face 2}{face_emotion 9}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.10"), "{char_link 4}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.11"), "{char_link 2}{voice 4}{face 2}{face_emotion 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.12"), "{char_link 4}{event 3}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.13"), "{char_link 4}{event 2}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.14"), "{char_link 4}{event 1}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.15"), "{char_link 2}{voice 4}{face 2}{face_emotion 4}{event 2}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.16"), "{char_link 4}{event 1}{voice 5}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.17"), "{char_link 2}{voice 4}{face 2}{face_emotion 6}{event 2}"]);
				C_Execute(16, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.18"), "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
				C_Execute(16, Dialog_Start, [true]);
				C_WaitUntilDestroy(16, ui_dialog);
				C_MoveChar(17, char_player, 20, 0, true, 30);
				C_MoveChar(17, char_serval, 20, 0, true, 30);
				C_Wait(17, 20);
				C_CreateAnim(18, char_hippo, "x", 0, 0, char_hippo.x, char_player.x, 10, false);
				C_Wait(18, 10);
				C_Execute(19, variable_instance_set, [char_serval, "dir", DIR.UP]);
				C_Execute(19, variable_instance_set, [char_player, "dir", DIR.UP]);
				C_Execute(19, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.19"), "{char_link 4}{voice 5}"]);
				C_Execute(19, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.20"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
				C_Execute(19, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.21"), "{char_link 4}{voice 5}"]);
				C_Execute(19, Dialog_Add, [Lang_GetString("cutscene.savannah.lake.22"), "{char_link 2}{voice 4}{face 2}{face_emotion 7}"]);
				C_Execute(19, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.23"), "{char_link 2}{voice 4}{face 2}{face_emotion 6}"]);
				C_Execute(19, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.24"), "{char_link 4}{voice 5}"]);
				C_Execute(19, Dialog_Start, [true]);
				C_WaitUntilDestroy(19, ui_dialog);
				C_CreateAnim(20, char_hippo, "x", 0, 0, char_hippo.x, char_player.x, 15, false);
				C_Wait(20, 30);
				C_Execute(21, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.25"), "{char_link 4}{voice 5}"]);
				C_Execute(21, Dialog_Start, [true]);
				C_WaitUntilDestroy(21, ui_dialog);
				C_Wait(22, 60);
				C_Execute(23, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.26"), "{char_link 4}{voice 5}"]);
				C_Execute(23, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.27"), "{char_link 4}{voice 5}"]);
				C_Execute(23, Dialog_Start, [true]);
				C_WaitUntilDestroy(23, ui_dialog);
				C_Execute(24, variable_instance_set, [char_player, "dir", DIR.DOWN]);
				C_Wait(24, 60);
				C_Execute(25, variable_instance_set, [char_player, "dir", DIR.UP]);
				C_Execute(25, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.28"), "{char_link 4}{voice 5}"]);
				C_Execute(25, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.29"), "{char_link 4}{voice 5}"]);
				C_Execute(25, Dialog_Start, [true]);
				C_WaitUntilDestroy(25, ui_dialog);
				C_Wait(26, 30);
				C_MoveChar(27, char_player, 0, 10, true, 15);
				C_Wait(27, 60);
				if (instance_exists(char_serval)) C_CreateAnim(28, char_hippo, "x", 0, 0, char_hippo.x, char_serval.x + 10, 15, false);
				C_Execute(28, variable_instance_set, [char_serval, "dir", DIR.UP]);
				C_Execute(28, variable_instance_set, [char_player, "dir", DIR.UP]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.30"), "{char_link 4}{voice 5}"]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.31"), "{char_link 4}{voice 5}"]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.32"), "{char_link 4}{voice 5}"]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.33"), "{char_link 2}{voice 4}{face 2}{face_emotion 4}"]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.34"), "{char_link 4}{voice 5}"]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.35"), "{char_link 2}{voice 4}{face 2}{face_emotion 6}{scale 0.75}"]);
				C_Execute(28, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.36"), "{char_link 4}{voice 5}"]);
				C_Execute(28, Dialog_Start, [true]);
				C_WaitUntilDestroy(28, ui_dialog);
				C_Execute(29, BGM_SetVolume, [0, 0, 60]);
				C_FadeFader(29, 0, 1, 60, 0, c_black);
				C_Wait(29, 120);
				C_Execute(30, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.37"), ""]);
				C_Execute(30, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.38"), ""]);
				C_Execute(30, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.39"), ""]);
				C_Execute(30, Dialog_Start, [false]);
				C_WaitUntilDestroy(30, ui_dialog);
				C_FadeFader(31, 1, 0, 60);
				C_Execute(31, BGM_SetVolume, [0, 1, 60]);
				C_Wait(31, 120);
				C_Execute(32, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.40"), "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
				C_Execute(32, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.41"), "{char_link 4}{voice 5}"]);
				C_Execute(32, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.42"), "{char_link 4}{voice 5}"]);
				C_Execute(32, Dialog_Add_Ext, [Lang_GetString("cutscene.savannah.lake.43"), "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
				C_Execute(32, Dialog_Start, [true]);
				C_WaitUntilDestroy(32, ui_dialog);
				C_MoveChar(33, char_serval, 500, 310, false, 120);
				C_MoveChar(33, camera, char_player.x - (camera.width / camera.scale_x / 2), 180 - 10, false, 60);
				C_Execute(33, Flag_Set, [FLAG_TYPE.STATIC, FLAG_STATIC.CAN_RUN, true]);
				C_Wait(33, 120);
				C_Execute(34, variable_instance_set, [camera, "target", char_player]);
				C_Execute(34, instance_destroy, [char_serval]);
				C_Execute(34, Flag_Set, [FLAG_TYPE.STATIC, FLAG_STATIC.SCENE_004, true]);
				Cutscene_End(34);
			}
		}
		else {
			if (teleportedChar == true) { 
				instance_destroy(char_hippo);
			}
			instance_destroy(char_forcefield);
		}
		break;
	case room_savannah_4:
		if (phase == 0) {
			C_MoveChar(0, char_player, 270, char_player.y, false, 100);
			C_Wait(0, 45);
			C_Execute(1, instance_create_depth, [char_serval.x, char_serval.y - char_serval.sprite_height - 5, 0, exclamation]);
			C_Wait(1, 45);
			C_CreateAnim(2, char_serval, "y", 0, 0, char_serval.y, char_player.y - 2, 5, false);
			C_CreateAnim(2, char_serval, "x", 0, 0, char_serval.x, char_player.x + 17, 5, false, 5);
			C_CreateAnim(2, char_serval, "x", 0, 0, char_player.x + 17, char_serval.xstart - 10, 15, false, 10);
			C_CreateAnim(2, char_player, "x", 0, 0, char_player.x + 27, char_serval.xstart - 5, 15, false, 10);
			C_CreateAnim(2, char_serval, "y", 0, 0, char_player.y - 2, char_serval.ystart, 15, false, 25);
			C_CreateAnim(2, char_player, "y", 0, 0, char_player.y, char_serval.ystart - 5, 15, false, 25);
			C_CreateAnim(2, char_serval, "x", 0, 0, char_serval.xstart - 10, -20, 15, true, 45);
			C_CreateAnim(2, camera, "target", 0, 0, camera.target, noone, 1, false, 10);
			C_CreateAnim(2, char_serval, "image_index", 0, 0, 0, 10, 45, false);
			C_CreateAnim(2, char_player, "image_index", 0, 0, 0, 10, 25, false, 10);
			C_CreateAnim(2, char_player, "sprite_index", 0, 0, char_player.sprite_index, spr_char_kaban_right_carried, 1, false, 10);
			C_CreateAnim(2, char_player, "dir", 0, 0, DIR.DOWN, DIR.LEFT, 1, false, 10);
			C_CreateAnim(2, char_player, "image_angle", 0, 0, 0, 12, 5, false, 10);
			C_CreateAnim(2, char_serval, "sprite_index", 0, 0, char_serval.sprite_index, spr_char_serval_left_carry, 1, false, 10);
			C_CreateAnim(2, char_serval, "sprite_index", 0, 0, char_serval.sprite_index, spr_char_serval_down_carry, 1, false, 25);
			C_CreateAnim(2, char_serval, "sprite_index", 0, 0, char_serval.sprite_index, spr_char_serval_right, 1, false, 45);
			C_CreateAnim(2, char_player, "sprite_index", 0, 0, spr_char_kaban_right_carried, spr_char_kaban_left, 1, false, 45);
			C_CreateAnim(2, char_player, "image_angle", 0, 0, 12, 0, 5, false, 45);
			C_Wait(2, 10);
			C_PlaySfx(3, snd_noise);
			C_Wait(3, 50);
			C_Execute(4, variable_instance_set, [char_player, "dir", DIR.LEFT]);
			C_Execute(4, Dialog_Add_Ext, ["* What do you think&  you're doing?!", "{char_link 2}{voice 4}{face 2}{face_emotion 6}"]);
			C_Execute(4, Dialog_Add_Ext, ["* Could you please happen&  to know there is a threat&  for just a single second?", "{char_link 2}{voice 4}{face 2}{face_emotion 6}"]);
			C_Execute(4, Dialog_Start, [true]);
			C_WaitUntilDestroy(4, ui_dialog);
			C_Wait(5, 30);
			C_Execute(6, BGM_Play, [0, bgm_concern]);
			C_Execute(6, Dialog_Add_Ext, ["* Look, just listen to&  Hippo-chan.", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(6, Dialog_Add_Ext, ["* I'm aware her voice is&  frustrating to listen&  to, but this is critical.", "{char_link 2}{voice 4}{face 2}{face_emotion 9}"]);
			C_Execute(6, Dialog_Add_Ext, ["* She isn't actually a&  perv or anything, she's&  just...", "{char_link 2}{voice 4}{face 2}{face_emotion 8}"]);
			C_Execute(6, Dialog_Add_Ext, ["* She's just knowledgable&  about self-defense!", "{char_link 2}{voice 4}{face 2}{face_emotion 5}"]);
			C_Execute(6, Dialog_Start, [true]);
			C_WaitUntilDestroy(6, ui_dialog);
			C_Execute(7, variable_instance_set, [camera, "target", noone]);
			C_Execute(7, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
			C_MoveChar(7, camera, 440, camera.y, false, 60);
			C_Wait(7, 90);
			C_Execute(8, Dialog_Add_Ext, ["* But this is what&  worries me the most.", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(8, Dialog_Add_Ext, ["* To this day, I still&  remember the folk living&  here like yesterday...", "{char_link 2}{voice 4}{face 2}{face_emotion 9}"]);
			C_Execute(8, Dialog_Add_Ext, ["* But now they need my&  help.", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(8, Dialog_Add_Ext, ["* I've got to stop being&  clumsy for once too.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
			C_Execute(8, Dialog_Start, [true]);
			C_WaitUntilDestroy(8, ui_dialog);
			C_MoveChar(9, camera, char_player.x - (camera.width / camera.scale_x / 2), camera.y, false, 60);
			C_Wait(9, 90);
			C_Execute(10, variable_instance_set, [char_player, "dir", DIR.LEFT]);
			C_Execute(10, Dialog_Add_Ext, ["* You see, Kaban. &* It's too dangerous&  for you.", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(10, Dialog_Add_Ext, ["* So go find the nicest&  hiding place, OK?", "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
			C_Execute(10, Dialog_Add_Ext, ["* And leave the job to me.", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(10, Dialog_Add_Ext, ["&   {choice 0}Yes                     {choice 1}No {choice `TMP`}", "{instant true}"]);
			C_Execute(10, Dialog_Start, [true]);
			C_WaitUntilDestroy(10, ui_dialog);
			C_Execute(11, variable_instance_set, [id, "phase", 1]);
			Cutscene_End(11);
		}
		else if (phase == 1) {
			if (Player_GetTextTyperChoice() == 0) {
				Cutscene_Begin();
				phase = 1.5;
			}
			else {
				Cutscene_Begin();
				phase = 1.6;
			}
		}
		else if (phase == 1.5) {
			C_Execute(0, Dialog_Add_Ext, ["* I know you'd&  understand me, KABAN.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
			C_Execute(0, Dialog_Add_Ext, ["* Now quick!{w}&* Go back to the&  lake!", "{char_link 2}{voice 4}{face 2}{face_emotion 6}"]);
			C_Execute(0, Dialog_Start, [true]);
			C_WaitUntilDestroy(0, ui_dialog);
			C_Execute(1, BGM_SetVolume, [0, 0, 60]);
			C_MoveChar(1, char_player, 40, char_player.ystart, false, 90);
			C_MoveChar(1, camera, 0, 0, false, 90);
			C_MoveChar(1, char_serval, 240, char_player.ystart, false, 30);
			C_Wait(1, 30);
			C_MoveChar(2, char_serval, 630, char_player.ystart, false, 60);
			C_Wait(2, 90);
			C_Execute(3, BGM_Stop, [0]);
			C_PlaySfx(3, snd_serval_talk_loop, 1, 0.5);
			C_Execute(3, instance_create_depth, [char_player.x, char_player.y - char_player.sprite_height - 5, 0, exclamation]);
			C_Execute(3, variable_instance_set, [char_player, "dir", DIR.RIGHT]);
			C_Wait(3, 60);
			C_Execute(4, variable_instance_set, [camera, "target", char_player]);
			C_MoveChar(4, char_player, 550, char_player.y, false, 90, true);
			C_Wait(4, 60);
			C_PlaySfx(5, snd_noise);
			C_Wait(5, 5);
			C_PlaySfx(6, snd_noise);
			C_Wait(6, 5);
			C_PlaySfx(7, snd_noise);
			C_Wait(7, 20);
			C_Execute(8, Encounter_Start, [1, true, false]);
			C_Execute(8, part_system_destroy, [particle.partsystem]);
			Cutscene_End(8);
		}
		break;
}