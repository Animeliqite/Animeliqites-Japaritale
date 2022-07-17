depth = -10000;

surf = -1;
blinkPhase = 0;
xx = 640;
yy = 20;

image_xscale = 3;
image_yscale = 3;
image_speed = 0;
image_index = 0;

Anim_Create(id, "xx", ANIM_TWEEN.SINE, ANIM_EASE.OUT, 640, -sprite_width - 20, 10);
Anim_Create(id, "xx", ANIM_TWEEN.SINE, ANIM_EASE.IN, 640 - sprite_width - 20, sprite_width + 20, 10, 60);
Anim_Create(id, "blinkPhase", 0, 0, 0, 1, 1, 50);
alarm[0] = 70;
alarm[1] = 20;
alarm[2] = 20;