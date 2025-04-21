/// @description Insert description here
// You can write your code in this editor

var shift_x = 0;
var shift_y = 0;

if (x <= 5000) shift_x = 25000 - x;
else if (x >= 45000) shift_x = 25000 - x;

if (y <= 5000) shift_y = 25000 - y;
else if (y >= 45000) shift_y = 25000 - y;

if (shift_x == 0 && shift_y == 0) exit;

var _sx = shift_x;
var _sy = shift_y;

obj_parent_ship.x += _sx;
obj_parent_ship.y += _sy;

obj_parent_enemy.x += _sx;
obj_parent_enemy.y += _sx;

