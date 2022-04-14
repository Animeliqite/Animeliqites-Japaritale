repeat (_repeat_amount) {
	randomize();
	part_particles_create(partsystem, _part_x + random(_part_random_x), _part_y + random(_part_random_y), parttype, 1);
}
alarm[0] = _delay;