///@desc Turn Preparation Start

//Prepare the attack
if(!_anim_paperplane_executed_once) {
	instance_create_depth(0,0,0,battle_turn_simple);
}
else{
	if(!Anim_IsExists(battle_ui)){
		instance_create_depth(0,0,0,battle_turn_noattack);
	}
	else{
		Battle_SetTurnInfo(BATTLE_TURN.TIME,60);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,283);
		Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,283);	
	}
}
randomize();

if(!Anim_IsExists(battle_ui)){
	if (_has_planned) battle._menu_dialog="* My actions are expanding!";
	else if (_anim_paperplane_executed_once) battle._menu_dialog="* The core is visible!";
	else {
		var RANDOM=[
			"* The cold breeze of wind&  surrounds the area.",
			"* The CELLIEN is looking&  directly at us.",
			"* The atmosphere vows with&  fear and unhope."
		];
		battle._menu_dialog=RANDOM[random(array_length(RANDOM))];
	}
}

Anim_SetPause(id, "_eye_x", false);
Anim_SetPause(id, "_eye_y", false);
	
Anim_SetPause(id, "_eye_black_x", false);
Anim_SetPause(id, "_eye_black_y", false);