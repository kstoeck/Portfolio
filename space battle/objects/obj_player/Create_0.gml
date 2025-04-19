/// @description Insert description here
// You can write your code in this editor
selected_ship = 1;

if (selected_ship == 1) {
	ship = instance_create_layer(x, y, "Instances", obj_ship1);
}
else if (selected_ship == 2) {
	ship = instance_create_layer(x, y, "Instances", obj_ship2);
}
visual = ship.visual;
radar_time = ship.radar_time;
ping = false;
alarm[0] = radar_time * room_speed;
ex = 0;