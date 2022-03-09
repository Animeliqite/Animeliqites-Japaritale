///@desc Soul Collision

event_inherited();
Player_Hurt(_hurt_amount);
if (_destroy_on_hit) instance_destroy();