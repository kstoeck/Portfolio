/// @description Insert description here
// You can write your code in this editor
if (initial) {
	var drone_instance = instance_create_layer(x, y, "Instances", obj_drone);

    // Set the drone's direction (e.g., 90 degrees)
    if (drone_instance != noone) {
        drone_instance.image_angle = 0; // Replace 0 with your desired angle
    }
	initial = false;
}
// First, make sure our clock exists (or find it if not in a global variable)
if (instance_exists(obj_clock)) {
    // Read the clock's time
    var total_time = (obj_clock.minutes * 60) + obj_clock.seconds;

    // Ensure spawning only starts at or after the start time
    if (total_time >= start_spawn_time) {
        // Check if total_time is a multiple of spawn_interval 
        // AND we haven't spawned this second before
        if (total_time > 0 
            && total_time mod spawn_interval == 0 
            && last_spawn_time != total_time) 
        {
            // Spawn your object
            var drone_instance = instance_create_layer(x, y, "Instances", obj_drone);

            // Set the drone's direction (e.g., 90 degrees)
            if (drone_instance != noone) {
                drone_instance.image_angle = 0; // Replace 0 with your desired angle
            }

            // Update the last_spawn_time so we don't spawn multiple times this second
            last_spawn_time = total_time;
        }
	}
}