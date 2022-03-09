C_CreateAnim(0, id, "_icon_alpha", 0, 0, 0, 1, 15, false);
Cutscene_EndOrderUpon(0);
C_Wait(1, 60);

C_CreateAnim(2, id, "_text_alpha_top", 0, 0, 0, 1, 15, false);
C_CreateAnim(2, id, "_text_alpha_center", 0, 0, 0, 1, 15, false, 60);
C_CreateAnim(2, id, "_text_alpha_bottom", 0, 0, 0, 1, 15, false, 120);
Cutscene_EndOrderUpon(2);
C_Wait(3, 240);

C_FadeFader(4, 0, 1, 15);
Cutscene_EndOrderUpon(4);
C_Wait(5, 15);

C_Execute(6, room_goto_next);
C_FadeFader(6, 1, 0, 15);
Cutscene_EndOrderUpon(6);
Cutscene_End(7);

if (Input_IsHeld(INPUT.CANCEL))
	game_set_speed(60, gamespeed_fps);
else game_set_speed(30, gamespeed_fps);