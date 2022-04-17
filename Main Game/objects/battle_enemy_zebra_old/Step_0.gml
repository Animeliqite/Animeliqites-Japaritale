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

if(_cutscene_no==0){
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