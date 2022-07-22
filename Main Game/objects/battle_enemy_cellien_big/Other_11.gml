///@desc Battle Start

Anim_Create(id, "_eye_black_x", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _eye_black_x, 5, 30, random(15), -1, -1, ANIM_MODE.PINGPONG, false);
Anim_Create(id, "_eye_black_y", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _eye_black_y, 5, 30, random(15) + 15, -1, -1, ANIM_MODE.PINGPONG, false);

Anim_Create(id, "_eye_x", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _eye_x, 5, 30, random(15), -1, -1, ANIM_MODE.PINGPONG, false);
Anim_Create(id, "_eye_y", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _eye_y, 5, 30, random(15) + 15, -1, -1, ANIM_MODE.PINGPONG, false);

Anim_Create(id, "_body_x", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _body_x, 5, 30, random(15), -1, -1, ANIM_MODE.PINGPONG, true);
Anim_Create(id, "_body_y", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _body_y, 5, 30, random(15) + 15, -1, -1, ANIM_MODE.PINGPONG, true);

Anim_Create(id, "_core_part_scale_x", 0, 0, _core_part_scale_x, 0.5, 30, 30, -1, -1, ANIM_MODE.REPEAT, false);
Anim_Create(id, "_core_part_scale_y", 0, 0, _core_part_scale_y, 0.5, 30, 30, -1, -1, ANIM_MODE.REPEAT, false);
Anim_Create(id, "_core_part_alpha", 0, 0, 1, 0, 30, 30, -1, -1, ANIM_MODE.REPEAT, false);

Anim_Create(id, "_anim_speed", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, _anim_speed, 1.5, 30, 0, -1, -1, ANIM_MODE.PINGPONG, true);