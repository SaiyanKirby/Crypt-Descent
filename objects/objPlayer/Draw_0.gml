var half_tile = tile_size / 2;

if(global.current_player == playerNumber)
	{
	draw_sprite(sprShadow,0,x+half_tile,y+(half_tile));
	//hop animation when moving
	var hop = sin((moveTimer / moveTime) * pi) * half_tile;
	draw_sprite(sprPlayer,playerClass,x+half_tile,y+(half_tile)-hop);
	
	//draw cursor
	if(!isMoving)
		{
		var t = floor(cursorTimer / 8) % 3;

		if(scrCanMove(x - tile_size, y))
			{draw_sprite(sprCursor, t, x - tile_size, y);}
		if(scrCanMove(x, y - tile_size))
			{draw_sprite(sprCursor, t, x, y - tile_size);}
		if(scrCanMove(x + tile_size, y))
			{draw_sprite(sprCursor, t, x + tile_size, y);}
		if(scrCanMove(x, y + tile_size))
			{draw_sprite(sprCursor, t, x, y + tile_size);}
		}
	}
else
	{
	var xoffset = (tile_size / 4) + ((playerNumber-1) * (tile_size / 4));
	var yoffset = tile_size * 0.75;
	draw_sprite_ext(sprShadow,0,x + xoffset,y + yoffset,0.5,0.5,0,c_white,1);
	draw_sprite_ext(sprPlayer,playerClass,x + xoffset,y + yoffset,0.5,0.5,0,c_white,1);
	};