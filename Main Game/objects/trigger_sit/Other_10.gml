///@desc Trigger

event_inherited();

audio_play_sound(snd_noise, 0, 0);
BGM_SetPitch(0, 0.9, true, 60, ANIM_TWEEN.LINEAR, false, 60);
camera.target = noone;
prevX = object_char.x;
prevY = object_char.y;
object_char.x = x + (sprite_width / 2);
object_char.y = y + (sprite_height / 2);
object_char.sprite_index = targetSprite;
object_char.image_speed = 0.1;
object_char.dir_locked = true;
object_char.moveable = false;