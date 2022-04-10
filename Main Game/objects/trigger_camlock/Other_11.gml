///@desc Leave

var obj = id;
if (point_distance(camera.x, camera.y, obj.collider.x - (camera.width / camera.scale_x / 2), obj.collider.y - (camera.height / camera.scale_y / 2)) > spd) {
	with (camera) mp_linear_step(obj.collider.x - (camera.width / camera.scale_x / 2), obj.collider.y - (camera.height / camera.scale_y / 2), obj.spd, false);
}
else {
	event_inherited();
	camera.target = collider;
}