/// @description Insert description here
// You can write your code in this editor

alarm[0] = regen_lag;

shield_value -= 3;

if (shield_value <= 0) {
	instance_destroy();
	room_goto(menu);
}