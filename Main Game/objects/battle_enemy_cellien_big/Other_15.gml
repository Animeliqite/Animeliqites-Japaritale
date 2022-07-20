///@desc Menu End

switch(Battle_GetMenuChoiceButton()){
	case BATTLE_MENU_CHOICE_BUTTON.FIGHT:
		//Check: is enemy supposed to be dead?
		if(_hp<=0){
			//Create particle effect
			var inst=instance_create_depth(x,y,0,battle_death_particle);
			inst.sprite=sprite_index;
			audio_play_sound(snd_vaporize,0,false);
			instance_destroy();
		}
		break;
		
	case BATTLE_MENU_CHOICE_BUTTON.ACT:
		switch(Battle_GetMenuChoiceAction()){
			case 0:
				Dialog_Add_Ext("* CELLIEN - 3 AT 25 DF{w}&* A threathening kind&  blocking off the gate.");
				if(!_has_planned) Dialog_Add_Ext("* I need to find a way to&  distract it.");
				break;
			case 1:
				if(!_has_planned){
					switch(_planning_phase){
						case 0:
							Dialog_Add_Ext("* I have a very limited time&  to think about a plan.");
							Dialog_Add_Ext("* I'm going to think of one&  while dodging bullets.");
							_planning_phase = 1;
							break;
						case 1:
							Dialog_Add_Ext("* Instantly realizing that&  CELLIENS have weaknesses&  on their backs...");
							Dialog_Add_Ext("* I think I'm getting somewhere.");
							_planning_phase = 2;
							break;
						case 2:
							Dialog_Add_Ext("* I quickly picked up some&  stones, a stick, and a&  map.");
							Dialog_Add_Ext("* Though I don't have much time.");
							_planning_phase = 3;
							_has_planned = true;
							
							Battle_SetEnemyActionNumber(_enemy_slot,3);
							Battle_SetEnemyActionName(_enemy_slot,0,"* Check");
							Battle_SetEnemyActionName(_enemy_slot,1,"* Search");
							Battle_SetEnemyActionName(_enemy_slot,2,"* Instruct");
							
							Item_Add(item_stick);
							Item_Add(item_stone);
							Item_Add(item_map);
							break;
					}
				}
				else {
					
				}
				break;
		}
}