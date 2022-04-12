event_inherited();

sprite_index=(Encounter_FightEnabled(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.ENCOUNTER))==true) ? Lang_GetSprite("battle.button.fight",spr_default) : Lang_GetSprite("battle.button.fight.empty",spr_default);