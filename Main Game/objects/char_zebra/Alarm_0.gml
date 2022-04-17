repeat (5) {
	var INST = instance_create_depth(x + offsetX, y + offsetY - (sprite_height / 1.5), depth+1, battle_enemy_zebra_sweat);
	INST.sprite_index = spr_pixel;
	INST.speed = 1;
	INST.image_xscale = 1;
	INST.image_yscale = 1;
	INST.imgAlphaDuration = 5;
	
}
if (sprite_index == spr_char_zebra_shy_saddened)
	alarm[0] = 15;