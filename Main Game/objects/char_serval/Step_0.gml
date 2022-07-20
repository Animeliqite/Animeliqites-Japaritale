event_inherited();
if(sprite_index==spr_char_serval_right_run){
	runningTimer++;
	if(runningTimer%5==0){
		repeat (3) instance_create_depth(x+irandom(5)-5,y+irandom(5)-10,0,part_whitepxldust);
	}
}