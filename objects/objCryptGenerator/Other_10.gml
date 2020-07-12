/// @description Recreate rooms

//clear map
tilemap_clear(global.tilemap, 0);
ds_grid_clear(global.cryptGrid, -1);
global.rooms_created = 0;

//create new random rooms
var center = floor(floor_size/2);
BuildCryptRoom(center, center, [2,1,1,1,1]);
//BuildCryptRoom(center-1, center-1, scrCreateRandomCryptRoom());
//BuildCryptRoom(center,   center-1, scrCreateRandomCryptRoom());
//BuildCryptRoom(center+1, center-1, scrCreateRandomCryptRoom());
//BuildCryptRoom(center-1, center,   scrCreateRandomCryptRoom());
//BuildCryptRoom(center,   center,   scrCreateRandomCryptRoom());
//BuildCryptRoom(center+1, center,   scrCreateRandomCryptRoom());
//BuildCryptRoom(center-1, center+1, scrCreateRandomCryptRoom());
//BuildCryptRoom(center,   center+1, scrCreateRandomCryptRoom());
//BuildCryptRoom(center+1, center+1, scrCreateRandomCryptRoom());

//set the player and camera to the start of the map
with(objPlayer)
	{
	x = (center * tile_size * 3) + tile_size;
	y = (center * tile_size * 3) + tile_size;
	turn_start_x = x;
	turn_start_y = y;
	playerMovement = 0;
	}
with(objCamera)
	{
	follow = objPlayer;
	//x = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	//y = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	x = follow.x + (tile_size/2);
	y = follow.y + (tile_size/2);
	};