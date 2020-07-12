randomize();

tilelayer = layer_get_id("layerTileset");
global.tilemap = layer_tilemap_get_id(tilelayer);

//set up room for dungeon creation
#macro tile_size 32 //size of tiles in pixels
global.crypt_room_number = 20; // number of "rooms" per floor
global.rooms_created = 0; // current number of rooms
floor_size = (global.crypt_room_number * 2) + 1; // add some padding, just in case

room_width = tile_size * floor_size * 3;
room_height = tile_size * floor_size * 3;

tilemap_set_width(global.tilemap, floor_size * 3);
tilemap_set_height(global.tilemap, floor_size * 3);
tilemap_clear(global.tilemap, 15);

global.cryptGrid = ds_grid_create(floor_size,floor_size);
ds_grid_clear(global.cryptGrid, -1);

global.room_deck = ds_list_create();
ds_list_add(global.room_deck, [2,1,1,1,1]);

/*
Room data is stored as a 5-entry array.
The first index is the center tile, then top, right, bottom and left respectively.
Each entry is a number denoting what type of space it is.
See the enum below:
*/
#region spaces enum
enum spaces
	{	
	wall = -1,
	empty = 0,
	
	topleftnormal = 16,
	topwallnormal = 17,
	toprightnormal = 18,
	leftwallnormal = 24,
	groundnormal = 1,
	rightwallnormal = 26,
	bottomleftnormal = 32,
	bottomwallnormal = 33,
	bottomrightnormal = 34,
	
	topleftred = 19,
	topwallred = 20,
	toprightred = 21,
	leftwallred = 27,
	groundred = 28,
	rightwallred = 29,
	bottomleftred = 35,
	bottomwallred = 36,
	bottomrightred = 37,
	
	topleftgreen = 40,
	topwallgreen = 41,
	toprightgreen = 42,
	groundgreen = 49,
	leftwallgreen = 48,
	rightwallgreen = 50,
	bottomleftgreen = 56,
	bottomwallgreen = 57,
	bottomrightgreen = 58,
	
	topleftblue = 43,
	topwallblue = 44,
	toprightblue = 45,
	leftwallblue = 51,
	groundblue = 52,
	rightwallblue = 53,
	bottomleftblue = 59,
	bottomwallnblue = 60,
	bottomrightblue = 61,
	
	entrystairs = 2,
	exitstairs = 3,
	water = 4,
	lava = 5,
	acid = 6,
	void = 7,
	
	event = 100,
	potion = 101,
	chest = 102,
	chestartifact = 103,
	chestset = 104,
	portal = 105,
	catacombs = 106,
	pixel = 107
	};
#endregion

event_perform(ev_other, ev_user0);