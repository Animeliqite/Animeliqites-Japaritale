draw_self();
Anim_SetSpeed(id, "x", shakeAmountFake);
Anim_SetSpeed(id, "image_xscale", shakeAmountFake);
Anim_SetSpeed(id, "image_yscale", shakeAmountFake);
if (Battle_GetState() != BATTLE_STATE.TURN_PREPARATION)
	shakeAmountFake = shakeAmount;	
if (shakeFast) {
	if (!partCreatedOnce) {
		if (alarm[1] < 0) alarm[1] = 1;
		partCreatedOnce = true;
	}
}