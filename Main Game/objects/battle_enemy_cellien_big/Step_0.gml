randomize();

Anim_SetSpeed(id, "x", random(_anim_speed));
Anim_SetSpeed(id, "y", random(_anim_speed));

Anim_SetSpeed(id, "_eye_black_x", random(_anim_speed));
Anim_SetSpeed(id, "_eye_black_y", random(_anim_speed));

Anim_SetSpeed(id, "_eye_x", random(_anim_speed));
Anim_SetSpeed(id, "_eye_y", random(_anim_speed));

if(_draw_paperplane&&!_anim_paperplane_executed_once){
	Anim_Create(id,"_paperplane_x", 0, 0,-250,720,160,0,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_black_scale_x", 0, 0,1,0,40,120,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_scale_x", 0, 0,1,0,40,120,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_black_x_add_speed", 0, 0,4,86,150,0,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_x_add_speed", 0, 0,32,86,150,0,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_dir",0,0,1,-1,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_xscale",0,0,1,0.5,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_yscale",0,0,1,0.5,1,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_x", 0, 0,720,-250,160,180,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_black_x", 0, 0,0,0,1,340,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_black_y", 0, 0,0,0,1,340,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_x", 0, 0,0,0,1,340,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_eye_y", 0, 0,0,0,1,340,-1,-1,ANIM_MODE.ONESHOT,false);
	Anim_Create(id,"_paperplane_y", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT,battle_board.y-(battle_board.up*1.5),-40,120,0,-1,-1,ANIM_MODE.ONESHOT,true);
	_anim_paperplane_executed_once = true;
}