if (sprite_index == spr_char_zebra_shy_saddened) {
	if (!doneSweatingBefore) {
		Anim_Create(id, "offsetX", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, -3, 3, room_speed / 2, 0, -1, -1, ANIM_MODE.PINGPONG, false);
		if (alarm[0] < 0) alarm[0] = 1;
		doneSweatingBefore = true;
	}
}
else {
	doneSweatingBefore = false;
	Anim_Destroy(id, "offsetX", true);
	offsetX = 0;
}

draw_sprite_ext(sprite_index, image_index, x + offsetX, y + offsetY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);