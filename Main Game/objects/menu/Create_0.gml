_menu=-1;
_mode=0;

_prefix="{gui true}{instant true}{shadow false}{font 1}{scale 2}";
_inst_instruction=noone;
_inst_begin=noone;
_inst_header=noone;
_inst_settings=noone;
_inst_name=noone;
_inst_lv=noone;
_inst_time=noone;
_inst_room=noone;
_inst_continue=noone;
_inst_reset=noone;
_inst_settings=noone;
_inst_naming_title=noone;
_inst_naming_letters=noone;
_inst_naming_quit=noone;
_inst_naming_backspace=noone;
_inst_naming_done=noone;

_inst_confirm_title=noone;
_inst_confirm_yes=noone;
_inst_confirm_no=noone;

_choice=0;
_chosen_file=0;
_choice_file_phase=0;
_choice_naming=0;
_choice_naming_letter=0;
_choice_naming_command=0;
_choice_confirm=0;

_confirm_title="";
_confirm_valid=true;
_confirm_name_x=0;
_confirm_name_y=0;
_confirm_name_scale=0;
_confirm_name_offset_x=0;
_confirm_name_offset_y=0;
_confirm_name_angle=0;
_confirm_name_update=true;

_naming_name="";

_heart_pos_curr_x=130;
_heart_pos_curr_y=145;
_heart_pos_x=[];
_heart_pos_y=[];

_change_inst=noone;
_change_color=c_white;
_change_id=-1;

_file_name=[];
_file_time=[];
_file_room=[];
_file_text_start=array_create(2,"bepis");

event_user(0);
BGM_Play(0, bgm_menu0);