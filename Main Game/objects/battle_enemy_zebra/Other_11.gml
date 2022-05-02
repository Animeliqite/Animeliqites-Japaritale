///@desc Battle Start

// We wouldn't want to see the battle UI
instance_destroy(battle_ui);
instance_destroy(battle_button);

Battle_SetNextState(BATTLE_STATE.TURN_PREPARATION);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_MOVE_DURATION, 0);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_SIZE_DURATION, 0);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_MOVE_SPEED, 9999);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_SIZE_SPEED, 9999);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_Y, 400);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_UP, 65);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_DOWN, 65);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT, 283);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT, 283);
Battle_SetTurnInfo(BATTLE_TURN.TIME, -1);

Cutscene_Begin();
_phase=0;