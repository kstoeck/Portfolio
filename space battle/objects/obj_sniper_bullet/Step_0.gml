/// @description Insert description here
// You can write your code in this editor
var distance_this_step = speed;
speed = 50;
travelled += distance_this_step;

if (travelled >= range) {
    instance_destroy();
}