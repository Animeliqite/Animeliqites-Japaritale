repeat (_repeat_amount) {
	randomize();
	randColor = make_color_rgb(random(255), random(255), random(255));
	randColorWhiter = make_color_hsv(random(255), 128, 255);
	
	switch (_particle_type) {
		case 1:
			part_type_color1(parttype, randColorWhiter);
			break;
	}
	
	part_particles_create(partsystem, _part_x + random(_part_random_x), _part_y + random(_part_random_y), parttype, 1);
}
alarm[0] = _delay;