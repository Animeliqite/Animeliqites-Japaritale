///@desc Use
Dialog_Add_Ext("* I threw the paper plane&  directly at the side&  of the CELLIEN...");
Dialog_Add_Ext("* And the wind supported&  its flight, making the&  whole process easier.");
Dialog_Add_Ext("* I need to instruct SERVAL.");
Dialog_Start();

Item_Add(item_paperplane);
Item_Remove(_item_slot);

event_inherited();