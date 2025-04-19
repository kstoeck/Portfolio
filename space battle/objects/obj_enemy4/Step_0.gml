/// @description Insert description here
// You can write your code in this editor
event_inherited();
direction = angle;
image_angle = angle;
if (dist < range) {
	if (!alarm[2] && loaded) {
		alarm[2] = 3 * room_speed;
	}
	if (count == 3) {
		var shot = instance_create_layer(x, y, "Instances", obj_sniper_bullet);
		shot.image_angle = image_angle;
		shot.direction = image_angle;
		loaded = false;
		alarm[3] = reload;
		count = 0;
	}
}
else {
	count = 0;
}
if (dist < range - 500) {
	speed = 0;
}
else {
	speed = 2;
}

if (loaded && dist < range) {
    if (!instance_exists(laser_sight)) {
        laser_sight = instance_create_layer(x, y, "Instances", obj_laser_sight);
        laser_sight.my_enemy = id;
    }
}
else {
    if (instance_exists(laser_sight)) {
        with (laser_sight) instance_destroy();
    }
}