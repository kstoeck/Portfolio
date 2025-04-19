/// @description Insert description here
// You can write your code in this editor
event_inherited();
direction = angle;
image_angle = angle;
if (dist > 750) {
	speed = 2;
}
else {
	speed = 0;
}
	
image_angle = angle;

if (dist <= range) {
	if (loaded) {
		missile = instance_create_layer(x, y, "Instances", obj_S_missile)
		missile.image_angle = image_angle;
		loaded = false;
		alarm[2] = reload;
	}
}