///@desc Turn Start

//Start the attack!
Anim_Create(battle_board, "up", 0, 0, battle_board.up, 8, round(abs((8-battle_board.up)/15)), 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(battle_board, "down", 0, 0, battle_board.down, 8, round(abs((8-battle_board.down)/15)), 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(battle_board, "left", 0, 0, battle_board.left, 8, round(abs((8-battle_board.left)/15)), 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(battle_board, "right", 0, 0, battle_board.right, 8, round(abs((8-battle_board.right)/15)), 0, -1, -1, ANIM_MODE.ONESHOT, false);
battle_soul.x = battle_board.x;
battle_soul.y = battle_board.y;
battle_soul.moveable = false;
alarm[0] = 1;