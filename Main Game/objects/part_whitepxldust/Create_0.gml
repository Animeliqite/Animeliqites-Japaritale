executedOnce = false;

Anim_Create(id, "executedOnce", 0, 0, 0, 1, 1, 1, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(id, "image_alpha", 0, 0, 1, 0, 20, 0, -1, -1, ANIM_MODE.ONESHOT, false);

image_alpha = 1;
image_xscale = 2 + random(1);
image_yscale = image_xscale;
hspeed = (char_player.dir == DIR.LEFT ? -0.05 : (char_player.dir == DIR.RIGHT ?  0.05 : random(1)));
vspeed = (char_player.dir == DIR.UP ? -0.05 : (char_player.dir == DIR.DOWN ?  -0.05 : random(1)));
depth = char_player.depth;

Anim_Create(id, "image_xscale", 0, 0, image_xscale, 1, 20, 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(id, "image_yscale", 0, 0, image_yscale, 1, 20, 0, -1, -1, ANIM_MODE.ONESHOT, false);