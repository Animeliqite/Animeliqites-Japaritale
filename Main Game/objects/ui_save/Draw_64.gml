if(_state==0||_state==1){
	draw_sprite_stretched_ext(spr_dialogbox_slice,0,108,118,424,174,c_white,1);
}

if(_state==0){
	if(_choice==0){
		draw_sprite_ext(spr_battle_soul_red_small,0,108+6+37,118+6+131,2,2,0,c_white,1);
	}else{
		draw_sprite_ext(spr_battle_soul_red_small,0,108+6+217,118+6+131,2,2,0,c_white,1);
	}
}