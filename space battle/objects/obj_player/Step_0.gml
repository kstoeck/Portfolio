/// @description Insert description here
// You can write your code in this editor
visual = ship.visual;

x = ship.x;
y = ship.y;

if (ping) {
	instance_create_layer(x, y, "Instances", obj_ping);
	ping = false;
	alarm[0] = radar_time * room_speed;
}

