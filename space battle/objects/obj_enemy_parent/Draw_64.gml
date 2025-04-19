/// @description Insert description here
// You can write your code in this editor
// obj_enemy_parent: Draw GUI
var dist_to_player = point_distance(obj_scout.x, obj_scout.y, x, y);

if (dist_to_player > obj_fog_of_war.fog_radius) {
    draw_set_color(c_red);
    draw_set_alpha(1);

    // Convert world position to screen position
    var sx = camera_get_view_x(view_camera[0]);
    var sy = camera_get_view_y(view_camera[0]);

    var ex = x - sx;
    var ey = y - sy;

    draw_circle(ex, ey, 100, false); // Small red dot
}