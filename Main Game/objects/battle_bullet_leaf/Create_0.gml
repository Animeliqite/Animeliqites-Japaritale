event_inherited();

vspeed = 1;
Anim_Create(id, "image_angle", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, -10, 10, room_speed, 0, -1, -1, ANIM_MODE.PINGPONG, false);
Anim_Create(id, "x", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, x, 40, room_speed * 1.5, 0, -1, -1, ANIM_MODE.PINGPONG, true);
