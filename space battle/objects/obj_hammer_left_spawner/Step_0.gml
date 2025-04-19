/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_clock)) {
    // Read the clock's time
    var total_time = (obj_clock.minutes * 60) + obj_clock.seconds;
	
	if (total_time == spawn_time && spawn1 < 1) {
		
        // Spawn your object
        var hammer_instance = instance_create_layer(x, y, "Instances", obj_hammer);

        // Set the drone's direction (e.g., 90 degrees)
        if (hammer_instance != noone) {
            hammer_instance.image_angle = 0; // Replace 0 with your desired angle
        }
		spawn1 += 1;
	}
}