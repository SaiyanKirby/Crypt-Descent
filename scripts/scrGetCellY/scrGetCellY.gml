/// @function scrGetCellY(y)
/// @description Returns the grid's y-coordinate from the given worldspace y-coordinate
/// @param {real} y The y position (in worldspace) of the room

var _yy = floor(argument0 / tile_size);
_yy = clamp((_yy - (_yy % 3)) / 3, 0, ds_grid_width(global.cryptGrid)-1);
return _yy