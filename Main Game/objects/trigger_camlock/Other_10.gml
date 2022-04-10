///@desc Trigger


var obj = id;
camera.target = noone;
if (point_distance(camera.x, camera.y, obj.targetX - (camera.width / camera.scale_x / 2), obj.targetY - (camera.height / camera.scale_y / 2)) > spd) {
	with (camera) mp_linear_step(obj.targetX - (camera.width / camera.scale_x / 2), obj.targetY - (camera.height / camera.scale_y / 2), obj.spd, false);
}
else event_inherited();