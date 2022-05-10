                                         function Battle_CreateBubble(text,prefix="",offset_x=0,offset_y=0,template=0,auto_sleep=true){
	var punctuations = ["!", "?", ".", ",", ":", ";"];
	var text_full = text;
	
	if (auto_sleep)
		for (var i = 0; i < array_length(punctuations); i++) text_full = string_replace_all(text_full, punctuations[i], punctuations[i] + "{sleep 20}");
	text_full = string_replace_all(text_full, "{end_ar}", "{pause}{clear}");
	text_full = string_replace_all(text_full, "{w}", "{sleep 20}");
	
	var inst=instance_create_depth(x+offset_x,y+offset_y,0,battle_dialog_enemy);
	inst.text=prefix+text_full;
	inst.template=template;
	return inst;

}