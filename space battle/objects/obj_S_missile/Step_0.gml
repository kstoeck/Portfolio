/// @description Insert description here
// You can write your code in this editor
var distance_this_step = speed;
speed = clamp(speed, 0, 12);
travelled += distance_this_step;

if (travelled >= range) {
    instance_destroy();
}

var angle = point_direction(x, y, obj_player.x, obj_player.y);
var distance_to_target = distance_to_object(obj_player);

motion_add(image_angle, 0.2);

var turn_speed = 1;
var angle_diff = angle_difference(image_angle, angle - 180);

if (abs(angle_diff) <= turn_speed - 1) {
    image_angle = angle - 180;
	} 
else {
	image_angle += turn_speed * sign(angle_diff);
	}

image_angle = (image_angle + 360) mod 360;