_inst_typer = -1;
_last_frame = false;
_last_frame_y = 138;

_text_no = 0;
text = [
	"Once upon a time,&there existed an island&where two varieties&of people lived.{sleep 120}{event 0}",
	"One fateful day,&however, creatures&arose within a strange&power.{sleep 120}{event 0}",
	"Despite all, the&people's urge to&victory stood still.{sleep 120}{event 0}",
	"But anomalies wouldn't&cease to exist even&after all this.{sleep 120}{event 0}",
	"Many years after the&incident...{sleep 120}{event 0}",
	"MT. SANDSTAR, 201X{sleep 120}{event 0}",
	"It was a magical but&ordinary-at-first zoo&where it welcomed&thousands of visitors.{sleep 120}{event 0}",
	"{sleep 240}{event 0}",
	"{sleep 240}{event 0}",
	"{sleep 240}{event 0}",
	"{sleep 240}{event 0}",
	"{sleep 120}{event 1}{sleep 1200}{event 2}",
];

BGM_Play(0, bgm_intro, false);
BGM_SetPitch(0, 0.95);
image_speed = 0;
image_index = 0;

writeText = function () {
	_inst_typer = Typer_Type(60, 160, text[_text_no], "{skip_space false}{skippable false}{voice 1}{speed 0}{space_x 1}", true);
}
writeText();