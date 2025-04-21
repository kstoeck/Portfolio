/// @description Insert description here
// You can write your code in this editor
var cam = view_camera[0];

/// -------------------------------------------------------------------------
/// 1.  Push the camera so it *smoothly* follows the player
///     (basic linear interpolation – tweak 0.1 → 0.2 for snappier feel)
/// -------------------------------------------------------------------------
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);
var tx  = player.x - global.VIEW_W  * 0.5;
var ty  = player.y - global.VIEW_H * 0.5;
camera_set_view_pos(cam,
    lerp(cx, tx, 0.1),
    lerp(cy, ty, 0.1));

/// -------------------------------------------------------------------------
/// 2.  Work out which *chunk* the player is now in
/// -------------------------------------------------------------------------
var gX = floor(player.x / global.CHUNK);
var gY = floor(player.y / global.CHUNK);
/// -------------------------------------------------------------------------
/// 3.  Re‑position chunks that drifted too far away
///     – they jump three chunks across (full width * 3) so they appear
///       on the opposite side of the 3×3 window.
///     – because they move while outside the camera view, the jump
///       is never seen by the player.
/// -------------------------------------------------------------------------
with (obj_cell)
{
    var dx = grid_x - gX;   // distance (in chunk units)
    var dy = grid_y - gY;
    if (dx < -1) { grid_x += 3; x += 3 * global.CHUNK; }
    if (dx >  1) { grid_x -= 3; x -= 3 * global.CHUNK; }
    if (dy < -1) { grid_y += 3; y += 3 * global.CHUNK; }
    if (dy >  1) { grid_y -= 3; y -= 3 * global.CHUNK; }
}