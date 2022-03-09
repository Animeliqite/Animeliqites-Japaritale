var inst=_inst;
if(instance_exists(inst)){
	if (!global._gmu_cutscene) {
		if (_timer >= 135) {
			Cutscene_End(-1);
			Cutscene_Begin();
			battle_enemy_cellien_small._phase++;
			_timer = 0;
		}
		else {
			with (inst) {
				mp_linear_step(battle_soul.x, battle_soul.y, other._inst_speed, false);
				image_angle = point_direction(x, y, battle_soul.x, battle_soul.y);
				_hurt_amount = Player_GetHp() - 1;
			}
			_timer+=1;
		}
	}
}

if(!instance_exists(_inst)){
	Cutscene_End(-1);
	Cutscene_Begin();
	battle_enemy_cellien_small._phase = 4;
	instance_destroy();
}