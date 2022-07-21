///@desc Use
battle_enemy_cellien_big._draw_paperplane=true;
Dialog_Add_Ext("* I threw the paper plane&  directly at the side&  of the CELLIEN...{sleep 120}{end}","{skippable false}");
Dialog_Add_Ext("* It then attracted the&  attention of the CELLIEN,{w}&  making it's core visible.{sleep 120}{end}","{skippable false}");
Dialog_Start();

Item_Remove(_item_slot);
Item_Remove(item_stone);
Item_Remove(item_stick);

event_inherited();