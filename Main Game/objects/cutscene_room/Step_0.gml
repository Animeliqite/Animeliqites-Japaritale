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
			C_Execute(5, Dialog_Add_Ext, ["* Oh dear, I'm glad&  you’re awake!", "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
			C_Execute(5, Dialog_Start, [true]);
			C_WaitUntilDestroy(5, ui_dialog);
			C_Execute(6, variable_instance_set, [char_player, "dir", DIR.DOWN]);
			C_MoveChar(6, char_serval, 200, 265, false, 60);
			C_Wait(6, 60);
			C_Execute(7, BGM_Stop, [0]);
			C_Execute(7, BGM_Play, [0, bgm_serval]);
			C_Execute(7, variable_instance_set, [char_serval, "dir", DIR.UP]);
			C_Execute(7, Dialog_Add_Ext, ["* It was very unnerving&  for me to see you like&  this!", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(7, Dialog_Add_Ext, ["* That numbness of yours&  has frightened me even&  more!", "{char_link 2}{voice 4}{face 2}{face_emotion 1}"]);
			C_Execute(7, Dialog_Add_Ext, ["* I hope I was able to&  make you feel better&  after all this.", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(7, Dialog_Start, [true]);
			C_WaitUntilDestroy(7, ui_dialog);
			C_Wait(8, 30);
			C_Execute(9, Dialog_Add_Ext, ["* Yes?", "{char_link 2}{voice 4}{face 2}{face_emotion 4}"]);
			C_Execute(9, Dialog_Start, [true]);
			C_WaitUntilDestroy(9, ui_dialog);
			C_Execute(10, variable_instance_set, [char_serval, "dir", DIR.DOWN]);
			C_Execute(10, array_set, [char_serval.res_idle_sprite, DIR.DOWN, spr_char_serval_down_happy]);
			C_Execute(10, array_set, [char_serval.res_talk_sprite, DIR.DOWN, spr_char_serval_down_happy]);
			C_Execute(10, Dialog_Add_Ext, ["* Ahhh... I can feel my&  capabilities already&  paying off!", "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
			C_Execute(10, Dialog_Start, [true]);
			C_WaitUntilDestroy(10, ui_dialog);
			C_Execute(11, variable_instance_set, [char_serval, "dir", DIR.UP]);
			C_Execute(11, array_set, [char_serval.res_idle_sprite, DIR.DOWN, spr_char_serval_down]);
			C_Execute(11, array_set, [char_serval.res_talk_sprite, DIR.DOWN, spr_char_serval_down]);
			C_Execute(11, Dialog_Add_Ext, ["* Now tell me, what kind&  of a FRIEND are you?", "{char_link 2}{voice 4}{face 2}{face_emotion 4}"]);
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
			C_Execute(13, Dialog_Add_Ext, ["* You... don't even know?", "{voice 4}{face 2}{face_emotion 4}"]);
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
			C_Execute(18, Dialog_Add_Ext, ["* There isn't any need to&  worry since the Japari&  Library exists!", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
			C_Execute(18, Dialog_Add_Ext, ["* It'll take you moments&  traverse through&  areas and that's it.", "{char_link 2}{voice 4}{face 2}{face_emotion 5}"]);
			C_Execute(18, Dialog_Add_Ext, ["* Although I can only&  guide you throughout&  this very place, but...", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
			C_Execute(18, Dialog_Add_Ext, ["* Come on, if you will,&  together let's march&  forward!", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
			C_Execute(18, Dialog_Start, [true]);
			C_WaitUntilDestroy(18, ui_dialog);
			C_MoveChar(19, char_serval, 420, 260, false, 60);
			C_Execute(19, BGM_SetVolume, [0, 0, room_speed]);
			C_Wait(19, 60);
			C_MoveChar(20, camera, char_player.x - (camera.width / camera.scale_x / 2), char_player.y - (camera.width / camera.scale_x / 2) - 10, false, 30);
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
					C_Execute(3, Dialog_Add_Ext, ["* Hey look!&* Over there!", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
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
					C_Execute(7, Dialog_Add_Ext, ["* It appears I forgot&  to introduce you to&  the folk around here.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(7, Dialog_Add_Ext, ["* And Zebra-chan is an&  example you've just&  seen over that spot.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(7, Dialog_Add_Ext, ["* Though don't worry,&  as all the Friends&  here are harmless.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(7, Dialog_Start, [true]);
					C_WaitUntilDestroy(7, ui_dialog);
					C_Execute(8, variable_instance_set, [char_serval, "dir", DIR.RIGHT]);
					C_Wait(8, 30);
					C_Execute(9, variable_instance_set, [char_serval, "dir", DIR.DOWN]);
					C_Execute(9, Dialog_Add_Ext, ["* Why don't you have&  a little conversation&  with her?", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(9, Dialog_Add_Ext, ["* I'll be waiting here.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
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
					C_Execute(1, Dialog_Add_Ext, ["* Oh, hello there...", "{char_link 3}"]);
					C_Execute(1, Dialog_Add_Ext, ["* Ah, so you wished to&  talk with me a little?", "{char_link 3}"]);
					C_Execute(1, Dialog_Start, [true]);
					C_WaitUntilDestroy(1, ui_dialog);
					C_Execute(2, variable_instance_set, [char_zebra, "sprite_index", spr_char_zebra_happy]);
					C_Execute(2, array_set, [char_zebra.res_idle_sprite, DIR.DOWN, spr_char_zebra_happy]);
					C_Execute(2, array_set, [char_zebra.res_talk_sprite, DIR.DOWN, spr_char_zebra_happy]);
					C_Wait(2, 30);
					C_Execute(3, Dialog_Add_Ext, ["* Well, sure thing!", "{char_link 3}"]);
					C_Execute(3, Dialog_Start, [true]);
					C_WaitUntilDestroy(3, ui_dialog);
					C_Execute(4, variable_instance_set, [cutscene_room, "phase", 0]);
					C_Execute(4, Encounter_Start, [4, true, false]);
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
					C_Execute(1, Dialog_Add_Ext, ["* You had quite a decent&  conversation there!", "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
					C_Execute(1, Dialog_Add_Ext, ["* Thinking about how I had&  to get you to the&  library...", "{char_link 2}{voice 4}{face 2}{face_emotion 3}"]);
					C_Execute(1, Dialog_Add_Ext, ["* I think it'd better to&  move on to our mission.", "{char_link 2}{voice 4}{face 2}{face_emotion 0}"]);
					C_Execute(1, Dialog_Add_Ext, ["* So, yeah!&* Let's go!", "{char_link 2}{voice 4}{face 2}{face_emotion 2}"]);
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
		break;
}