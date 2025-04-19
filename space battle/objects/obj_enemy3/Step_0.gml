/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (!loading && !loaded) {
	if (dist > range) {
		direction = angle;
		speed = 4;
		image_angle = angle;
	}
	else {
		direction = image_angle;
		speed = 0;
		var charging = instance_create_layer(x, y, "Instances", obj_charging)
		charging.image_angle = image_angle;
		loading = true;
		alarm[2] = charge_time;
	}
}

else if (loading && !loaded) {
	direction = image_angle;
	speed = 0;
}

else if (!loading && loaded) {
	if (!alarm[3]) {
		alarm[3] = 2 * room_speed;
	}
}

if (alarm[3]) {
	direction = image_angle;
	speed = 30;
}
	
