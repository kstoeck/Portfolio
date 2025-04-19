/// @description Insert description here
// You can write your code in this editor
// 1) If the surface doesn't exist (or was lost), recreate it
if (!surface_exists(fog_surface)) {
    fog_surface = surface_create(view_wport[0], view_hport[0]);
}

// 2) Set this surface as the target for all subsequent draw operations
surface_set_target(fog_surface);

// 3) Clear the surface with black (full opacity)
draw_clear_alpha(c_black, 1);

// 4) Calculate the player's position relative to the view
//    (assuming you're using view_camera[0] or the "view_xview" approach).
//    With GMS2.3+ you can also use "camera_get_view_x(camera)" etc.
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
var plr_x  = obj_scout.x - view_x; 
var plr_y  = obj_scout.y - view_y;

// 5) Subtract a circular region around the player
draw_set_color(c_white);

// Switch to subtract blend
gpu_set_blendmode(bm_subtract);

draw_circle(plr_x, plr_y, fog_radius, false);

// Reset blend back to normal
gpu_set_blendmode(bm_normal);    // Reset blend mode

// 6) Done drawing to the fog surface, switch back to the screen
surface_reset_target();

// 7) Draw the fog surface on top of the room. 
//    Position it at (view_x, view_y) so it lines up correctly.
draw_surface(fog_surface, view_x, view_y);

