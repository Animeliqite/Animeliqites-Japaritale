// This script changes things up for the X order
function Cutscene_ChangeOrder(order_no) {
	cutscene._current_order = order_no;
	cutscene._wait_frames = 0;
	cutscene._wait = false;
}