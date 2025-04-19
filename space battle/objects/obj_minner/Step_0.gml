/// @description Insert description here
// You can write your code in this editor
move_wrap(true, true, 10);
direction = image_angle;
image_speed = 1;
speed = 6;

if (!alarm[0] && loaded) {
	var _mine_x = x + lengthdir_x(14, image_angle);
    var _mine_y = y + lengthdir_y(14, image_angle);	
	var mine = instance_create_layer(_mine_x, _mine_y, "Instances", obj_mine);
	mine.image_angle = image_angle + 180;
	alarm[0] = 90;
	loaded = false;
}