randomize();
if (!_aggressive)
	draw_self();
else draw_sprite_ext(sprite_index, image_index, x + random_range(-1, 1), y + random_range(-1, 1), image_xscale, image_yscale, image_angle, image_blend, image_alpha);