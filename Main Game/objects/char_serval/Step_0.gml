event_inherited();

if (sprite_index == spr_char_serval_down_happy) {
	if (!jumpTriggerOnce)
		Anim_Create(id, "y", ANIM_TWEEN.SINE, ANIM_EASE.OUT, y, -5, room_speed / 8, 0, -1, -1, ANIM_MODE.PINGPONG);
	if (jumpTimer % floor(room_speed / 4) == 0)	
		image_xscale *= -1;
	jumpTimer++;
	jumpTriggerOnce = true;
}
else {
	if (jumpTriggerOnce) {
		Anim_Destroy(id, "y", true);
		image_xscale = 1;
		jumpTriggerOnce = false;
	}
}