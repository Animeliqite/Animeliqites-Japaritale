///@desc Soul Collision

event_inherited();
Player_Hurt(_hurt_amount);
if (_destroy_on_hit) instance_destroy();
if (_hurt_amount <= 0) {
	audio_stop_sound(snd_hurt);
	audio_play_sound(snd_item_heal, 0, false);
	battle_soul._inv = 1;
	Camera_Shake(0, 0);
}