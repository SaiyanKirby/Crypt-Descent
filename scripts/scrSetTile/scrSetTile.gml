/// @function scrSetTile(x, y, index)
/// @description Sets a given tile index
/// @param {real} x The x cell of the tile in the tilemap
/// @param {real} y The y cell of the tile in the tilemap
/// @param {real} index The index to set the tile to

var data = tile_get_index(tilemap);
data = tile_set_index(data,argument2);
tilemap_set(tilemap,data,argument0,argument1);