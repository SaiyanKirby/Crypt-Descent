/// @function scrGetCellX(x)
/// @description Returns the grid's x-coordinate from the given worldspace x-coordinate
/// @param {real} x The x position (in worldspace) of the room

var _xx = floor(argument0 / tile_size);
_xx = clamp((_xx - (_xx % 3)) / 3, 0, ds_grid_width(global.cryptGrid)-1);
return _xx