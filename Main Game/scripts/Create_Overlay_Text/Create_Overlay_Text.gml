function Create_Overlay_Text(TEXT,CONDITION_NO=-1,COLOR=c_white,BG_COLOR=c_black,BG_ALPHA=0.75){
	var INST=instance_create_depth(0,0,0,ui_overlay_text);
	INST.str_text=TEXT;
	INST.str_color=COLOR;
	INST.bg_color=BG_COLOR;
	INST.bg_alpha=BG_ALPHA;
	INST.condition_no=CONDITION_NO;
}