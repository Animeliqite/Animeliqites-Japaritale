if (!surface_exists(surf))
	surf = surface_create(1024, 512);
else {
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	draw_set_font(str_font);
	draw_set_color(str_color);
	
	var str_width = string_width(str_text);
	draw_sprite_ext(spr_pixel, 0, 320 - (str_width / 2) - 20, 120 - 20, str_width + 40, 30 + 20, 0, bg_color, bg_alpha);
	draw_text_transformed(320 - (str_width / 2), 120, str_text, 1, 1, 0);
	
	surface_reset_target();
	draw_surface_part(surf, 0, 0, 640, 480, 0, 0);
}