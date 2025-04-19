/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape)) {
    global.is_paused = !global.is_paused; // Toggle pause state

    if (global.is_paused) {
        // Deactivate all instances except the pause controller
        instance_deactivate_all(true);
        instance_activate_object(self); // Keep the pause controller active
    } else {
        // Reactivate all instances
        instance_activate_all();
    }
}

