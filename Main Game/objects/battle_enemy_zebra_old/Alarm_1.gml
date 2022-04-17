repeat (shakeAmount) instance_create_depth(x, y - sprite_height / 2, DEPTH_BATTLE.ENEMY+1, battle_enemy_zebra_sweat);
if (shakeAmountFake != 0) alarm[1] = ceil(15 / (shakeAmount / 7));