///@desc Init

Battle_SetEnemyName(_enemy_slot,"* Cellien");

Battle_SetEnemyActionNumber(_enemy_slot,2);
Battle_SetEnemyActionName(_enemy_slot,0,"* Check");
Battle_SetEnemyActionName(_enemy_slot,1,"* Plan");

Battle_SetEnemyDEF(_enemy_slot,-15);

_anim_speed=0.5;
_has_planned=false;
_has_searched=false;
_actually_draw_paperplane=true;
_draw_paperplane=false;
_anim_paperplane_executed_once=false;
_planning_phase=0;

_paperplane_x=-250;
_paperplane_y=0;
_paperplane_dir=1;
_paperplane_xscale=1;
_paperplane_yscale=1;
_eye_black_x=0;
_eye_black_y=0;
_eye_black_x_add=0;
_eye_black_y_add=0;
_eye_black_scale_x=1;
_body_x=0;
_body_y=0;
_eye_x=0;
_eye_y=0;
_eye_x_add=0;
_eye_y_add=0;
_eye_black_x_add_speed=33;
_eye_x_add_speed=55;
_eye_scale_x=1;
_core_x=0;
_core_x_add=0;
_core_scale_x=0;

_hp_max=100;
_hp=100;

y-=25;