///@desc Use
Dialog_Add_Ext("* With full hope and urge,&  I folded the paper map&  in an accurate way...");
Dialog_Add_Ext("* And turned it into a&  \"{color `yellow`}PAPER PLANE{color `white`}\".");
Dialog_Start();

Item_Add(item_paperplane);
Item_Remove(_item_slot);

event_inherited();