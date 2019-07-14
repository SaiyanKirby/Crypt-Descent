draw_self();
draw_sprite(sprPlayer,0,x+16,y+18);

//draw cursor
var t = (cursorTimer / 8) % 3;

var i = scrGetTile((x-tile_size)/tile_size,y/tile_size);
if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
	{draw_sprite(sprCursor,t,x-tile_size,y);}
	
i = scrGetTile(x/tile_size,(y-tile_size)/tile_size);
if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
	{draw_sprite(sprCursor,t,x,y-tile_size);}
	
i = scrGetTile((x+tile_size)/tile_size,y/tile_size);
if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
	{draw_sprite(sprCursor,t,x+tile_size,y);}
	
i = scrGetTile(x/tile_size,(y+tile_size)/tile_size);
if((!scrTileIsWall(i) && !scrTileIsCorner(i)) || scrTileIsWall(i) && canGoThroughWalls)
	{draw_sprite(sprCursor,t,x,y+tile_size);}