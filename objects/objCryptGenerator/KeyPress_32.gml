/// @description Recreate rooms

//clear map
tilemap_clear(global.tilemap, 0);
ds_grid_clear(cryptGrid, 0);

//create new random rooms
var center = floor(floor_size/2);
scrBuildCryptRoom(center-1, center-1, scrCreateRandomCryptRoom());
scrBuildCryptRoom(center,   center-1, scrCreateRandomCryptRoom());
scrBuildCryptRoom(center+1, center-1, scrCreateRandomCryptRoom());
scrBuildCryptRoom(center-1, center,   scrCreateRandomCryptRoom());
scrBuildCryptRoom(center,   center,   scrCreateRandomCryptRoom());
scrBuildCryptRoom(center+1, center,   scrCreateRandomCryptRoom());
scrBuildCryptRoom(center-1, center+1, scrCreateRandomCryptRoom());
scrBuildCryptRoom(center,   center+1, scrCreateRandomCryptRoom());
scrBuildCryptRoom(center+1, center+1, scrCreateRandomCryptRoom());

//set the player and camera to the start of the map
objPlayer.x = (center * tile_size * 3) + tile_size;
objPlayer.y = (center * tile_size * 3) + tile_size;
with(objCamera)
	{
	follow = objPlayer;
	x = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	y = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	};