if (!surface_exists(surf))
	surf = surface_create(1024, 512);
else {
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, 0, image_blend, image_alpha);
	surface_reset_target();
	draw_surface_part(surf, 0, 0, 640, 480, 0, 0);
}