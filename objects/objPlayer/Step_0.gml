var pressedUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
var pressedLeft = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
var pressedDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
var pressedRight = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);

if(pressedUp)
	{
	i = scrGetTile(x/tile_size,(y-tile_size)/tile_size);
	if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
		{y -= tile_size;}
	}
if(pressedLeft)
	{
	var i = scrGetTile((x-tile_size)/tile_size,y/tile_size);
	if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
		{x -= tile_size;}
	}
if(pressedDown)
	{
	i = scrGetTile(x/tile_size,(y+tile_size)/tile_size);
	if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
		{y += tile_size}
	}
if(pressedRight)
	{
	i = scrGetTile((x+tile_size)/tile_size,y/tile_size);
	if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
		{x += tile_size}
	}

cursorTimer++;