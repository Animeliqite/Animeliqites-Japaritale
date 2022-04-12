///@desc Turn Preparation Start

//Turn time, 480f = 8s , -1 for infinitive.
Battle_SetTurnInfo(BATTLE_TURN.TIME,480);

Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,80);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,80);

event_inherited();