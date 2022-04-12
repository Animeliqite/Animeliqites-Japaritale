randomize();
emptySpace = ceil(random_range(-40, 40));

var INST = [
	instance_create_depth(battle_board.x - (battle_board.left * 2.75), battle_board.y - battle_board.up + 20, DEPTH_BATTLE.BULLET, battle_bullet_stripes_left),
	instance_create_depth(battle_board.x + (battle_board.right * 2.75), battle_board.y - battle_board.up + 20, DEPTH_BATTLE.BULLET, battle_bullet_stripes_right)
];

INST[0].emptySpace = emptySpace;
INST[1].emptySpace = emptySpace;
alarm[0] = room_speed * 2;