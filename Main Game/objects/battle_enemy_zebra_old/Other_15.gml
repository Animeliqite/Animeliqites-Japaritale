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
				if(_steps_done==2){
					shakeAmount = 0;
					Dialog_Add_Ext("* I've started counting her&  stripes.");
					Dialog_Add_Ext("* One, two, three...&* There's a lot.");
					_steps_done=3;
				}
				else if(_steps_done<2){
					Dialog_Add_Ext("* ZEBRA-CHAN - AT 0 DF 0&* One of the FRIEND's&  from this world.");
				}
				break;
			case 1:
				if(_steps_done==0){
					shakeAmount = 4;
					Dialog_Add_Ext("* Although I was afraid,&  I came closer and welcomed&  her.");
					Dialog_Add_Ext("* Seems like I'm progressing.");
					_steps_done=1;
				}
				else{
					Dialog_Add_Ext("* We've already welcomed&  eachother.");
					Dialog_Add_Ext("* Maybe I have to do&  something different?");
				}
				break;
			case 2:
				if(_steps_done==1){
					shakeAmount = 2;
					Object_Shake(5, "x", id, 0, false, 2);
					Dialog_Add_Ext("* I've pat on her shoulder.");
					Dialog_Add_Ext("* Seems like I'm progressing&  yet again.");
					_steps_done=2;
				}
				else if(_steps_done<1){
					Dialog_Add_Ext("* I think it'd be rude to&  do something like this&  without greeting at all.");
				}
				else{
					Dialog_Add_Ext("* She could get annoyed&  if I did it again.");
					Dialog_Add_Ext("* Maybe CHECKing would&  work?");
				}
				break;
		}
}