/// @description Improved tracking and firing logic
/// @description Correct target tracking and firing
move_wrap(true, true, 10);

speed = clamp(speed, 0, 8);

// Check if the target exists
if (instance_exists(obj_scout)) {
    // Calculate target angle and distance only if the target exists
    var target_angle = point_direction(x, y, obj_scout.x, obj_scout.y);
    var distance_to_target = distance_to_object(obj_scout);
	var angle_diff = angle_difference(image_angle, target_angle - 180);

    // Movement logic
    if (abs(angle_diff) <= 45) {
        is_moving = true;
        is_turning = true;
    } else if (distance_to_target >= max_distance_threshold) {
        is_moving = false;
        is_turning = false;
    }

    // Movement behavior
    if (is_moving) {
			image_speed = 1;
			friction = 0.1;
			motion_add(image_angle, 0.2);
		}

    // Turning logic
    if (is_turning) {
        var turn_speed = 0.8;
        

        image_angle += clamp(angle_diff, -turn_speed, turn_speed); // Rotate smoothly within turn_speed
		image_angle = (image_angle + 360) mod 360; // Normalize angle
    }

    // Missile firing conditions
    if (distance_to_target <= shoot_threshold) {
        var angle_diff = angle_difference(image_angle, target_angle);
        if (abs(angle_diff) <= 1 && !alarm[0] && loaded) {
            var _gun_x = x + lengthdir_x(0, image_angle + 90);
            var _gun_y = y + lengthdir_y(0, image_angle + 90);
        
            var gun = instance_create_layer(_gun_x, _gun_y, "Instances", obj_enemy_bullet_t);
            gun.image_angle = image_angle; // Match missile direction with drone's facing angle
        
            alarm[0] = 30; // Start alarm for firing
            loaded = false;
        }
    }
} else {
    // If the target doesn't exist, stop moving and turning
    is_moving = false;
    is_turning = false;
}