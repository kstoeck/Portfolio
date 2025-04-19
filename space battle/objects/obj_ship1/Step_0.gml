/// @description Insert description here
// You can write your code in this editor
event_inherited();

if keyboard_check(vk_space) {
	if (loaded) {
		instance_create_layer(x, y, "Instances", obj_ship1_basic);
		alarm[0] = reload * room_speed;
		loaded = false;
	}
}
