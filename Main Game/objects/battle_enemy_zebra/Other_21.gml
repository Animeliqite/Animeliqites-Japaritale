///@desc Turn End
event_inherited();

if(_steps_done==3){
	if (_damage_taken<3){
		Battle_SetState(BATTLE_STATE.IN_TURN);
		Battle_SetNextState(BATTLE_STATE.IN_TURN);
		Battle_SetTurnInfo(BATTLE_TURN.TIME,-1);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,80);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,80);
		_cutscene_no=0;
		_steps_done=9999;
		if (alarm[0] < 0) alarm[0] = 1;
	}
	else {
		Battle_SetState(BATTLE_STATE.IN_TURN);
		Battle_SetNextState(BATTLE_STATE.IN_TURN);
		Battle_SetTurnInfo(BATTLE_TURN.TIME,-1);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,80);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,80);
		_cutscene_no=1;
		_damage_taken=9999;
		if (alarm[0] < 0) alarm[0] = 1;
	}
}
else {
	if (_damage_taken==3){
		Battle_SetState(BATTLE_STATE.IN_TURN);
		Battle_SetNextState(BATTLE_STATE.IN_TURN);
		Battle_SetTurnInfo(BATTLE_TURN.TIME,-1);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,80);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,80);
		_cutscene_no=1;
		_damage_taken=9999;
		if (alarm[0] < 0) alarm[0] = 1;
	}
}