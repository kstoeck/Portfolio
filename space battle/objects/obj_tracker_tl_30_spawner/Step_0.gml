/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_clock)) {
	var total_time = (obj_clock.minutes * 60) + obj_clock.seconds;
	if (total_time >= start_spawn_time) {
		if (total_time == last_spawn_time + spawn_interval && !alarm[0]) 
        {
            // Spawn your object
            var tracker_instance = instance_create_layer(x, y, "Instances", obj_tracker);

            // Set the drone's direction (e.g., 90 degrees)
            if (tracker_instance != noone) {
                tracker_instance.image_angle = 315; // Replace 0 with your desired angle
            }

            // Update the last_spawn_time so we don't spawn multiple times this second
            last_spawn_time = total_time;
			alarm[0] = 60;
        }
    }
}