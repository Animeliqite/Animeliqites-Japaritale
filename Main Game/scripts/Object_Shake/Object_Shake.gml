///@arg distance
///@arg var_name
///@arg target
///@arg shake_speed*
///@arg shake_random*
///@arg shake_decrease*

function Object_Shake() {
	var DISTANCE=argument[0];
	var VAR_NAME=argument[1];
	var TARGET=argument[2];
	var SPEED=0;
	var RANDOM=false;
	var DECREASE=1;
	
	if(argument_count>=4){
		SPEED=argument[3];
	}
	if(argument_count>=5){
		RANDOM=argument[4];
	}
	if(argument_count>=6){
		DECREASE=argument[5];
	}
	
	with(instance_create_depth(0,0,0,shaker)){
		target=TARGET;
		var_name=VAR_NAME;
		shake_distance=DISTANCE;
		shake_decrease=DECREASE;
		shake_speed=SPEED;
		shake_random=RANDOM;
	}
	
	return true;


}
