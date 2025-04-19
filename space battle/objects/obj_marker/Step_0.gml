/// @description Insert description here
// You can write your code in this editor
dist = distance_to_object(obj_player);

if (dist <= obj_player.visual) {
	instance_destroy();
}