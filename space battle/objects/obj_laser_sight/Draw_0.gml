/// @description Insert description here
// You can write your code in this editor
if (instance_exists(my_enemy) && instance_exists(obj_player)) {
	var dist = point_distance(my_enemy.x, my_enemy.y, obj_player.x, obj_player.y);

	if (!instance_exists(my_enemy)) {
	    instance_destroy();
		return;
	}

	if (!my_enemy.loaded || dist >= my_enemy.range) {
	    instance_destroy();
		return;
	}
	draw_set_color(c_red);
	draw_line_width(my_enemy.x, my_enemy.y, obj_player.x, obj_player.y, 5);
}
