/// @description Insert description here
// You can write your code in this editor
if (increase) {
	number += num_increase;
	increase = false;	
}

if (spawn) {
	i = 1;
	while (i <= number) {
		px = obj_player.x;
		py = obj_player.y;
		spawn_distance = random_range(2500, 3000);
		spawn_angle = random(360);
		spawn_x = px + lengthdir_x(spawn_distance, spawn_angle);
		spawn_y = py + lengthdir_y(spawn_distance, spawn_angle);
	
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy2);
		i += 1;
	}
	spawn = false;
	alarm[0] = time_increase * room_speed;
	alarm[1] = time_increase * room_speed;
}