/// @description Insert description here
// You can write your code in this editor
move_wrap(true, true, 10);

speed = clamp(speed, 0, 4);

// Check if the target exists
if (instance_exists(obj_scout)) {
    // Calculate target angle and distance only if the target exists
    target_angle = point_direction(x, y, obj_scout.x, obj_scout.y);
    distance_to_target = distance_to_object(obj_scout);

    // Movement logic
    if (distance_to_target <= max_distance_threshold && distance_to_target >= min_distance_threshold) {
        is_moving = true;
        is_turning = true;
    } else if (distance_to_target <= min_distance_threshold) {
        is_moving = false;
    } else if (distance_to_target >= max_distance_threshold) {
        is_moving = false;
        is_turning = false;
    }

    // Movement behavior
    if (is_moving) {
        image_speed = 1;
        friction = 0;
        motion_add(image_angle, 0.01);
    } else {
        image_speed = 0;
        image_index = 0;
        friction = 0.1;
    }

    // Turning logic
    if (is_turning) {
        var turn_speed = 0.5;
        var angle_diff = angle_difference(image_angle, target_angle - 180);

        image_angle += clamp(angle_diff, -turn_speed, turn_speed); // Rotate smoothly within turn_speed
		image_angle = (image_angle + 360) mod 360; // Normalize angle
    }

    // Missile firing conditions
    if (distance_to_target <= shoot_threshold) {
        var angle_diff = angle_difference(image_angle, target_angle);
        if (abs(angle_diff) <= 2 && !alarm[0] && loaded) {
            var _missile_x = x + lengthdir_x(40, image_angle + 90);
            var _missile_y = y + lengthdir_y(40, image_angle + 90);
        
            var missile = instance_create_layer(_missile_x, _missile_y, "Instances", obj_missile);
            missile.image_angle = image_angle; // Match missile direction with drone's facing angle
        
            alarm[0] = 300; // Start alarm for firing
            loaded = false;
        }
    }
} else {
    // If the target doesn't exist, stop moving and turning
    is_moving = false;
    is_turning = false;
}