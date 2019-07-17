cursorTimer++;
hasMoved = false;

if(global.current_player != playerNumber)
	{exit;}

if(global.game_state == "explore")
	{
	#region input
	if(global.pressedUp && !global.pressedDown)
		{buffered_input = "up";}
	else if(global.pressedDown && !global.pressedUp)
		{buffered_input = "down";}
	else if(global.pressedLeft && !global.pressedRight)
		{buffered_input = "left";}
	else if(global.pressedRight && !global.pressedLeft)
		{buffered_input = "right";}

	if(buffered_input != "")
		{
		++frames_since_buffer;
		if(frames_since_buffer >= max_buffer_time)
			{
			buffered_input = "";
			frames_since_buffer = 0;
			}
		}
	#endregion

	#region movement
	if(isMoving)
		{
		if(moveTimer >= moveTime)
			{
			x = x_next;
			y = y_next;
			isMoving = false;
			moveTimer = 0;
		
			if(playerMovement >= playerSpeed)
				{
				playerMovement = 0;
				++global.current_player;
				if(global.current_player > global.max_players)
					{global.current_player = 1;}
				with(objPlayer)
					{
					if(global.current_player == playerNumber)
						{objCamera.follow = self}
					}
				}
			}
		else
			{
			++moveTimer;
			x = lerp(x_prev, x_next, moveTimer / moveTime);
			y = lerp(y_prev, y_next, moveTimer / moveTime);
			}
		}
	else if(!isMoving && moveTimer == 0)
		{
		//round to a tile, just in case
		x -= (x % tile_size);
		x -= (y % tile_size);

		var xx = 0;
		var yy = 0;

		if(buffered_input == "up" || (global.heldUp && ! global.heldDown))
			{
			yy -= tile_size;
			buffered_input = "";
			}
		else if(buffered_input = "down" || (global.heldDown && !global.heldUp))
			{
			yy += tile_size;
			buffered_input = "";
			}
		else if(buffered_input = "left" || (global.heldLeft && !global.heldRight))
			{
			xx -= tile_size;
			buffered_input = "";
			}
		else if(buffered_input = "right" || (global.heldRight && !global.heldLeft))
			{
			xx += tile_size;
			buffered_input = "";
			}

		if(xx != 0 || yy != 0)
			{
			if(scrCanMove(x + xx, y + yy))
				{
				x_prev = x;
				y_prev = y;
				x_next = x + xx;
				y_next = y + yy;
				isMoving = true;
				moveTimer = 0;
				hasMoved = true;
				playerMovement++;
				}
			}
		}
	#endregion

	#region build out level
	if(hasMoved)
		{
		var xx = scrGetCellX(x_next);
		var yy = scrGetCellY(y_next);
		var d = global.cryptGrid[# xx, yy];
		if(!is_array(d))
			{
			var d = scrCreateRandomCryptRoom();
			//get player's room-space position
			var rx = (x_next / tile_size) % 3;
			var ry = (y_next / tile_size) % 3;
			//rotate room as needed
			if(rx == 1 && ry == 0)
				{d = scrRotateCryptRoom(d, 180)};
			else if(rx == 2 && ry == 1)
				{d = scrRotateCryptRoom(d, 270)};
			else if(rx == 0 && ry == 1)
				{d = scrRotateCryptRoom(d, 90)};
			//build new room
			scrBuildCryptRoom(xx, yy, d);
			}
		}
	#endregion
	}
