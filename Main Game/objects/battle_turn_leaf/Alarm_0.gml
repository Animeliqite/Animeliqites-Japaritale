randomize();
var randStart = battle_board.x - battle_board.left;
var randEnd = battle_board.x + battle_board.right;
var randBetween = random(abs(randStart - randEnd));

instance_create_depth(randStart + randBetween, battle_board.y - battle_board.up - 10, DEPTH_BATTLE.BULLET_OUTSIDE_HIGH, battle_bullet_leaf);
alarm[0] = room_speed;