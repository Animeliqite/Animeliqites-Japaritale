switch(room){
	case room_caverns:
		if (cutscene._current_order < 5)
			camera.x = median(0, char_player.x - (camera.width / camera.scale_x / 2));
		else if (cutscene._current_order == 15) {
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
		}
		C_FadeFader(0, 1, 0, 30, 0, c_white);
		C_Execute(0, variable_instance_set, [camera, "target", noone]);
		C_CreateAnim(0, camera, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, 0, median(0, char_player.y - (camera.width / camera.scale_y / 2), room_height - (camera.width / camera.scale_y / 2)), 120, false);
		C_MoveChar(0, char_player, 400, 380, false, 140);
		C_Wait(0, 1);
		C_Wait(1, 29);
		C_Execute(2, variable_instance_set, [fader, "alpha", 0]);
		C_Execute(2, variable_instance_set, [fader, "color", c_black]);
		C_Wait(2, 90);
		C_Wait(3, 30);
		C_Execute(4, BGM_Stop, [0]);
		C_Execute(4, instance_create_depth, [char_player.x, char_player.y - char_player.sprite_height - 5, 0, exclamation]);
		C_PlaySfx(4, snd_exclamation);
		C_Execute(4, variable_instance_set, [char_player, "image_index", 0]);
		C_Execute(4, variable_instance_set, [char_player, "image_speed", 0]);
		C_Wait(4, 30);
		C_CreateAnim(5, camera, "x", 0, 0, camera.x, char_cellien_small.x - (camera.width / camera.scale_x / 2), 30, false);
		C_Wait(5, 1);
		C_Wait(6, 29);
		C_PlaySfx(7, snd_jump);
		C_CreateAnim(7, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.IN, char_cellien_small.x, 460, 10, false);
		C_CreateAnim(7, char_cellien_small, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.y, 330, 10, false);
		C_Wait(7, 1);
		C_Wait(8, 6);
		C_Execute(9, layer_destroy, [layer_get_id("Rocks_Highest")]);
		C_CreateAnim(9, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.x, 480, 10, false);
		C_CreateAnim(9, char_cellien_small, "y", ANIM_TWEEN.SINE, ANIM_EASE.IN, char_cellien_small.y, 380, 10, false);
		C_Wait(9, 1);
		C_Wait(10, 9);
		C_PlaySfx(11, snd_impact);
		C_Execute(11, Camera_Shake, [3, 3]);
		C_Execute(11, Object_Shake, [3, "x", char_cellien_small]);
		C_Wait(11, 20);
		C_Execute(12, variable_instance_set, [char_cellien_small, "sprite_index", spr_char_cellien_shocked]);
		C_CreateAnim(12, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.x, 440, 15, false);
		C_Execute(12, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.0"), "{voice 2}{face 1}{face_emotion 1}"]);
		C_Wait(12, 1);
		C_Execute(13, Dialog_Start);
		C_WaitUntilDestroy(13, ui_dialog);
		C_Execute(14, variable_instance_set, [char_cellien_small, "sprite_index", spr_char_cellien_blink]);
		C_CreateAnim(14, char_cellien_small, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, char_cellien_small.x, 480, 15, false);
		C_Wait(14, 30);
		C_Execute(15, BGM_Play, [0, bgm_cellien_small]);
		C_Execute(15, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.1"), "{event 3}{voice 2}{face 1}{face_emotion 2}"]);
		C_Execute(15, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.2"), "{event 3}{voice 2}{face 1}{face_emotion 2}"]);
		C_Execute(15, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.3"), "{event 4}{voice 2}{face 1}{face_emotion 3}"]);
		C_Execute(15, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.4"), "{event 3}{voice 2}{face 1}{face_emotion 2}"]);
		C_Execute(15, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.5"), "{event 1}{voice 2}{face 1}{face_emotion 0}"]);
		C_Execute(15, Dialog_Add_Ext, [Lang_GetString("monster.cellien_small.overworld_dialog.6"), "{event 3}{voice 2}{face 1}{face_emotion 2}"]);
		C_Execute(15, Dialog_Start);
		C_WaitUntilDestroy(15, ui_dialog);
		C_Execute(16, Encounter_Start, [3, true, false]);
		C_Wait(16, 15);
		Cutscene_End(17);
		break;
}