///@desc Use
battle_enemy_cellien_big._draw_paperplane=true;
Dialog_Add_Ext("* I threw the paper plane&  directly at the side&  of the CELLIEN...{sleep 120}{end}","{skippable false}");
Dialog_Add_Ext("* And the wind supported&  its flight, making the&  whole process easier.{sleep 120}{end}","{skippable false}");
Dialog_Add_Ext("* I need to instruct SERVAL.{sleep 120}","{skippable false}{end}");
Dialog_Start();

Item_Add(item_paperplane);
Item_Remove(_item_slot);

event_inherited();