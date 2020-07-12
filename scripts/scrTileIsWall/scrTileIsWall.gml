/// @function scrTileIsWall(index)
/// @description Returns if a tile is a wall
/// @param {real} index The index of the tile

//normal
if(argument0 == 16 || argument0 == 17 || argument0 == 18)			{return true};
if(argument0 == 24 || argument0 == 26)								{return true};
if(argument0 == 32 || argument0 == 33 || argument0 == 34)			{return true};

//red
if(argument0 == 19 || argument0 == 20 || argument0 == 21)			{return true};
if(argument0 == 27 || argument0 == 29)								{return true};
if(argument0 == 35 || argument0 == 36 || argument0 == 37)			{return true};

//green
if(argument0 == 40 || argument0 == 41 || argument0 == 42)			{return true};
if(argument0 == 48 || argument0 == 50)								{return true};
if(argument0 == 56 || argument0 == 57 || argument0 == 58)			{return true};

//blue
if(argument0 == 43 || argument0 == 44 || argument0 == 45)			{return true};
if(argument0 == 51 || argument0 == 53)								{return true};
if(argument0 == 59 || argument0 == 60 || argument0 == 61)			{return true};