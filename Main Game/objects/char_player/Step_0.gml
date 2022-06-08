var specialKey = (Input_IsHeld(INPUT.UP)&&Input_IsHeld(INPUT.DOWN));
var readyToDance = specialKey&&place_meeting(x,y-move_speed[DIR.UP],block);
var can_move=(moveable&&_moveable_dialog&&_moveable_menu&&_moveable_save&&_moveable_warp&&_moveable_encounter&&!global._gmu_cutscene);
if(can_move){
	if (canRun && Input_IsHeld(INPUT.CANCEL) && canRunAlt) {
		var player = id;
		cooldownTimer = 15;
		runningTimer++;
		
		for (var i = 0; i <= DIR.DOWN; i += 90) {
			move_speed[i] = round(runningSpeed);
			res_move_speed[i] = 1/1.50;
			image_speed = 1/1.50;
		}
		
		if (runningTimer == 1) {
			runningSpeed = 7;
			Anim_Create(id, "runningSpeed", ANIM_TWEEN.SINE, ANIM_EASE.OUT, 7, 4, 15, 5, -1, -1, ANIM_MODE.ONESHOT, false);
			Camera_Shake(5, 5, 0, 0, true, true);
			audio_play_sound(snd_impact, 0, false);
			audio_play_sound(snd_flee, 0, false);
		}
		if (runningTimer < 5) {
			with (instance_create_depth(x, y, depth + 1, trail)) {
				image_alpha = 1;
				image_blend = c_white;
				sprite_index = player.sprite_index;
				image_index = player.image_index;
				duration = 0.1;
				color = [0.5, 0.5, 0.5, 1.0];
			}
		}
		with (instance_create_depth(x, y, depth + 1, trail)) {
			image_alpha = 0.8;
			image_blend = c_white;
			sprite_index = player.sprite_index;
			image_index = player.image_index;
			duration = 0.5;
			color = [1.0, 1.0, 1.0, 1.0];
		}
		
		if (runningTimer == 6) {
			fader.color = c_black;
		}
		
		if (runningTimer % 5 == 0) {
			audio_play_sound(snd_bump, 0, false);
		}
	}
	else {
		runningTimer = 0;
		runningSpeed = 4;
		
		if (cooldownTimer > 0) {
			canRunAlt = false;
			cooldownTimer--;
		}
		else canRunAlt = true;
		
		if (cooldownTimer > 13) {
			audio_stop_sound(snd_bump);
			for (var i = 0; i <= DIR.DOWN; i += 90) {
				move_speed[i] = 2;
				res_move_speed[i] = 1/3;
				image_speed = 1/3;
			}
		}
	}
	if(Input_IsHeld(INPUT.UP)&&!readyToDance){
		move[DIR.UP]=2;
	}else if(Input_IsHeld(INPUT.DOWN)){
		move[DIR.DOWN]=2;
	}
	if(Input_IsHeld(INPUT.LEFT)){
		move[DIR.LEFT]=2;
	}else if(Input_IsHeld(INPUT.RIGHT)){
		move[DIR.RIGHT]=2;
	}
	if(Input_IsPressed(INPUT.CONFIRM)){
		var inst=noone;
		if(dir==DIR.UP){
			inst=collision_rectangle(x-sprite_width/2+4,y-5,x+sprite_width/2-4,y-sprite_height+5,char,false,true);
		}
		if(dir==DIR.DOWN){
			inst=collision_rectangle(x-sprite_width/2+4,y-sprite_height+20,x+sprite_width/2-4,y+15,char,false,true);
		}
		if(dir==DIR.LEFT){
			inst=collision_rectangle(x,y-sprite_height+19,x+sprite_width/2-15,y,char,false,true);
		}
		if(dir==DIR.RIGHT){
			inst=collision_rectangle(x,y-sprite_height+19,x+sprite_width/2+15,y,char,false,true);
		}
		if(instance_exists(inst)){
			with(inst){
				event_user(0);
			}
		}
	}
	if(!instance_exists(ui_dialog)){
		if(Input_IsPressed(INPUT.MENU)){
			instance_create_depth(0,0,0,ui_menu);
		}
	}
	
	if(Input_IsHeld(INPUT.LEFT))&&(Input_IsHeld(INPUT.RIGHT)) {
		move[DIR.RIGHT]=0;
	}
	
	if(specialKey&&!readyToDance)
		move[DIR.DOWN]=0;
	
	if(move[DIR.UP]>0){
		if (readyToDance||(move[DIR.LEFT]<=0||dir!=DIR.LEFT)&&(move[DIR.RIGHT]<=0||dir!=DIR.RIGHT)) {
			dir = DIR.UP;
		}
	}
	
	if(move[DIR.DOWN]>0){
		if ((move[DIR.LEFT]<=0||dir!=DIR.LEFT)&&(move[DIR.RIGHT]<=0||dir!=DIR.RIGHT)) {
			dir = DIR.DOWN;
		}
	}
	
	if(move[DIR.LEFT]>0){
		if (!specialKey&&(move[DIR.UP]<=0||dir!=DIR.UP)&&(move[DIR.DOWN]<=0||dir!=DIR.DOWN)) {
			dir = DIR.LEFT;
		}
	}
	
	if(move[DIR.RIGHT]>0){
		if (!specialKey&&(move[DIR.UP]<=0||dir!=DIR.UP)&&(move[DIR.DOWN]<=0||dir!=DIR.DOWN)) {
			dir = DIR.RIGHT;
		}
	}
}

event_inherited();