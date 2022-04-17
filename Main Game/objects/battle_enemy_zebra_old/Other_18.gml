///@desc Turn Preparation Start

//Prepare the attack
var rand = choose(battle_turn_stripe, battle_turn_leaf);
instance_create_depth(0,0,0,rand);

//shakeFast = false;

//Say something
if(_steps_done==1){
	Cutscene_Begin();
}
else if(_steps_done==2){
	Battle_CreateBubble("Haha...&I can't even take&a single patting!","{speed 2}", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale));
}
else if(_steps_done==3){
	Battle_CreateBubble("So you like my stripes...","{speed 2}", (sprite_width / 1.75) * image_xscale, -((sprite_height / 2) * image_yscale));
}