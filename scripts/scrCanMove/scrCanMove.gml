/// @function scrMove(x, y)
/// @description Move the player, if they can
/// @param {real} x The new x-coordinate
/// @param {real} y The new y-coordinate

var _xx = argument0;
var _yy = argument1;

if(_xx < 0 || _xx >= room_width || _yy < 0 || _yy >= room_height)
	{return false;}

var i = scrGetTile(floor(_xx/tile_size),floor(_yy/tile_size));

if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
	{return true;}
else
	{return false;}