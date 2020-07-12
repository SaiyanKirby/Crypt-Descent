#region //Functions
function CanMove(argument0, argument1) {
	/// @function scrCanMove(x, y)
	/// @description Move the player, if they can
	/// @param {real} x The new x-coordinate
	/// @param {real} y The new y-coordinate
	var _xx = argument0;
	var _yy = argument1;

	if(_xx < 0 || _xx >= room_width || _yy < 0 || _yy >= room_height)
		{return false;}

	var i = GetTile(floor(_xx/tile_size),floor(_yy/tile_size));

	if(TileIsWall(i) && canGoThroughWalls)
		{return true;}
	else if(!TileIsWall(i) && !TileIsCorner(i)) 
		{
		if(i == 63 && global.rooms_created == global.crypt_room_number)
			{return false;}
		else
			{return true;}
		};
	else
		{return false;}
	}

#endregion

image_speed = 0;

shadow = instance_create_depth(x,y,depth+1,objPlayerShadow);

playerNumber = 1;

cursorTimer = 0;

playerMovement = 0;
hasMoved = false;
isMoving = false;
moveTimer = 0;
moveTime = 12;
x_prev = x;
y_prev = y;
x_next = x;
y_next = y;
turn_start_x = x;
turn_start_y = y;

buffered_input = "";
frames_since_buffer = 0;
max_buffer_time = 30;

//stats
playerClass = 0;
playerMaxHP = 20;
playerHP = 20;
playerLevel = 1;
playerEXP = 0;
playerSpeed = 4;
canGoThroughWalls = false;
playerDice = ds_grid_create(8,11);
//7 wide for d4, 6, 8, 10, 12, 20, modifier, defense
// 11 tall for str, dex, int, fire, water, earth, air, lightning, poison, dark, holy
playerBaseStats = [2,1,0,2]; // start with STR 1d8, DEX 1d6, INT 1d4, 2 Defense
playerDice[# playerBaseStats[0], 0] = 1;
playerDice[# playerBaseStats[1], 1] = 1;
playerDice[# playerBaseStats[2], 2] = 1;
playerDice[# 7, 0] = playerBaseStats[3];
playerEquipment = ds_list_create();
playerInventory = ds_list_create();
playerPotions = ds_list_create();
playerSpells = ds_list_create();
playerPet = -1;