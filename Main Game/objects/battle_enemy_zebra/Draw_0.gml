draw_sprite_ext(spr_battle_bg_savannah_zebra, 0, 0, 0, 1, 1, 0, c_white, 1);
draw_self();
Anim_SetSpeed(id, "x", shakeAmountFake);
//Anim_SetSpeed(id, "image_xscale", shakeAmountFake);
//Anim_SetSpeed(id, "image_yscale", shakeAmountFake);
if (shakeAmountFake != 0) {
	if (!partCreatedOnce) {
		if (alarm[1] < 0) alarm[1] = 1;
		partCreatedOnce = true;
	}
}

if (showHealthbar) {
	draw_set_font(Lang_GetFont("determination_sans"));
	draw_set_color(c_white);
	draw_text_transformed(xstart + healthbarXOffset, y - 42 + healthbarYOffset, "SHYNESS METER", 2, 2, 0);
	draw_rectangle(xstart + healthbarXOffset - 2, y - 12 + healthbarYOffset, xstart + 160 + healthbarXOffset + 2, y + 12 + healthbarYOffset, false);
	draw_healthbar(xstart + healthbarXOffset, y - 10 + healthbarYOffset, xstart + 160 + healthbarXOffset, y + 10 + healthbarYOffset, healthbarAmount, c_gray, c_blue, c_blue, 0, true, true);
}

//draw_text(0,0,_phase);
//draw_text(0,10,_subPhase);
//draw_text(0,20,shakeFast);
//draw_text(0,30,shakeAmount);
//draw_text(0,40,shakeAmountFake);