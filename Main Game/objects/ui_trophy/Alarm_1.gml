if (blinkPhase == 0) {
	if (image_alpha == 1) image_alpha = 0.5;
	else if (image_alpha == 0.5) image_alpha = 1;
	alarm[1] = 2;
}
else {
	image_alpha = 1;
	alarm[1] = -1;
}