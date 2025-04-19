/// @description Insert description here
// You can write your code in this editor

move_wrap(true, true, 10);
direction = image_angle;
image_speed = 1;
speed = 4;

if (!alarm[0] && loaded) {
	var _tracker_x = x + lengthdir_x(0, image_angle);
    var _tracker_y = y + lengthdir_y(0, image_angle);	
	var tracker = instance_create_layer(_tracker_x, _tracker_y, "Instances", obj_tracker);
	tracker.image_angle = image_angle + 180;
	alarm[0] = 900;
	loaded = false;
}