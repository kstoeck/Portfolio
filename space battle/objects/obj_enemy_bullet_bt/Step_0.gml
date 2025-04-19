/// @description Insert description here
// You can write your code in this editor

var distance_this_step = speed;

traveled_distance += distance_this_step;

if (traveled_distance >= max_distance) {
    instance_destroy();
}