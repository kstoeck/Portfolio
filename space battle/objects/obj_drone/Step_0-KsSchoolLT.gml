/// @description Insert description here
// You can write your code in this editor
move_wrap(true, true, 10);

speed = clamp(speed, 0, 4);

var target_angle = point_direction(x, y, obj_basic_ship.x, obj_basic_ship.y);

if (distance_to_object(obj_basic_ship) <= max_distance_threshold and distance_to_object(obj_basic_ship) >= min_distance_threshold) {
    is_moving = true; // Activate movement
	is_turning = true;
}

if (distance_to_object(obj_basic_ship) <= min_distance_threshold){
	is_moving = false;
}

if (distance_to_object(obj_basic_ship) >= max_distance_threshold){
	is_moving = false;
	is_turning = false
}

// Handle movement if active
if (is_moving) {
    image_speed = 1
	friction = 0
	motion_add(image_angle, 0.01)
}
else{
	image_speed = 0
	image_index = 0
	friction = 0.1
}

if (is_turning) {
	var turn_speed = 1; // Degrees to turn per step
    if (abs(angle_difference(image_angle, target_angle)) <= turn_speed + 14) {
        image_angle = target_angle; // Snap to target if close enough
    } else if (angle_difference(image_angle, target_angle) > 0) {
        image_angle += turn_speed; // Rotate clockwise
    } else {
        image_angle -= turn_speed; // Rotate counter-clockwise
    }
	image_angle = image_angle mod 360;
}