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
	shakeAmountFake = 0;
	shakeFast = false;
	if(_subPhase==0){
		C_Execute(0, BGM_Pause, [5]);
		C_Wait(0, 15);
		C_Execute(1, Typer_Type, [battle_board.x - (battle_board.left / 1.5), battle_board.y - 24, "CONVERSATION{w}  START...{w}{w}{end}", "{skippable false}{voice 1}{scale 2}{depth -9999}"]);
		C_WaitUntilDestroy(1, text_typer);
		C_Execute(2, BGM_Resume, [5]);
		C_Execute(2, variable_instance_set, [object_index, "sprite_index", spr_zebra_monster_ask]);
		C_Execute(2, Battle_CreateBubble, ["I... don't know&where to begin,&but...", "{effect -1}", 80, -(sprite_height / 1.5), 2]);
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
		C_Execute(0, Battle_CreateBubble, ["Ah, so usual topics&it is...", "{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(0, battle_dialog_enemy);
		C_Execute(1, Battle_CreateBubble, ["So uh, how are you?", "{effect -1}", 80, -(sprite_height / 1.5), 2]);
		C_WaitUntilDestroy(1, battle_dialog_enemy);
		C_Execute(2, variable_instance_set, [object_index, "_subPhase", 1.2]);
		C_Execute(2, Typer_Type, [battle_board.x - (battle_board.left / 1.25), battle_board.y - 24, "{choice 0}I'm fine    {choice 1}It's been confusing{choice `TMP`}{pause}{end}", "{skippable false}{instant true}{voice 1}{scale 2}{depth -9999}"]);
		Cutscene_End(2);
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