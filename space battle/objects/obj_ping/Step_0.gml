/// @description Insert description here
// You can write your code in this editor
ring_radius += speed;

if (ring_radius > max_radius) {
    instance_destroy();
}

with (obj_parent_enemy) {
    var d = point_distance(other.x, other.y, x, y);
    if (d > other.ring_radius && d <= other.max_radius) {
        if (check && visible == false) {
			instance_create_layer(x, y, "Instances", obj_marker);
			check = false;
			alarm[1] = 3 * room_speed;
		}
    }
}

