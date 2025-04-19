/// @description Insert description here
// You can write your code in this editor

move_wrap(true, true, 10);

speed = clamp(speed, 0, 8)

if (keyboard_check(ord("W"))) {
    image_speed = 1;
    friction = 0;
    motion_add(image_angle, 0.2);
} else {
    friction = 0.05;
	image_index = 0;
	image_speed = 0;
}

if keyboard_check(ord("D"))
{
    image_angle += 3;
}

if keyboard_check(ord("A"))
{
    image_angle -= 3;
}

if (mouse_check_button_pressed(mb_left)) {
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
    
}