tilelayer = layer_get_id("layerTileset");
tilemap = layer_tilemap_get_id(tilelayer);

//set up room for dungeon creation
tile_size = 32; //size of tiles in pixels
crypt_room_number = 1; // number of "rooms" per floor
floor_size = (crypt_room_number * 2) + 2; // add some padding, just in case

room_width = tile_size * floor_size * 3;
room_height = tile_size * floor_size * 3;

tilemap_clear(tilemap, 0);
tilemap_set_width(tilemap, floor_size * 3);
tilemap_set_height(tilemap, floor_size * 3);

cryptGrid = ds_grid_create(floor_size,floor_size);
ds_grid_clear(cryptGrid, 0);

/*
Room data is stored as a 5-entry array.
The first index is the center tile, then top, right, bottom and left respectively.
Each entry is a number denoting what type of space it is:
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

var center = floor(floor_size/2); //get center of map to create a room
var cryptroomdesign = [spaces.ground,spaces.ground,spaces.ground,spaces.ground,spaces.ground];
scrCreateCryptRoom(center, center, cryptroomdesign);
scrCreateCryptRoom(center+1, center, cryptroomdesign);
scrCreateCryptRoom(center-1, center, cryptroomdesign);
scrCreateCryptRoom(center, center+1, cryptroomdesign);
scrCreateCryptRoom(center, center-1, cryptroomdesign);

objPlayer.x = (center * tile_size * 3) + tile_size;
objPlayer.y = (center * tile_size * 3) + tile_size;
with(objCamera)
	{
	follow = objPlayer;
	x = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	y = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	};