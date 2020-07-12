/// @function scrBuildCryptRoom(x, y, design)
/// @description Sets a given tile index
/// @param {real} x The x cell of the room in the room grid
/// @param {real} y The y cell of the room in the  room grid
/// @param {array} design The design to create the room with
/// @param {real} type if the room is a special type

var _gridX = argument[0];
var _gridY = argument[1];
var _design = argument[2];
var _roomtype = 0;
if(argument_count >= 4)
	{_roomtype = argument[3];}

var _tileX = _gridX * 3;
var _tileY = _gridY * 3;

global.cryptGrid[# _gridX, _gridY] = _design;

if(_roomtype == 1)
	{
	scrSetTile(_tileX,		_tileY,		spaces.topleftred);
	scrSetTile(_tileX+2,	_tileY,		spaces.toprightred);
	scrSetTile(_tileX,		_tileY+2,	spaces.bottomleftred);
	scrSetTile(_tileX+2,	_tileY+2,	spaces.bottomrightred);
	scrSetTile(_tileX+1,	_tileY+1,	spaces.groundred);
	}
else if(_roomtype == 2)	{
	scrSetTile(_tileX,		_tileY,		spaces.topleftgreen);
	scrSetTile(_tileX+2,	_tileY,		spaces.toprightgreen);
	scrSetTile(_tileX,		_tileY+2,	spaces.bottomleftgreen);
	scrSetTile(_tileX+2,	_tileY+2,	spaces.bottomrightgreen);
	scrSetTile(_tileX+1,	_tileY+1,	spaces.groundgreen);
	}
else if(_roomtype == 3)	{
	scrSetTile(_tileX,		_tileY,		spaces.topleftblue);
	scrSetTile(_tileX+2,	_tileY,		spaces.toprightblue);
	scrSetTile(_tileX,		_tileY+2,	spaces.bottomleftblue);
	scrSetTile(_tileX+2,	_tileY+2,	spaces.bottomrightblue);
	scrSetTile(_tileX+1,	_tileY+1,	spaces.groundblue);
	}
else
	{
	scrSetTile(_tileX,		_tileY,		spaces.topleftnormal);
	scrSetTile(_tileX+2,	_tileY,		spaces.toprightnormal);
	scrSetTile(_tileX,		_tileY+2,	spaces.bottomleftnormal);
	scrSetTile(_tileX+2,	_tileY+2,	spaces.bottomrightnormal);
	scrSetTile(_tileX+1,	_tileY+1,	spaces.groundnormal);
	}

for(var _i = 0; _i < 5; _i++)
	{
	if(_design[_i] >= 100)
		{
		var _x = 0;
		var _y = 0;
		
		if(_i == 0)
			{
			_x = (_tileX + 1) * tile_size;
			_y = (_tileY + 1) * tile_size;
			}
		else if(_i == 1)
			{
			_x = (_tileX + 1) * tile_size;
			_y = _tileY * tile_size;
			}
		else if(_i == 2)
			{
			_x = (_tileX + 2) * tile_size;
			_y = (_tileY + 1) * tile_size;
			}
		else if(_i == 3)
			{
			_x = (_tileX + 1) * tile_size;
			_y = (_tileY + 2) * tile_size;
			}
		else if(_i == 4)
			{
			_x = _tileX * tile_size;
			_y = (_tileY + 1) * tile_size;
			}
		
		var _o = instance_create_layer(_x, _y, layer_get_id("layerObjects"), objTileObject);
		if(_design[_i] == spaces.event)
			{_o.sprite_index = sprTileEvent; _o.image_speed = 0;}
		if(_design[_i] == spaces.potion)
			{_o.sprite_index = sprTilePotion; _o.image_speed = 0;}
		if(_design[_i] == spaces.chest)
			{_o.sprite_index = sprTileChest; _o.image_speed = 0;}
		
		_design[_i] = spaces.groundnormal;
		}
	}

scrSetTile(_tileX+1,	_tileY,		_design[1]);
scrSetTile(_tileX,		_tileY+1,	_design[4]);
scrSetTile(_tileX+1,	_tileY+1,	_design[0]);
scrSetTile(_tileX+2,	_tileY+1,	_design[2]);
scrSetTile(_tileX+1,	_tileY+2,	_design[3]);

global.rooms_created++;