event_inherited();

if (x < battle_board.x - battle_board.left - 10) ||
	(x > battle_board.x + battle_board.right + 10) ||
	(y < battle_board.y - battle_board.up - 10) ||
	(y > battle_board.y + battle_board.down + 10)
	instance_destroy();