draw_self();
draw_sprite_ext(spr_cellien_big_monster_eye_black, 0, x + _eye_black_x, y + _eye_black_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_cellien_big_monster_eye, 0, x + _eye_x, y + _eye_y, 1, 1, 0, c_white, 1);

for (var rot = 0; rot <= 180; rot += 45) {
	for (var i = 0; i <= 5; i++) {
		draw_sprite_ext(spr_cellien_big_monster_tentacle_start, 0, x - lengthdir_x(sprite_width / 2, -rot), y - (sprite_height / 2) - lengthdir_y(sprite_height / 2, -rot), 1, 1, -rot, c_white, 1);
		draw_line_width(x - lengthdir_x(sprite_width / 2, -rot), y - (sprite_height / 2) - lengthdir_y(sprite_height / 2, -rot), xstart - lengthdir_x(1024, -rot), ystart - 25 - (sprite_height / 2) - lengthdir_y(1024, -rot), 10);
	}
}