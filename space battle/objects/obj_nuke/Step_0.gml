/// @description Insert description here
// You can write your code in this editor
speed = clamp(speed,0,16);
motion_add(image_angle, 0.5);

var distance_this_step = speed;

traveled_distance += distance_this_step;

if (traveled_distance >= max_distance) {
    instance_destroy();
}

var target_angle = point_direction(x, y, mouse_x, mouse_y);
var turn_speed = 2;
var angle_diff = angle_difference(image_angle, target_angle - 180);

if (abs(angle_diff) <= turn_speed - 1) {
    image_angle = target_angle - 180; // Snap to the target angle
} else {
    // Rotate toward target using shortest path
    image_angle += turn_speed * sign(angle_diff);
	}

// Ensure angle stays within valid range
image_angle = (image_angle + 360) mod 360;

if (mouse_check_button(mb_right) && !alarm[0]) {
	instance_create_layer(x,y,"Instances",obj_boom);
	instance_destroy();
}