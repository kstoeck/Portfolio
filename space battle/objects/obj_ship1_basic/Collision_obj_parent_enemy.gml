/// @description Insert description here
// You can write your code in this editor
other.hp -= dmg;
instance_destroy();
if (other.hp <= 0) {
	instance_destroy(other);
	obj_player.ex += other.ex;
	obj_clock.ex += other.ex;
}