var DIALOG = array_create(8, "");
/*var DIALOG_ARRAY = [
	"That SPARKLE of yours&is your essence!&It's the most valuable&of them all!",
	"More than just any&simple soul, it's&happiness and joy!",
	"Your innermost thoughts&and emotions...&that and much more.",
	"That's {color_text `blue`}SPARKLE{color_text `black`},&abstract, unique and&absolutely irreplaceable.",
	"Well, with that much&worth, causes foes&who'd want to take&it from you.",
	"No panicking needed,&it's quite easy to&solve.",
	"Take this as an advice:&Use your ARROW KEYS&to move around.",
	"Dodge the incoming&bullets, and show&them who's the boss.",
	"Now let's test your&knowledge and skills&at this very moment."
];*/

for (var i = 0; i < 11; i++)
	DIALOG[0] += Lang_GetString("monster.cellien_small.battle_dialog." + string(i)) + "{pause}" + (i == 10 ? "{end}" : "{clear}");

for (var i = 0; i < 2; i++)
	DIALOG[1] += Lang_GetString("monster.cellien_small.battle_dialog_dodge.0." + string(i)) + "{pause}" + (i == 1 ? "{end}" : "{clear}");

for (var i = 0; i < 2; i++)
	DIALOG[2] += Lang_GetString("monster.cellien_small.battle_dialog_dodge.1." + string(i)) + "{pause}" + (i == 1 ? "{end}" : "{clear}");

for (var i = 0; i < 1; i++)
	DIALOG[3] += Lang_GetString("monster.cellien_small.battle_dialog_dodge.2." + string(i)) + "{pause}" + (i == 0 ? "{end}" : "{clear}");

for (var i = 0; i < 5; i++)
	DIALOG[4] += Lang_GetString("monster.cellien_small.battle_dialog_collide.0." + string(i)) + "{pause}" + (i == 4 ? "{end}" : "{clear}");

for (var i = 0; i < 5; i++)
	DIALOG[5] += Lang_GetString("monster.cellien_small.battle_dialog_collide.1." + string(i)) + "{pause}" + (i == 4 ? "{end}" : "{clear}");

for (var i = 0; i < 1; i++)
	DIALOG[6] += Lang_GetString("monster.cellien_small.battle_dialog_threaten." + string(i)) + "{pause}" + (i == 0 ? "{end}" : "{clear}");

for (var i = 1; i < 3; i++)
	DIALOG[7] += Lang_GetString("monster.cellien_small.battle_dialog_aftermath." + string(i)) + "{pause}" + (i == 2 ? "{end}" : "{clear}");

if (global.event == 1) {
	image_index = 0;
	image_speed = 0;
	sprite_index = spr_cellien_monster_normal;
}
if (global.event == 2) {
	image_index = 0;
	image_speed = 0;
	sprite_index = spr_cellien_monster_happy;
}
if (global.event == 3) {
	image_index = 0;
	image_speed = 0;
	sprite_index = spr_cellien_monster_sad;
}
if (global.event == 4) {
	image_index = 0;
	image_speed = 0;
	sprite_index = spr_cellien_monster_question;
}
if (global.event == 5) {
	image_index = 0;
	image_speed = 0;
	sprite_index = spr_cellien_monster_blink;
}
if (global.event == 6) {
	image_index = 0;
	image_speed = 0.16;
	sprite_index = spr_cellien_monster_blink_anim;
}
if (global.event == 7) {
	image_index = 0;
	image_speed = 0;
	sprite_index = spr_cellien_monster_shocked;
}
if (global.event == 10) {
	battle_soul_red.moveable = true;
	_show_controls = true;
	global.event = -9999;
}

switch (_phase) {
	case 0:
		if (global._gmu_cutscene) {
			C_Wait(0, 15);
			C_Execute(1, Battle_CreateBubble, [DIALOG[0], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(1, battle_dialog_enemy);
			C_Execute(2, instance_create_depth, [0, 0, 0, battle_turn_sparkle_follow]);
			C_Execute(2, variable_instance_set, [object_index, "_show_controls", false]);
			C_Wait(2, 1);
			Cutscene_End(3);
		}
		break;
	case 1:
		if (global._gmu_cutscene) {
			_dodged = true;
			C_Execute(0, variable_instance_set, [battle_soul_red, "moveable", false]);
			C_Execute(0, Battle_CreateBubble, [DIALOG[1], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(0, battle_dialog_enemy);
			C_Execute(1, BGM_SetPitch, [0, 1.1]);
			C_Execute(1, variable_global_set, ["event", -9999]);
			C_Execute(1, variable_instance_set, [battle_soul_red, "moveable", true]);
			C_Execute(1, variable_instance_set, [battle_turn_sparkle_follow, "_inst_speed", 1.5]);
			C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_normal]);
			Cutscene_End(1);
		}
		break;
	case 2:
		if (global._gmu_cutscene) {
			_dodged = true;
			C_Execute(0, variable_instance_set, [battle_soul_red, "moveable", false]);
			C_Execute(0, Battle_CreateBubble, [DIALOG[2], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(0, battle_dialog_enemy);
			C_Execute(1, BGM_SetPitch, [0, 1.2]);
			C_Execute(1, variable_global_set, ["event", -9999]);
			C_Execute(1, variable_instance_set, [battle_soul_red, "moveable", true]);
			C_Execute(1, variable_instance_set, [battle_turn_sparkle_follow, "_inst_speed", 2]);
			C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_normal]);
			Cutscene_End(1);
		}
		break;
	case 3:
		if (global._gmu_cutscene) {
			_dodged = true;
			C_Execute(0, variable_instance_set, [battle_soul_red, "moveable", false]);
			C_Execute(0, Battle_CreateBubble, [DIALOG[3], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(0, battle_dialog_enemy);
			C_Execute(1, BGM_SetPitch, [0, 1.3]);
			C_Execute(1, variable_global_set, ["event", -9999]);
			C_Execute(1, variable_instance_set, [battle_soul_red, "moveable", true]);
			C_Execute(1, variable_instance_set, [battle_turn_sparkle_follow, "_inst_speed", 5]);
			C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_normal]);
			Cutscene_End(1);
		}
		break;
	case 4:
		if (global._gmu_cutscene) {
			global.event = -9999;
			C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_blink_anim]);
			C_Execute(0, variable_instance_set, [object_index, "image_index", 0]);
			C_Execute(0, variable_instance_set, [object_index, "image_speed", 0.16]);
			C_Execute(0, BGM_Stop, [0]);
			C_Execute(0, Camera_Shake, [8, 0, 1, 1]);
			C_Wait(0, 45);
			C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_blink]);
			C_Execute(1, variable_instance_set, [object_index, "image_index", 0]);
			C_Execute(1, variable_instance_set, [object_index, "image_speed", 0]);
			C_Execute(1, Battle_CreateBubble, [DIALOG[(!_dodged ? 4 : 5)], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(1, battle_dialog_enemy);
			C_Execute(2, instance_create_depth, [0, 0, 0, battle_turn_sparkle_circle]);
			Cutscene_End(2);
		}
		break;
	case 5:
		if (global._gmu_cutscene) {
			global.event = -9999;
			C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_laugh_pre]);
			C_Execute(0, Battle_CreateBubble, [DIALOG[6], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(0, battle_dialog_enemy);
			C_Execute(1, variable_instance_set, [object_index, "_laugh", true]);
			C_Execute(1, variable_instance_set, [object_index, "image_speed", 0.5]);
			C_PlaySfx(1, snd_cellien_laugh);
			Cutscene_End(1);
		}
		break;
	case 6:
		if (global._gmu_cutscene) {
			if (cutscene._current_order == 3) {
				if (instance_exists(shaker)) {
					with (shaker) {
						shake_decrease = 0.25;
					}
				}
			}
			_laugh = false;
			C_Execute(0, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_squished]);
			C_Execute(0, Object_Shake, [4, "x", object_index, 1, true]);
			C_Execute(0, Object_Shake, [4, "y", object_index, 1, true]);
			C_Execute(0, Camera_Shake, [4, 4, 1, 1, true, true]);
			C_PlaySfx(0, snd_damage, 1, 0.5);
			C_Wait(0, 60);
			C_Execute(1, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_angry]);
			C_PlaySfx(1, snd_bluh, 1, 0.5);
			C_CreateAnim(1, object_index, "image_xscale", ANIM_TWEEN.ELASTIC, ANIM_EASE.OUT, 0.92, 1, room_speed, false);
			C_CreateAnim(1, object_index, "image_yscale", ANIM_TWEEN.ELASTIC, ANIM_EASE.OUT, 1.07, 1, room_speed, false);
			C_Wait(1, 60);
			C_Execute(2, Object_Shake, [1, "x", object_index, 0, true, 0]);
			C_Execute(2, Object_Shake, [1, "y", object_index, 0, true, 0]);
			C_Execute(2, Battle_CreateBubble, [Lang_GetString("monster.cellien_small.battle_dialog_aftermath.0"), "{voice 3}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(2, battle_dialog_enemy);
			C_Execute(3, variable_instance_set, [object_index, "sprite_index", spr_cellien_monster_blink]);
			C_Wait(3, 30);
			C_Execute(4, Battle_CreateBubble, [DIALOG[7], "{voice 2}{effect -1}", 100, -(self.sprite_height / 2) - 25]);
			C_WaitUntilDestroy(4, battle_dialog_enemy);
			C_Execute(5, BGM_Play, [0, bgm_cymbal, false]);
			C_FadeFader(5, -1, 1, 160, 0, c_white);
			C_Wait(5, 160);
			C_Execute(6, room_goto, [room_savannah_0]);
			C_FadeFader(6, -1, 0, 30, 0, c_white);
			Cutscene_End(6);
		}
		break;
}