draw_set_font(Lang_GetFont("determination_sans"));
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_sprite_ext(spr_icon_animeliqiteandco, 0, room_width / 2, room_height / 2 - 15, 1, 1, 0, c_white, _icon_alpha);
draw_set_alpha(_icon_alpha);
draw_text_transformed(room_width / 2, room_height / 2 + 15, "Animeliqite & Co.", 1, 1, 0);

draw_set_alpha(_text_alpha);
draw_set_valign(fa_middle);
draw_text_transformed(room_width / 2, room_height / 2, "This game is unaffliated\nboth with Toby Fox and the\nKemono Friends team.", 1, 1, 0);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);