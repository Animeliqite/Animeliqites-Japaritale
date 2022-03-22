var SOUL = battle_soul;
_inst[array_length(_inst)]=instance_create_depth(SOUL.x+lengthdir_x(60, _l_dir),SOUL.y-lengthdir_y(60, _l_dir),0,battle_bullet_sparkle);
_inst[array_length(_inst)-1]._aggressive=true;
audio_stop_sound(snd_pellet);
audio_play_sound(snd_pellet, 0, false);
_l_dir += 360 / 16;

if (_l_dir < 360) {
	alarm[0] = 1;
}
else {
	alarm[1] = room_speed;
}