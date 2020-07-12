function BuildCryptRoom() {
	/// @function scrBuildCryptRoom(x, y, design, type)
	/// @description Creates a specified room in the crypt
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
		SetTile(_tileX,		_tileY,		spaces.topleftred);
		SetTile(_tileX+2,	_tileY,		spaces.toprightred);
		SetTile(_tileX,		_tileY+2,	spaces.bottomleftred);
		SetTile(_tileX+2,	_tileY+2,	spaces.bottomrightred);
		SetTile(_tileX+1,	_tileY+1,	spaces.groundred);
		}
	else if(_roomtype == 2)	{
		SetTile(_tileX,		_tileY,		spaces.topleftgreen);
		SetTile(_tileX+2,	_tileY,		spaces.toprightgreen);
		SetTile(_tileX,		_tileY+2,	spaces.bottomleftgreen);
		SetTile(_tileX+2,	_tileY+2,	spaces.bottomrightgreen);
		SetTile(_tileX+1,	_tileY+1,	spaces.groundgreen);
		}
	else if(_roomtype == 3)	{
		SetTile(_tileX,		_tileY,		spaces.topleftblue);
		SetTile(_tileX+2,	_tileY,		spaces.toprightblue);
		SetTile(_tileX,		_tileY+2,	spaces.bottomleftblue);
		SetTile(_tileX+2,	_tileY+2,	spaces.bottomrightblue);
		SetTile(_tileX+1,	_tileY+1,	spaces.groundblue);
		}
	else
		{
		SetTile(_tileX,		_tileY,		spaces.topleftnormal);
		SetTile(_tileX+2,	_tileY,		spaces.toprightnormal);
		SetTile(_tileX,		_tileY+2,	spaces.bottomleftnormal);
		SetTile(_tileX+2,	_tileY+2,	spaces.bottomrightnormal);
		SetTile(_tileX+1,	_tileY+1,	spaces.groundnormal);
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
	SetTile(_tileX+1,	_tileY,		_design[1]);
	SetTile(_tileX,		_tileY+1,	_design[4]);
	SetTile(_tileX+1,	_tileY+1,	_design[0]);
	SetTile(_tileX+2,	_tileY+1,	_design[2]);
	SetTile(_tileX+1,	_tileY+2,	_design[3]);
	global.rooms_created++;
	}

function CreateRandomCryptRoom() {
	var design = [spaces.groundnormal,
	choose(spaces.groundnormal,spaces.wall),
	choose(spaces.groundnormal,spaces.wall),
	spaces.groundnormal,
	choose(spaces.groundnormal,spaces.wall)];
	repeat(5)
		{
		if(irandom_range(1,5) == 1)
			{
			design[irandom(4)] = choose(spaces.event,
										spaces.potion,
										spaces.chest,);
			}
		}
	//rotate towards previous room
	if(design[1] == spaces.wall)
		{design[1] = spaces.topwallnormal;};
	if(design[2] == spaces.wall)
		{design[2] = spaces.rightwallnormal;};
	if(design[3] == spaces.wall)
		{design[3] = spaces.bottomwallnormal;};
	if(design[4] == spaces.wall)
		{design[4] = spaces.leftwallnormal;};

	return design;
	}

function GetCellX(argument0) {
	/// @function GetCellX(x)
	/// @description Returns the grid's x-coordinate from the given worldspace x-coordinate
	/// @param {real} x The x position (in worldspace) of the room
	var _xx = floor(argument0 / tile_size);
	_xx = clamp((_xx - (_xx % 3)) / 3, 0, ds_grid_width(global.cryptGrid)-1);
	return _xx
	}

function GetCellY(argument0) {
	/// @function GetCellY(y)
	/// @description Returns the grid's y-coordinate from the given worldspace y-coordinate
	/// @param {real} y The y position (in worldspace) of the room
	var _yy = floor(argument0 / tile_size);
	_yy = clamp((_yy - (_yy % 3)) / 3, 0, ds_grid_width(global.cryptGrid)-1);
	return _yy
	}

function GetTile(argument0, argument1) {
	/// @function GetTile(x, y)
	/// @description Returns a tile index
	/// @param {real} x The x cell of the tile in the tilemap
	/// @param {real} y The y cell of the tile in the tilemap
	return tile_get_index(tilemap_get(global.tilemap,argument0,argument1));
	}

function SetTile(argument0, argument1, argument2) {
	/// @function SetTile(x, y, index)
	/// @description Sets a given tile index
	/// @param {real} x The x cell of the tile in the tilemap
	/// @param {real} y The y cell of the tile in the tilemap
	/// @param {real} index The index to set the tile to
	var data = tile_get_index(global.tilemap);
	data = tile_set_index(data,argument2);
	tilemap_set(global.tilemap,data,argument0,argument1);
	}

function RotateCryptRoom(argument0, argument1) {
	/// @function RotateCryptRoom(design, amount)
	/// @description Rotate a given room design
	/// @param {array} design The design of the room to rotate
	/// @param {real} amount Rotate by 90, 180, or 270 degrees clockwise
	var newdesign = 0;
	switch(argument1)
		{
		case 90:
			{
			newdesign = [argument0[0],argument0[4],argument0[1],argument0[2],argument0[3]];
			break;
			}
		case 180:
			{
			newdesign = [argument0[0],argument0[3],argument0[4],argument0[1],argument0[2]];
			break;
			}
		case 270:
			{
			newdesign = [argument0[0],argument0[2],argument0[3],argument0[4],argument0[1]];
			break;
			}
		default:
			{
			newdesign = argument0;
			break;
			}
		}
	//reorient walls
	if(TileIsWall(newdesign[1]))
		{newdesign[1] = spaces.topwallnormal;};
	if(TileIsWall(newdesign[2]))
		{newdesign[2] = spaces.rightwallnormal;};
	if(TileIsWall(newdesign[3]))
		{newdesign[3] = spaces.bottomwallnormal;};
	if(TileIsWall(newdesign[4]))
		{newdesign[4] = spaces.leftwallnormal;};

	return newdesign;
	}

function TileIsCorner(argument0) {
	/// @function TileIsCorner(index)
	/// @description Returns if a tile is a wall
	/// @param {real} index The index of the tile
	return (argument0 == 40 || argument0 == 42 || argument0 == 56 || argument0 == 58);
	}

function TileIsWall(argument0) {
	/// @function TileIsWall(index)
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
	}
