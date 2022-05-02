if (_laugh) {
	randomize();
	sprite_index = spr_cellien_monster_laugh_body;
	draw_sprite_ext(spr_cellien_monster_laugh_eye, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(spr_cellien_monster_laugh_eye_pupil, 0, x + random_range(-8, 8), y - 8 + random_range(-8, 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_self();
}
else if (_shake) {
	draw_sprite_ext(sprite_index, image_index, x + random_range(-_shake_x, _shake_x), y + random_range(-_shake_y, _shake_y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else {
	draw_self();
}
	
	
if (_show_controls) {
	if (battle_soul.xprevious == battle_soul.x && battle_soul.yprevious == battle_soul.y) {
		battle_soul.moveable = true;
		draw_sprite_ext(spr_battle_ui_heart_controls, current_time / 500, battle_soul.x, battle_soul.y, 1, 1, 0, c_white, 1);
	} else _show_controls = false;
}