///@desc Soul Collision

event_inherited();

Player_Hurt(Player_CalculateDamage(1));
Battle_GetEnemy(1)._damage_taken++;
instance_destroy();