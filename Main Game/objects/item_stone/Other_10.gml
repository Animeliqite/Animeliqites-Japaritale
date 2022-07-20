///@desc Use
Dialog_Add_Ext("* I threw some stones at&  the CELLIEN, but they all&  went far away.");
Dialog_Add_Ext("* Perhaps I have to use&  another item?");
Dialog_Start();

Item_Remove(_item_slot);

event_inherited();