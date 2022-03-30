///@desc Init

Battle_SetEnemyName(_enemy_slot,"* Cellien");

Battle_SetEnemyActionNumber(_enemy_slot,1);
Battle_SetEnemyActionName(_enemy_slot,0,"* Check");

Battle_SetEnemyDEF(_enemy_slot,-15);

battle_soul_red.moveable = false;
global.event = -9999;
_show_controls=false;
_dodged=false;
_laugh=false;
_phase=0;
_hp_max=100;
_hp=100;

_shake = false;
_shake_x = 1;
_shake_y = 1;