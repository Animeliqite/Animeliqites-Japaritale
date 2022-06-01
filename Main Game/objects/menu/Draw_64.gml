if(_menu==-1){
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_set_font(font_crypt_of_tomorrow);
	draw_set_color(c_gray);
	draw_text_transformed(10,476,"JAPARITALE BY ANIMELIQITE AND CO. 2020-2022\nUNDERTALE BY TOBY FOX AND CO. 2015-2022",2,2,0);
	
	draw_sprite_ext(spr_logo, 0, 320, 140, 2, 2, 0, c_white, 1);
	draw_sprite_ext(spr_char_kaban_down, 0, 320, 320, 2, 2, 0, c_white, 1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_transformed(320, 340,"[PRESS Z OR ENTER]",2,2,0);
	draw_set_font(Lang_GetFont("determination_sans"));
	draw_set_color(c_white);
	draw_text_transformed(320, 180, "Kaban ends up being in a mysterious\nisland full of sugoi's and tanoshii's", 2, 2, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if(_menu==1){
	draw_set_color(c_white);
	draw_set_font(Lang_GetFont(Lang_GetString("font.menu.0")));
	draw_text_transformed(280,110,_naming_name,2,2,0);
}

if(_menu==2||_menu==3){
	draw_set_color(c_white);
	draw_set_font(Lang_GetFont(Lang_GetString("font.menu.0")));
	draw_text_transformed(_confirm_name_x+_confirm_name_offset_x,_confirm_name_y+_confirm_name_offset_y,_naming_name,_confirm_name_scale,_confirm_name_scale,_confirm_name_angle);
}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(font_crypt_of_tomorrow);
draw_set_color(c_gray);
draw_text_transformed(10,476,"JAPARITALE BY ANIMELIQITE AND CO. 2020-2022\nUNDERTALE BY TOBY FOX AND CO. 2015-2022",2,2,0);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);