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
	draw_text_transformed(320, 180, "Kaban ends up being in a mysterious\nisland full of tanoshii's and sugoi's", 2, 2, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if(_menu==0){
	if(_mode=1){
		draw_set_font(Lang_GetFont("determination_sans"));
		draw_set_color(c_white);
		
		for (var i=0; i<3; i++) {
			_heart_pos_x[i] = 130;
			_heart_pos_y[i] = 155+(93*i);
			
			var time=_file_time[i];
			if(is_real(time)) {
				var minute=time div 60;
				var second=time mod 60;
			}
			draw_sprite_ext(spr_dialogbox_slice_menu,0,110,110+(93*i),430/112,90/112,0,c_white,(_chosen_file == i && _choice_file_phase != 1 ? 1 : 0.5));
			draw_set_alpha((_chosen_file == i && _choice_file_phase == 0 ? 1 : 0.5));
			if (_choice_file_phase==2&&_chosen_file==i){
				draw_set_alpha(1);
				draw_text_transformed(160,150+(93*i),((_mode_copy||_mode_erase) ? "Yes" : _file_text_start[i]),2,2,0);
				draw_text_transformed(410,150+(93*i),((_mode_copy||_mode_erase) ? "No" : "Back"),2,2,0);
			}
			else {
				draw_set_alpha((_chosen_file == i && _choice_file_phase == 0 ? 1 : 0.5));
				draw_text_transformed(160,150+(93*i),_file_room[i],2,2,0);
			}
			if(_mode_copy||_mode_erase)&&(_choice_file_phase==2&&_chosen_file==i){
				draw_text_transformed(160,120+(93*i),"Are you sure?",2,2,0);
			}
			else{
				draw_text_transformed(160,120+(93*i),_file_name[i],2,2,0);
				draw_text_transformed(410,120+(93*i),(is_real(time) ? string(minute)+":"+(second<10 ? "0" : "")+string(second) : "--:--"),2,2,0);
			}
			draw_set_alpha(1);
		}
		
		_heart_pos_x[3] = 140;
		_heart_pos_y[3] = 410;
		_heart_pos_x[4] = 240;
		_heart_pos_y[4] = 410;
		_heart_pos_x[5] = 360;
		_heart_pos_y[5] = 410;
		_heart_pos_x[6] = 140;
		_heart_pos_y[6] = 165+(93*_chosen_file);
		_heart_pos_x[7] = 390;
		_heart_pos_y[7] = 165+(93*_chosen_file);
		
		draw_text_transformed(160,390,"Copy",2,2,0);
		draw_text_transformed(260,390,"Erase",2,2,0);
		draw_text_transformed(380,390,"Options",2,2,0);
		
		draw_sprite(spr_battle_soul_red, 0, _heart_pos_curr_x, _heart_pos_curr_y);
	}
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