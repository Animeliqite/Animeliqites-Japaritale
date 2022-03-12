_inst_image_index = 0;
_inst_speed = 0;
_inst[0]=noone;
_timer = 0;
_l_dir = 0;

event_user(2);
Anim_Create(id, "_inst_image_index", 0, 0, 0, 1, 5, 0, -1, -1, ANIM_MODE.PINGPONG, false);