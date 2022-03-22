var inst=battle_bullet_sparkle;
var enemy=Battle_GetEnemy(1);
var inst_2;
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
			battle_bullet_sparkle.speed = 1;
		}
		if (_timer == 75) {
			Anim_Create(battle_bullet_sparkle, "speed", ANIM_TWEEN.SINE, ANIM_EASE.OUT, 1, 0, room_speed * 2, 0, -1, -1, ANIM_MODE.ONESHOT, false);
			inst_2 = instance_create_depth(enemy.x, enemy.y - enemy.sprite_height - 64, 0, battle_bullet_serval_paw);
			Anim_Create(inst_2, "image_alpha", 0, 0, 0, 1, room_speed, 0, -1, -1, ANIM_MODE.ONESHOT, false);
			Anim_Create(inst_2, "image_angle", ANIM_TWEEN.SINE, ANIM_EASE.OUT, 720, 180, room_speed, 0, -1, -1, ANIM_MODE.ONESHOT, false);
			Anim_Create(inst_2, "y", ANIM_TWEEN.CIRC, ANIM_EASE.IN, inst_2.y, enemy.y - (enemy.sprite_height / 1.5), room_speed / 2, room_speed, -1, -1, ANIM_MODE.ONESHOT, false);
			Anim_Create(inst_2, "image_alpha", 0, 0, 1, 0, room_speed, room_speed * 2, -1, -1, ANIM_MODE.ONESHOT, false);
		}
		if (_timer == 120) {
			Cutscene_End(-1);
			Cutscene_Begin();
			battle_enemy_cellien_small._phase = 6;
			Anim_Create(battle_bullet_sparkle, "image_alpha", 0, 0, 1, 0, room_speed, 0, -1, -1, ANIM_MODE.ONESHOT, false);
			Anim_Create(battle_bullet_sparkle, "speed", ANIM_TWEEN.SINE, ANIM_EASE.OUT, -1, 0, room_speed, 0, -1, -1, ANIM_MODE.ONESHOT, false);
			audio_stop_sound(snd_cellien_laugh);
			Camera_Shake(4, 4);
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