var inst=battle_bullet_sparkle;
if(instance_exists(inst)){
	with (inst) {
		direction = point_direction(x, y, battle_soul.x, battle_soul.y);
		image_angle = point_direction(x, y, battle_soul.x, battle_soul.y);
		image_speed = 0;
		image_index = other._inst_image_index;
		_hurt_amount = -(Player_GetHpMax() - Player_GetHp());
	}
	if (!global._gmu_cutscene&&Battle_GetEnemy(1)._phase == 5) {
		_timer+=1;
		if (_timer == 1) {
			battle_bullet_sparkle.speed = -0.25;
		}
		if (_timer == 60) {
			battle_bullet_sparkle.speed = 1.5;
		}
		with (inst) {
			if (place_meeting(x, y, battle_soul))
				instance_destroy();
		}
	}
}

if(!instance_exists(battle_bullet_sparkle)&&_l_dir>=360){
	Cutscene_End(-1);
	Cutscene_Begin();
	battle_enemy_cellien_small._phase = 6;
	instance_destroy();
}