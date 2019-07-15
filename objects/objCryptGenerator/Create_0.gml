randomize();

tilelayer = layer_get_id("layerTileset");
global.tilemap = layer_tilemap_get_id(tilelayer);

//set up room for dungeon creation
#macro tile_size 32 //size of tiles in pixels
crypt_room_number = 4; // number of "rooms" per floor
floor_size = (crypt_room_number * 2) + 1; // add some padding, just in case

room_width = tile_size * floor_size * 3;
room_height = tile_size * floor_size * 3;

tilemap_clear(global.tilemap, 0);
tilemap_set_width(global.tilemap, floor_size * 3);
tilemap_set_height(global.tilemap, floor_size * 3);

global.cryptGrid = ds_grid_create(floor_size,floor_size);
ds_grid_clear(global.cryptGrid, -1);

/*
Room data is stored as a 5-entry array.
The first index is the center tile, then top, right, bottom and left respectively.
Each entry is a number denoting what type of space it is.
See the enum below:
*/
#region spaces enum
enum spaces
	{
	empty = 0,
	ground = 1,
	potion = 2,
	chest = 3,
	event = 4,
	water = 5,
	lava = 6,
	acid = 7,
	void = 8,
	entrystairs = 9,
	exitstairs = 10,
	topleftcorner = 40,
	topwall = 41,
	toprightcorner = 42,
	leftwall = 48,
	wall = 49,
	rightwall = 50,
	bottomleftcorner = 56,
	bottomwall = 57,
	bottomrightcorner = 58
	};
#endregion

var center = floor(floor_size/2);
scrBuildCryptRoom(center, center, [1,1,1,1,1]);
//scrBuildCryptRoom(center-1, center-1, scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center,   center-1, scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center+1, center-1, scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center-1, center,   scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center,   center,   scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center+1, center,   scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center-1, center+1, scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center,   center+1, scrCreateRandomCryptRoom());
//scrBuildCryptRoom(center+1, center+1, scrCreateRandomCryptRoom());

//set the player and camera to the start of the map
objPlayer.x = (center * tile_size * 3) + tile_size;
objPlayer.y = (center * tile_size * 3) + tile_size;
with(objCamera)
	{
	follow = objPlayer;
	x = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	y = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	};