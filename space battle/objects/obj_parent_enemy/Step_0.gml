/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
	target = obj_player
    dist = distance_to_object(target);
	angle = point_direction(x, y, target.x, target.y);

	if (sight_check) {
	    if (dist < target.visual) {
			visible = true;
	        sprite_index = default_index;
	    }
		else {
			visible = false;
		}
		sight_check = false;
		alarm[0] = 15;
	}
	
	if (dist > 4000) {
		px = target.x;
		py = target.y;
		spawn_distance = random_range(2500, 3000);
		spawn_angle = random(360);
		x = px + lengthdir_x(spawn_distance, spawn_angle);
		y = py + lengthdir_y(spawn_distance, spawn_angle);
	}
}