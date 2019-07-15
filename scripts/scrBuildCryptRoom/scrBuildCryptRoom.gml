/// @function scrBuildCryptRoom(x, y, design)
/// @description Sets a given tile index
/// @param {real} x The x cell of the room in the room grid
/// @param {real} y The y cell of the room in the  room grid
/// @param {array} design The design to create the room with

var gridX = argument0;
var gridY = argument1;
var design = argument2;

var tileX = gridX * 3;
var tileY = gridY * 3;

global.cryptGrid[# gridX, gridY] = design;

scrSetTile(tileX,	tileY,		spaces.topleftcorner);
scrSetTile(tileX+1,	tileY,		design[1]);
scrSetTile(tileX+2,	tileY,		spaces.toprightcorner);
scrSetTile(tileX,	tileY+1,	design[4]);
scrSetTile(tileX+1,	tileY+1,	design[0]);
scrSetTile(tileX+2,	tileY+1,	design[2]);
scrSetTile(tileX,	tileY+2,	spaces.bottomleftcorner);
scrSetTile(tileX+1,	tileY+2,	design[3]);
scrSetTile(tileX+2,	tileY+2,	spaces.bottomrightcorner);

global.rooms_created++;