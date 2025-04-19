/// @description Insert description here
// You can write your code in this editor
if (global.is_paused) {
    // Get the camera position and size
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    // Draw a semi-transparent overlay
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, false);
    draw_set_alpha(1);

	draw_set_font(fnt_large);

    // Draw "Game Paused" text in the center of the viewport
    var text_x = cam_x + cam_w / 2;
    var text_y = cam_y + cam_h / 2;
    draw_set_color(c_white);
    draw_text(text_x - string_width("Game Paused") / 2, text_y, "Game Paused");

	draw_set_font(-1);

}
