/// @description Insert description here
// You can write your code in this editor
// First, make sure our clock exists (or find it if not in a global variable)
if (instance_exists(obj_clock)) {
    // Read the clock's time
    var total_time = (obj_clock.minutes * 60) + obj_clock.seconds;

    // Check if total_time is a multiple of spawn_interval 
    // AND we haven't spawned this second before
    if (total_time > 0 
        && total_time mod spawn_interval == 0 
        && last_spawn_time != total_time) 
    {
        // Spawn your object
        instance_create_layer(0, random_range(475, 2690), "Instances", obj_ast_barrier);

        // Update the last_spawn_time so we don't spawn multiple times this second
        last_spawn_time = total_time;
    }
}