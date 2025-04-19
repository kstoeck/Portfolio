/// @description Insert description here
// You can write your code in this editor
var progress = (ring_radius - obj_player.visual) / (max_radius - obj_player.visual);
draw_set_alpha(1 - progress);

draw_set_color(c_white);

for (var i = 0; i < line_thickness; i++) {
    draw_circle(obj_player.x, obj_player.y, ring_radius - i, true);
}

draw_set_alpha(1.0);