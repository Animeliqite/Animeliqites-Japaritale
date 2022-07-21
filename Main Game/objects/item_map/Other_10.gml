///@desc Use
Dialog_Add_Ext("* Tossing all my worriness&  away, I began by&  folding the paper.");
Dialog_Add_Ext("* After some time, the \"{color `yellow`}PAPER PLANE{color `white`}\"&  became ready for action.");
Dialog_Start();

Item_Add(item_paperplane);
Item_Remove(_item_slot);

event_inherited();