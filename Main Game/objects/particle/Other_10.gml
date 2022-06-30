switch (_particle_type) {
	case 0:
		_repeat_amount = 25;
		partsystem = part_system_create();
		parttype = part_type_create();
		part_system_depth(partsystem,-8000);
		part_type_shape(parttype, pt_shape_pixel);
		part_type_scale(parttype, 1, 1);
		part_type_speed(parttype, 0.25, 0.75, 0, 0.25);
		part_type_color1(parttype, merge_color(c_white, c_yellow, 0.25));
		part_type_alpha3(parttype, 0, 0.75, 0);
		part_type_direction(parttype, -125, -45, 0, 0);
		part_type_life(parttype, room_speed * 2, room_speed * 4);
		break;
	case 1:
		randomize();
		_repeat_amount = 25;
		partsystem = part_system_create();
		parttype = part_type_create();
		part_system_depth(partsystem,-8000);
		part_type_shape(parttype, pt_shape_pixel);
		part_type_scale(parttype, 2, 2);
		part_type_speed(parttype, 0.5, 0.5, -0.005, 0);
		part_type_color1(parttype, randColorWhiter);
		part_type_alpha3(parttype, 0, 2, 0);
		part_type_orientation(parttype, -360, 360, 5, false, false);
		part_type_direction(parttype, 90, 90, 0, 0);
		part_type_life(parttype, room_speed * 2, room_speed * 2);
		break;
}