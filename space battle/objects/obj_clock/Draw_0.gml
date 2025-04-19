/// @description Insert description here
// You can write your code in this editor
var viewport_x = camera_get_view_x(view_camera[0]);
var viewport_y = camera_get_view_y(view_camera[0]);
draw_set_color(c_white);

if ((minutes * 60) + seconds >= 120) {
    draw_text(viewport_x + 10, viewport_y + 10, "Final Encounter");
	clock_running = false;
} else {
    var minutes_display = (minutes < 10) ? "0" + string(minutes) : string(minutes);
    var seconds_display = (seconds < 10) ? "0" + string(seconds) : string(seconds);

    var time_display = minutes_display + ":" + seconds_display;

	draw_set_font(fnt_large);
    draw_text(viewport_x + 10, viewport_y + 10, time_display);
	draw_text(viewport_x + 10, viewport_y + 100, ex);
}