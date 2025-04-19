/// @description Insert description here
// You can write your code in this editor

var target_angle = point_direction(x, y, obj_scout.x, obj_scout.y);
var distance_to_target = distance_to_object(obj_scout);

if (instance_exists(obj_scout)) {
    // Movement logic
    if (distance_to_target <= max_distance_threshold) {
        is_turning = true;
    } else if (distance_to_target > max_distance_threshold) {
        is_turning = false;
    }

    // Turning logic
    if (is_turning) {
		var turn_speed = 0.5;
		var angle_diff = angle_difference(image_angle, target_angle + 90);

		image_angle += clamp(angle_diff, -turn_speed, turn_speed); // Rotate smoothly within turn_speed
		image_angle = (image_angle + 360) mod 360; // Normalize angle

    }

    // Missile firing conditions
    if (distance_to_target <= shoot_threshold) {
        var angle_diff = angle_difference(image_angle, target_angle - 90);
        if (abs(angle_diff) <= 10 && !alarm[0] && loaded) {
        
            var gun = instance_create_layer(x, y, "Instances", obj_enemy_bullet_bt);
            gun.image_angle = image_angle - 90; // Match missile direction with drone's facing angle
        
            alarm[0] = 30; // Start alarm for firing
            loaded = false;
        }
    }
} else {
    // If the target doesn't exist, stop moving and turning
    is_turning = false;
}