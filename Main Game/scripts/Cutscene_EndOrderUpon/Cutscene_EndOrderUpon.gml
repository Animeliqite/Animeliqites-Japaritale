// This script ends the current order and goes to the next one
function Cutscene_EndOrderUpon(order_to_check) {
	with (cutscene) {
		if (_current_order == order_to_check) {
			_current_order++;
			_sleep_timer = 0;
			_got_once = false;
		}
	}
}
