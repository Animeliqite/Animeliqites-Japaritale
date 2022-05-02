///@desc Turn Start

//Start the attack!
var ENEMY = Battle_GetEnemy(1);
if (!_created_once) {
	_inst=instance_create_depth(ENEMY.x,ENEMY.y,0,battle_bullet_sparkle);
	_created_once = true;
}