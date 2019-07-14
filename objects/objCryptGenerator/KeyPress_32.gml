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