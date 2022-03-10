Cutscene_Begin();

switch(room){
	case room_caverns:
		C_FadeFader(0, 1, 0, 30, 0, c_white);
		C_Execute(0, variable_instance_set, [char_serval, "sprite_index", spr_char_serval_right_look]);
		break;
}