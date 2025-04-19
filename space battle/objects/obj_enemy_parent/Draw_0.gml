/// @description Insert description here
// You can write your code in this editor
var dist_to_player = point_distance(obj_scout.x, obj_scout.y, x, y);

if (dist_to_player <= obj_fog_of_war.fog_radius) {
    // Enemy is inside the fog radius → Draw normally
    draw_self();
}