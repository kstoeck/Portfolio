/// @description Insert description here
// You can write your code in this editor
player = instance_find(obj_player, 0);

/// -- spawn a 3×3 grid of chunks centred on (0,0) --------------------------
for (var gy = -1; gy <= 1; ++gy)
for (var gx = -1; gx <= 1; ++gx)
{
    var b          = instance_create_layer(
                        gx * global.CHUNK,
                        gy * global.CHUNK,
                        "Instances",
                        obj_cell);
    b.grid_x       = gx;   // logical grid coordinate
    b.grid_y       = gy;
}

/// -- camera starts with player centred -------------------------------------
var cam  = view_camera[0];
camera_set_view_size(cam, global.VIEW_W, global.VIEW_H);
camera_set_view_pos (cam,
    player.x - global.VIEW_W * 0.5,
    player.y - global.VIEW_H * 0.5);