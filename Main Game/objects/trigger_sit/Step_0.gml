var user=user_char;
var result=false;
if(instance_exists(char)){
	with(char){
		if(char_id==user||user==-1){
			result=place_meeting(x,y,other);
			if(result){
				break;
			}
		}
	}
}
if(!_triggered&&!_collided_previous&&result){
	if (Input_IsPressed(INPUT.CONFIRM)) && (object_char.move[DIR.LEFT] <= 0 && object_char.move[DIR.RIGHT] <= 0 && object_char.move[DIR.UP] <= 0 && object_char.move[DIR.DOWN] <= 0) {
		_collided_previous=true;
		event_user(0);
	}
}else if(_triggered&&_collided_previous&&result){
	if (Input_IsPressed(INPUT.CANCEL) || Input_IsPressed(INPUT.UP) || Input_IsPressed(INPUT.DOWN) || Input_IsPressed(INPUT.LEFT) || Input_IsPressed(INPUT.RIGHT)) {
		event_user(1);
		_collided_previous=false;
	}
}