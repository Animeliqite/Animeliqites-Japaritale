draw_set_font(Lang_GetFont("determination_sans"));
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_sprite_ext(spr_icon_warning, 0, room_width / 2, 50, 1, 1, 0, c_white, _icon_alpha);

draw_set_alpha(_text_alpha_top);
draw_text_transformed(room_width / 2, 100, "This is WIP recreation of a deriative work\nbetween UNDERTALE and KEMONO FRIENDS.", 1, 1, 0);

draw_set_alpha(_text_alpha_center);
draw_text_transformed(room_width / 2, 140, "By playing this, you agree to see any kind of\nspoilery content during gameplay.", 1, 1, 0);

draw_set_alpha(_text_alpha_bottom);
draw_text_transformed(room_width / 2, 180, "With all that being said, have fun!", 1, 1, 0);

draw_set_alpha(1);
draw_set_halign(fa_left);