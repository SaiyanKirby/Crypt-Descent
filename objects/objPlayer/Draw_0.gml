draw_self();
draw_sprite(sprPlayer,0,x+16,y+18);

//draw cursor
var t = (cursorTimer / 8) % 3;

if(scrCanMove(x - tile_size, y))
	{draw_sprite(sprCursor, t, x - tile_size, y);}
if(scrCanMove(x, y - tile_size))
	{draw_sprite(sprCursor, t, x, y - tile_size);}
if(scrCanMove(x + tile_size, y))
	{draw_sprite(sprCursor, t, x + tile_size, y);}
if(scrCanMove(x, y + tile_size))
	{draw_sprite(sprCursor, t, x, y + tile_size);}