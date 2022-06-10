executedOnce = false;

Anim_Create(id, "executedOnce", 0, 0, 0, 1, 1, 60, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(id, "image_alpha", 0, 0, 0, 1, 30, 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(id, "image_alpha", 0, 0, 1, 0, 30, 60, -1, -1, ANIM_MODE.ONESHOT, false);

image_alpha = 0;
image_xscale = 2 + random(1);
hspeed = 0.05;
depth = 400;