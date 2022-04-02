if (room == room_beginning_void) {
	if (instance_exists(cutscene_room)) {
		for (var i = 0; i < 3; i++)
			draw_sprite_ext(spr_char_cellien_white, 0, x, y - (sprite_height / 2), 0.75 + (abs(sin(current_time / 500 + i)) / 2), 0.75 + (abs(sin(current_time / 500 + i)) / 2), 0, c_white, cutscene_room._merge_amount_0 * 0.25);
	}
}
draw_self();