function Dialog_Start(top = -1) {
	if(!instance_exists(ui_dialog)&&!Player_IsInBattle()){
		var INST=instance_create_depth(0,0,0,ui_dialog);
		if(top!=-1) INST._top=top;
		return true;
	}else{
		return false;
	}


}
