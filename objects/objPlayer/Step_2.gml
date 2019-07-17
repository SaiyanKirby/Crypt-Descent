if(global.current_player != playerNumber)
	{
	var xoffset = (playerNumber * (tile_size / 4)) - (tile_size / 8);
	var yoffset = tile_size * 0.75;
	shadow.x = x + xoffset;
	shadow.y = y + yoffset;
	shadow.image_xscale = 0.5;
	shadow.image_yscale = 0.5;
	};
else
	{
	shadow.x = x + (tile_size / 2);
	shadow.y = y + (tile_size / 2);
	shadow.image_xscale = 1;
	shadow.image_yscale = 1;
	};