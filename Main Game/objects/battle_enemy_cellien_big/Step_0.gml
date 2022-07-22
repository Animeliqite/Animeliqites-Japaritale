randomize();

Anim_SetSpeed(id, "x", random(_anim_speed));
Anim_SetSpeed(id, "y", random(_anim_speed));

Anim_SetSpeed(id, "_eye_black_x", random(_anim_speed));
Anim_SetSpeed(id, "_eye_black_y", random(_anim_speed));

Anim_SetSpeed(id, "_eye_x", random(_anim_speed));
Anim_SetSpeed(id, "_eye_y", random(_anim_speed));

if(_draw_paperplane&&!_anim_paperplane_executed_once){
	Anim_Create(id,"_paperplane_x", 0, 0,-250,720,160,0,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_black_scale_x", 0, 0,1,0,40,100,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_scale_x", 0, 0,1,0,40,100,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_core_scale_x", 0, 0,0,1,40,120,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_black_x_add_speed", 0, 0,4,86,150,0,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_x_add_speed", 0, 0,32,86,150,0,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_dir",0,0,1,-1,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_xscale",0,0,1,1,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_yscale",0,0,1,1,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_core_part_show",0,0,1,1,1,140,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_x", 0, 0,720,-250,160,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_core_x", 0, 0,0-sprite_width/2,0,40,120,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_depth", 0, 0,_paperplane_depth,1,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_y", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT,battle_board.y-(battle_board.up*1.5),-40,120,0,-1,-1,ANIM_MODE.ONESHOT,true);
	_paperplane=instance_create_depth(_paperplane_x,_paperplane_y,depth-1,battle_bullet_paperplane);
	_anim_paperplane_executed_once = true;
}

if(_instructed==1){
	Player_SetName("SERVAL");
}
if(_instructed==2&&!_instructed_executed_once){
	battle_soul_red.visible=true;
	audio_play_sound(snd_save,0,false);
	battle._menu_dialog="{voice 4}{color `pink`}"+"* Meow! I'll beat that creature~";
	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.BATTLE_MENU_FIGHT_OBJ,object_get_name(battle_menu_fight_paw));
	Battle_SetEnemyActionNumber(_enemy_slot,1);
	_instructed_executed_once=true;
}

if(_draw_lines&&_lines_image_index_old!=_lines_image_index){
	audio_play_sound(snd_glass_break,0,false);
	Camera_Shake(2,2);
	_lines_image_index_old=_lines_image_index;
}