/// @description Insert description here
// You can write your code in this editor

var distance_this_step = speed;

speed = clamp(speed, 0, 13)

traveled_distance += distance_this_step;

if (traveled_distance >= max_distance) {
    instance_destroy();
}

var target_angle = point_direction(x, y, obj_scout.x, obj_scout.y);
var distance_to_target = distance_to_object(obj_scout);

image_speed = 1;
friction = 0;
motion_add(image_angle, 0.3);

var turn_speed = 1;
var angle_diff = angle_difference(image_angle, target_angle - 180);

if (abs(angle_diff) <= turn_speed - 1) {
    image_angle = target_angle - 180; // Snap to the target angle
} else {
    // Rotate toward target using shortest path
    image_angle += turn_speed * sign(angle_diff);
	}

// Ensure angle stays within valid range
image_angle = (image_angle + 360) mod 360;
