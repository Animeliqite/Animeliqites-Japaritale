randomize();
hasFallenDown = false;
imgAlphaDuration = 20;

Anim_Create(id, "image_alpha", 0, 0, 0, 1, imgAlphaDuration, 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(id, "image_alpha", 0, 0, 1, 0, imgAlphaDuration, imgAlphaDuration, -1, -1, ANIM_MODE.ONESHOT, false);
image_xscale = 1.5;
image_yscale = 1.5;
direction = random(180);
gravity_direction = 270;
gravity = 0;
speed = 4;

alarm[0] = 3;