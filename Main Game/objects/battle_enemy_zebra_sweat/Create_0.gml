randomize();

Anim_Create(id, "image_alpha", 0, 0, 0, 1, 20, 0, -1, -1, ANIM_MODE.ONESHOT, false);
Anim_Create(id, "image_alpha", 0, 0, 1, 0, 20, 20, -1, -1, ANIM_MODE.ONESHOT, false);
direction = random(180);
gravity_direction = 270;
gravity = 0;
speed = 4;

hasFallenDown = false;
alarm[0] = 3;