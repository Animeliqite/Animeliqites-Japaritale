var condition;
switch (condition_no) {
	default:
		condition = (false);
		break;
	case 0:
		condition = (char_player.actuallyRunning == true);
		break;
}

if (condition) instance_destroy();