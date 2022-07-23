var STATUS=Battle_GetState();
var MENU=Battle_GetMenu();

if(STATUS==BATTLE_STATE.MENU && MENU!=BATTLE_MENU.FIGHT_AIM && MENU!=BATTLE_MENU.FIGHT_ANIM && MENU!=BATTLE_MENU.FIGHT_DAMAGE){
	if(Battle_GetMenuChoiceButton()==_button_slot&&battle._menu_can_move){
		image_index=1;
		if(MENU==BATTLE_MENU.BUTTON){
			battle_soul.x=x+16;
			battle_soul.y=y+22;
		}
	}else{
		image_index=0;
	}
}else{
	image_index=0;
}