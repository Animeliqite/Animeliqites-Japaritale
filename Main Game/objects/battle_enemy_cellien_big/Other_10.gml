///@desc Init

Battle_SetEnemyName(_enemy_slot,"* Cellien");

Battle_SetEnemyActionNumber(_enemy_slot,2);
Battle_SetEnemyActionName(_enemy_slot,0,"* Check");
Battle_SetEnemyActionName(_enemy_slot,1,"* Plan");

Battle_SetEnemyDEF(_enemy_slot,-15);

_anim_speed=0.5;
_has_planned=false;

_eye_black_x=0;
_eye_black_y=0;
_eye_x=0;
_eye_y=0;

_hp_max=100;
_hp=100;

y-=25;