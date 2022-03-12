Cutscene_End(-1);
_inst_speed = round(point_distance(battle_bullet_sparkle.x, battle_bullet_sparkle.y, battle_soul.x, battle_soul.y) / 120);
Cutscene_Begin();
Battle_GetEnemy(1)._phase = 5;