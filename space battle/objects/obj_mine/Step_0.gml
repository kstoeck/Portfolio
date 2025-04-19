/// @description Insert description here
// You can write your code in this editor

move_wrap(true, true, 10);

speed = clamp(speed, 0, 3);

// Check if the target exists
if (instance_exists(obj_scout)) {
    // Calculate target angle and distance only if the target exists
    target_angle = point_direction(x, y, obj_scout.x, obj_scout.y);
    distance_to_target = distance_to_object(obj_scout);

    // Movement logic
    if (distance_to_target <= min_distance_threshold) {
        is_moving = true;
    } else {
        is_moving = false;
    }

    // Movement behavior
    if (is_moving) {
        friction = 0;
        motion_add(target_angle, 0.15);
    } else {
        friction = 0.01;
    }

} else {
    // If the target doesn't exist, stop moving and turning
    is_moving = false;
}