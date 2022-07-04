if(instance_exists(battle_dialog_enemy)){
	if(instance_exists(battle_dialog_enemy._inst)) {
		if(battle_dialog_enemy._inst._paused==false)
			image_speed=1/2;
		else{
			image_index=0;
			image_speed=0;
		}
	}
	else{
		image_index=0;
		image_speed=0;
	}
}

if(_phase==0){
	battle_soul.visible = false;
	battle_soul_red.moveable = false;
	if(_subPhase==0){
		C_Execute(0, BGM_Pause, [5]);
		C_Wait(0, 15);
		C_Execute(1, Typer_Type, [battle_board.x - (battle_board.left / 1.5), battle_board.y - 24, "CONVERSATION{w}  START...{w}{w}{end}", "{skippable false}{voice 1}{scale 2}{depth -9999}"]);
		C_WaitUntilDestroy(1, text_typer);
		C_Execute(2, BGM_Resume, [5]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.0"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, Typer_Type, [battle_board.x - (battle_board.left / 1.5), battle_board.y - 24, "{choice 0}Usual topics    {choice 1}This world{choice `TMP`}{pause}{end}", "{skippable false}{instant true}{voice 1}{scale 2}{depth -9999}"]);
		C_WaitUntilDestroy(3, text_typer);
		C_Execute(4, variable_instance_set, [object_index, "_subPhase", 1]);
		Cutscene_End(4);
	}
	else if(_subPhase==1){
		switch(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE)){
			case 0:
				_subPhase = 1.1;
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE, -9999);
				instance_destroy(text_typer);
				Cutscene_Begin();
				break;
			case 1:
				_subPhase = 1.5;
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE, -9999);
				instance_destroy(text_typer);
				Cutscene_Begin();
				break;
		}
	}
	else if(_subPhase==1.1){
		C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(0, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.1"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_FadeFader(1, 1, 0, 15, 0, c_white);
		C_Execute(1, variable_instance_set, [object_index, "showHealthbar", true]);
		C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal_idle]);
		C_Execute(1, variable_instance_set, [object_index, "image_index", 0]);
		C_Execute(1, variable_instance_set, [object_index, "image_speed", 0]);
		C_CreateAnim(1, id, "image_index", 0, 0, 0, 10, room_speed * 3, false);
		C_CreateAnim(1, id, "healthbarYOffset", 0, 0, -480, -sprite_height - 25, 1, false);
		C_CreateAnim(1, id, "healthbarAmount", 0, 0, 100, 50, room_speed, false, 0);
		C_CreateAnim(1, id, "healthbarYOffset", 0, 0, -sprite_height - 25, -480, room_speed, false, floor(room_speed * 2.5));
		C_PlaySfx(1, snd_mercyup);
		C_Wait(1, 90);
		C_Execute(2, variable_instance_set, [fader, "color", c_black]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_happy]);
		C_Execute(2, variable_instance_set, [fader, "color", c_black]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.2"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, variable_instance_set, [object_index, "_subPhase", 1.2]);
		C_Execute(3, Typer_Type, [battle_board.x - (battle_board.left / 1.25), battle_board.y - 24, "{choice 0}I'm fine    {choice 1}It's been confusing{choice `TMP`}{pause}{end}", "{skippable false}{instant true}{voice 1}{scale 2}{depth -9999}"]);
		Cutscene_End(3);
	}
	else if(_subPhase==1.2){
		switch(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE)){
			case 0:
				_subPhase = 1.3;
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE, -9999);
				instance_destroy(text_typer);
				Cutscene_Begin();
				break;
			case 1:
				_subPhase = 1.4;
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE, -9999);
				instance_destroy(text_typer);
				Cutscene_Begin();
				break;
		}
	}
	else if(_subPhase==1.3){
		C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(0, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(0, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.3"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_Wait(1, 1);
		C_Execute(2, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.4"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_sad]);
		C_Execute(3, BGM_Pause, [5]);
		C_Execute(3, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.5"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(3, battle_dialog_enemy);
		C_Execute(4, BGM_Resume, [5]);
		C_Execute(4, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(4, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.6"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(4, battle_dialog_enemy);
		C_Execute(5, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(5, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.7"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(5, battle_dialog_enemy);
		C_Execute(6, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(6, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(6, variable_instance_set, [object_index, "partCreatedOnce", false]);
		C_Execute(6, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.8"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(6, battle_dialog_enemy);
		C_Execute(7, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(7, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(7, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.9"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(7, battle_dialog_enemy);
		C_Execute(8, variable_instance_set, [object_index, "_subPhase", 2]);
		Cutscene_End(8);
	}
	else if(_subPhase==1.4){
		C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(0, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(0, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.3.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_Wait(1, 1);
		C_Execute(2, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.4.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_sad]);
		C_Execute(3, BGM_Pause, [5]);
		C_Execute(3, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.5.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(3, battle_dialog_enemy);
		C_Execute(4, BGM_Resume, [5]);
		C_Execute(4, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(4, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.6.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(4, battle_dialog_enemy);
		C_Execute(5, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(5, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.7.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(5, battle_dialog_enemy);
		C_Execute(5, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_happy]);
		C_Execute(6, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.8.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(6, battle_dialog_enemy);
		C_Execute(7, variable_instance_set, [object_index, "_subPhase", 2]);
		Cutscene_End(7);
	}
	else if(_subPhase==1.5){
		C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(0, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.1.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_FadeFader(1, 1, 0, 15, 0, c_white);
		C_Execute(1, variable_instance_set, [object_index, "showHealthbar", true]);
		C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal_idle]);
		C_Execute(1, variable_instance_set, [object_index, "image_index", 0]);
		C_Execute(1, variable_instance_set, [object_index, "image_speed", 0]);
		C_CreateAnim(1, id, "image_index", 0, 0, 0, 10, room_speed * 3, false);
		C_CreateAnim(1, id, "healthbarYOffset", 0, 0, -480, -sprite_height - 25, 1, false);
		C_CreateAnim(1, id, "healthbarAmount", 0, 0, 100, 50, room_speed, false, 0);
		C_CreateAnim(1, id, "healthbarYOffset", 0, 0, -sprite_height - 25, -480, room_speed, false, floor(room_speed * 2.5));
		C_PlaySfx(1, snd_mercyup);
		C_Wait(1, 90);
		C_Execute(2, variable_instance_set, [fader, "color", c_black]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_happy]);
		C_Execute(2, variable_instance_set, [fader, "color", c_black]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.2.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, variable_instance_set, [object_index, "_subPhase", 1.6]);
		C_Execute(3, Typer_Type, [battle_board.x - (battle_board.left / 1.25), battle_board.y - 24, "{choice 0}Yes          {choice 1}No{choice `TMP`}{pause}{end}", "{skippable false}{instant true}{voice 1}{scale 2}{depth -9999}"]);
		Cutscene_End(3);
	}
	else if(_subPhase==1.6){
		switch(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE)){
			case 0:
				_subPhase = 1.7;
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE, -9999);
				instance_destroy(text_typer);
				Cutscene_Begin();
				break;
			case 1:
				_subPhase = 1.8;
				Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TEXT_TYPER_CHOICE, -9999);
				instance_destroy(text_typer);
				Cutscene_Begin();
				break;
		}
	}
	else if(_subPhase==1.7){
		C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(0, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(0, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.3.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_Wait(1, 1);
		C_Execute(2, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.4.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_sad]);
		C_Execute(3, BGM_Pause, [5]);
		C_Execute(3, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.5.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(3, battle_dialog_enemy);
		C_Execute(4, BGM_Resume, [5]);
		C_Execute(4, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(4, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.6.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(4, battle_dialog_enemy);
		C_Execute(5, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(5, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.7.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(5, battle_dialog_enemy);
		C_Execute(6, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(6, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(6, variable_instance_set, [object_index, "partCreatedOnce", false]);
		C_Execute(6, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.8.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(6, battle_dialog_enemy);
		C_Execute(7, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.9.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(7, battle_dialog_enemy);
		C_Execute(8, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(8, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(8, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.10.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(8, battle_dialog_enemy);
		C_Execute(9, variable_instance_set, [object_index, "_subPhase", 2]);
		Cutscene_End(9);
	}
	else if(_subPhase==1.8){
		C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(0, variable_instance_set, [object_index, "shakeAmountFake", 2]);
		C_Execute(0, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.3.alt.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_Wait(1, 1);
		C_Execute(2, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.4.alt.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(3, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(3, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.5.alt.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(3, battle_dialog_enemy);
		C_Execute(4, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(4, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(4, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.6.alt.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(4, battle_dialog_enemy);
		C_Execute(5, variable_instance_set, [object_index, "shakeAmountFake", 0]);
		C_Execute(5, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_sad]);
		C_Execute(5, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.7.alt.alt.alt"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(5, battle_dialog_enemy);
		C_Execute(6, variable_instance_set, [object_index, "_subPhase", 2]);
		Cutscene_End(6);
	}
	else if(_subPhase==2){
		Cutscene_Begin();
		_subPhase=2.1;
	}
	else if(_subPhase==2.1){
		C_Execute(0, BGM_SetVolume, [5, 0, room_speed]);
		C_Wait(0, room_speed * 2);
		C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(1, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.end.0"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(1, battle_dialog_enemy);
		C_Execute(2, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.end.1"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(2, battle_dialog_enemy);
		C_Execute(3, Battle_CreateBubble, [Lang_GetString("cutscene.zebra.conversation.end.2"), "{voice 6}{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(3, battle_dialog_enemy);
		C_FadeFader(4, -1, 1, 15, 0, false);
		C_Wait(4, 15);
		C_Execute(5, Flag_Set, [FLAG_TYPE.TEMP,FLAG_TEMP.HAD_CONVERSATION,true]);
		C_Execute(5, Battle_End);
		Cutscene_End(5);
	}
}



/*if(_cutscene_no==0){
	Battle_SetState(BATTLE_STATE.IN_TURN);
	Battle_SetNextState(BATTLE_STATE.IN_TURN);
	Battle_SetTurnInfo(BATTLE_TURN.TIME,-1);
	Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,80);
	Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,80);
	C_Wait(-1, 1);
	C_Execute(0, BGM_SetVolume, [5, 0, 60]);
	C_Execute(0, Battle_CreateBubble, [string(finalDialog), "", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale)]);
	C_Wait(0, 1);
	C_WaitUntilDestroy(1, battle_dialog_enemy);
	C_FadeFader(2, -1, 1, 10);
	C_Execute(2, BGM_SetVolume, [5, 0, 10]);
	C_Wait(2, 10);
	C_Execute(3, BGM_Stop, [5]);
	C_Execute(3, Battle_End);
	Cutscene_End(3);
}
else if(_cutscene_no==1){
	Battle_SetState(BATTLE_STATE.IN_TURN);
	Battle_SetNextState(BATTLE_STATE.IN_TURN);
	Battle_SetTurnInfo(BATTLE_TURN.TIME,-1);
	Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,80);
	Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,80);
	C_Wait(-1, 1);
	C_Execute(0, BGM_SetVolume, [5, 0, 60]);
	C_Execute(0, Object_Shake, [10, "x", id]);
	C_Execute(0, variable_instance_set, [id, "shakeAmount", 10]);
	C_Execute(0, Battle_CreateBubble, [string(failDialog), "", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale)]);
	C_Wait(0, 1);
	C_WaitUntilDestroy(1, battle_dialog_enemy);
	C_FadeFader(2, -1, 1, 10);
	C_Execute(2, BGM_SetVolume, [5, 0, 10]);
	C_Wait(2, 10);
	C_Execute(3, BGM_Stop, [5]);
	C_Execute(3, Battle_End);
	Cutscene_End(3);
}

if (Battle_GetState()==BATTLE_STATE.TURN_PREPARATION) {
	if (_steps_done==1){
		C_Execute(0, variable_instance_set, [id, "sprite_index", spr_zebra_monster_normal]);
		C_Execute(0, Battle_CreateBubble, ["I wasn't ready for&this!{w}&I wasn't ready for&this!!","{effect 0}", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale)]);
		C_Wait(0, 1);
		C_WaitUntilDestroy(1, battle_dialog_enemy);
		C_Execute(2, Anim_Create, [id, "shakeAmountFake", ANIM_TWEEN.SINE, ANIM_EASE.OUT, shakeAmount, 0, 30, 0, -1, -1, ANIM_MODE.ONESHOT, false]);
		C_Wait(2, 30);
		C_Execute(3, variable_instance_set, [id, "sprite_index", spr_zebra_monster_shrug]);
		C_Execute(3, Battle_CreateBubble, ["I just want to clarify&I'm not a talkactive&person myself, haha...","", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale)]);
		C_WaitUntilDestroy(3, battle_dialog_enemy);
		C_Execute(4, variable_instance_set, [id, "partCreatedOnce", false]);
		C_Execute(4, Anim_Create, [id, "shakeAmountFake", ANIM_TWEEN.SINE, ANIM_EASE.OUT, shakeAmountFake, 2, 30, 0, -1, -1, ANIM_MODE.ONESHOT, false]);
		C_Execute(4, Battle_CreateBubble, ["Hah... hah...","{speed 1}", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale)]);
		C_WaitUntilDestroy(4, battle_dialog_enemy);
		C_Execute(5, variable_instance_set, [id, "sprite_index", spr_zebra_monster_shrug]);
		Cutscene_End(5);	
	}
}