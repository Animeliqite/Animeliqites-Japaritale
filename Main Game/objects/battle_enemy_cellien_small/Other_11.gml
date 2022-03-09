///@desc Battle Start

Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.MINIMALIZED_BATTLE_UI,true);

Battle_SetNextState(BATTLE_STATE.TURN_PREPARATION);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_MOVE_DURATION, 0);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_SIZE_DURATION, 0);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_MOVE_SPEED, 9999);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_SIZE_SPEED, 9999);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT, 70);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT, 70);
Battle_SetTurnInfo(BATTLE_TURN.TIME,-1);

instance_destroy(battle_button);

Cutscene_End(-1);
Cutscene_Begin();