event_inherited();

if (phase == 0) {
	Anim_Create(id, "x", ANIM_TWEEN.SINE, ANIM_EASE.OUT, xstart, (battle_board.left - 32 + emptySpace), room_speed / 1.5);
	if (alarm[0] < 0)
		alarm[0] = room_speed / 1.5;
	phase = 1;
}
if (phase == 2) {
	Anim_Create(id, "y", ANIM_TWEEN.QUAD, ANIM_EASE.IN, ystart, battle_board.y + battle_board.down + 40 - ystart, room_speed * 2);
	phase = 3;
}

if (y > battle_board.y + battle_board.down + 40) {
	instance_destroy();
}