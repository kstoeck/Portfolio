/// @description Enemy ship movement and targeting behavior
// Wrap around screen edges if necessary
move_wrap(true, true, 10);

// Check if the target (obj_basic_ship) exists
if (instance_exists(obj_scout)) {
    // Calculate the angle and distance to the target
    target_angle = point_direction(x, y, obj_scout.x, obj_scout.y);
    distance_to_target = distance_to_object(obj_scout);

    // Behavior when far from the target
    if (distance_to_target > charge_threshold && abs(image_angle - target_angle) >= 10) {
        // Movement settings for distant state
        speed = clamp(speed, 0, 12);
        image_speed = 1;
        friction = 0.1;

        // Set animation frames for state (frames 1 to 6)
        if (image_index < 0 || image_index > 5) image_index = 0; // Reset to frame 1 if out of bounds

        // Gradually accelerate forward
        motion_add(image_angle, 0);
        
        // Turning logic
        var turn_speed = 1;
        var angle_diff = angle_difference(image_angle, target_angle - 180);
        image_angle += clamp(angle_diff, -turn_speed, turn_speed);
        image_angle = (image_angle + 360) mod 360;

    } else { // Behavior when close to the target
        // Movement settings for close state
        speed = clamp(speed, 0, 12);
        image_speed = 1;
        friction = 0.005;

        // Set animation frames for state (frames 7 to 12)
        if (image_index < 6 || image_index > 11) image_index = 6; // Reset to frame 7 if out of bounds

        // Gradually accelerate forward
        motion_add(image_angle, 0.2);

        // Turning logic
        var turn_speed = 0.5;
        var angle_diff = angle_difference(image_angle, target_angle - 180);
        image_angle += clamp(angle_diff, -turn_speed, turn_speed);
        image_angle = (image_angle + 360) mod 360;
    }

} else { 
    // Behavior when the target does not exist
    image_speed = 0;
    friction = 0.1;
}