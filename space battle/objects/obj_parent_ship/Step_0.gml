/// @description Insert description here
// You can write your code in this editor
speed = clamp(speed, 0, top_speed);

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (keyboard_check(ord("W"))) {
    motion_add(image_angle, accel);
}

