///@desc Init

Battle_SetEnemyName(_enemy_slot,"* Zebra-chan");

Battle_SetEnemyActionNumber(_enemy_slot,3);
Battle_SetEnemyActionName(_enemy_slot,0,"* Check");
Battle_SetEnemyActionName(_enemy_slot,1,"* Greet");
Battle_SetEnemyActionName(_enemy_slot,2,"* Pat");

Battle_SetEnemyDEF(_enemy_slot,-15);

image_index=0;
image_speed=0;

Cutscene_End(-1);

_cutscene_no=-1;
_damage_taken=0;
_steps_done=0;
_hp_max=100;
_hp=100;

startedJustNow = true;

partCreatedOnce = false;
shakeFast = true;

sweatAlpha = 1;
sweatOffsetY = 0;
sweatScaleX = 1.25;
sweatScaleY = 1.25;

shakeAmount = 7;
shakeAmountFake = shakeAmount;

Anim_Create(id, "x", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, xstart - 5, 10, room_speed, 0, -1, -1, ANIM_MODE.PINGPONG, true);
Anim_Create(id, "image_xscale", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, 1.05, 1, room_speed * 2, 0, -1, -1, ANIM_MODE.PINGPONG, false);
Anim_Create(id, "image_yscale", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, 1, 1.05, room_speed * 2, 0, -1, -1, ANIM_MODE.PINGPONG, false);

//Anim_Create(id, "sweatAlpha", 0, 0, 0.5, 1, room_speed / 4, 0, -1, -1, ANIM_MODE.PINGPONG, false);
Anim_Create(id, "sweatOffsetY", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, 0, 10, room_speed / 2, 0, -1, -1, ANIM_MODE.PINGPONG, true);
//Anim_Create(id, "sweatScaleY", ANIM_TWEEN.SINE, ANIM_EASE.IN_OUT, 1.25, 2, room_speed / 2, 0, -1, -1, ANIM_MODE.PINGPONG, false);

finalDialog = "";
var finalDialogArray = [
	"It was... honestly nice&to meet someone like&you...",
	"M-my name is&Zebra-chan.&I l-live just around&here.",
	"You were i-ideal to be a&f-friend of mine after&your e-expression&towards my stripes...",
	"W-well, thank you."
];
for (var i = 0; i < array_length(finalDialogArray); i++)
	finalDialog += finalDialogArray[i] + (i >= array_length(finalDialogArray) - 1 ? "{pause}{end}" : "{end_ar}" );

failDialog = "";
var failDialogArray = [
	"{effect 0}"+"I-I'm so sorry!",
	"{effect 1}"+"I hope I-I didn't hurt you&too much...",
	"Though, I a-appreciate the&effort of yours.",
	"So, t-thank you!"
];
for (var i = 0; i < array_length(failDialogArray); i++)
	failDialog += failDialogArray[i] + (i >= array_length(failDialogArray) - 1 ? "{pause}{end}" : "{end_ar}" );