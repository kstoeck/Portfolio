/// @description Insert description here
// You can write your code in this editor

speed = clamp(speed, 0, 12)

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (keyboard_check(ord("W"))) {
    image_speed = 1;
    friction = 0;
    motion_add(image_angle, speed_value);
} else {
    friction = 0.1;
	image_index = 0;
	image_speed = 0;
}

if (mouse_check_button(mb_right) && !alarm[2]) {
    // Calculate the position for the nuke
    nuke_x = x + lengthdir_x(0, image_angle + 90);
    nuke_y = y + lengthdir_y(0, image_angle + 90);

    // Create the nuke instance
    var nuke_instance = instance_create_layer(x, y, "Instances", obj_nuke);

    // Set the nuke's direction to match the scout's
    if (nuke_instance != noone) {
        nuke_instance.image_angle = image_angle;
    }

    // Set the alarm
    alarm[2] = 600;
}

if (mouse_check_button(mb_left) && !alarm[1]) {
    var _bullet_x, _bullet_y;

    // Check if the bullet number is even or odd
    if (_bullet_number mod 2 == 0) {
        // Offset to the right of the ship's direction
        _bullet_x = x + lengthdir_x(14, image_angle + 90);
        _bullet_y = y + lengthdir_y(14, image_angle + 90);
    } else {
        // Offset to the left of the ship's direction
        _bullet_x = x + lengthdir_x(14, image_angle - 90);
        _bullet_y = y + lengthdir_y(14, image_angle - 90);
    }

    _bullet_number += 1;

    // Create the bullet at the calculated position
    instance_create_layer(_bullet_x, _bullet_y, "Instances", obj_bullet);

    alarm[1] = reload; // Set the reload time
}



if (place_meeting(x, y, obj_map_barrier)) {
	// Collision Event (obj_basic_ship: Collision with obj_map_barrier)
	friction = 0;

	// Get bounding box of the barrier you collided with:
	var bb_left   = obj_map_barrier.bbox_left;
	var bb_right  = obj_map_barrier.bbox_right;
	var bb_top    = obj_map_barrier.bbox_top;
	var bb_bottom = obj_map_barrier.bbox_bottom;

	// Figure out which side you're closest to
	var dist_left   = abs(x - bb_left);
	var dist_right  = abs(x - bb_right);
	var dist_top    = abs(y - bb_top);
	var dist_bottom = abs(y - bb_bottom);

	var min_dist = min(dist_left, dist_right, dist_top, dist_bottom);

	// If the left side is the closest
	if (min_dist == dist_left) {
	    // We are near the left edge -> push to the LEFT means x < barrier => we push RIGHT ( direction = 0 )
	    motion_add(0, 1);
	} 
	// If the right side is the closest
	else if (min_dist == dist_right) {
	    // We are near the right edge -> push LEFT ( direction = 180 )
	    motion_add(180, 1);
	}
	// If the top side is the closest
	else if (min_dist == dist_top) {
	    // We are near the top edge -> push DOWN ( direction = 90 )
	    motion_add(270, 1);
	}
	// If the bottom side is the closest
	else if (min_dist == dist_bottom) {
	    // We are near the bottom edge -> push UP ( direction = 270 )
	    motion_add(90, 1);
	}
}

if (shield_value < max_shield && heal && !alarm[0]) {
    if (max_shield - shield_value < regen) {
		shield_value = max_shield;
	} else {
		shield_value += regen;
	}
    heal = false;
    alarm[0] = regen_rate;
}
