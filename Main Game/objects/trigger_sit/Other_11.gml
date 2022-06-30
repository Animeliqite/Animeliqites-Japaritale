///@desc Leave

event_inherited();

audio_play_sound(snd_noise, 0, 0);
instance_destroy(audio_pitcher);
BGM_SetPitch(0, 1);
camera.target = object_char;
object_char.x = prevX;
object_char.y = prevY;
object_char.sprite_index = spr_char_kaban_down;
object_char.image_speed = 0;
object_char.image_index = 0;
object_char.dir_locked = false;
object_char.moveable = true;
_triggered = false;