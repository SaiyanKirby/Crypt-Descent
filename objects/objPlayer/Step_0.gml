cursorTimer++;

#region movement
var pressedUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
var pressedLeft = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
var pressedDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
var pressedRight = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);

var hasMoved = false;
var xx = 0;
var yy = 0;

if(pressedUp && !pressedDown)
	{yy -= tile_size}
else if(pressedDown && !pressedUp)
	{yy += tile_size;}
else if(pressedLeft && !pressedRight)
	{xx -= tile_size;}
else if(pressedRight && !pressedLeft)
	{xx += tile_size;}

if(scrCanMove(x + xx, y + yy))
	{
	x += xx;
	y += yy;
	hasMoved = true;
	};
#endregion

#region build out level
if(hasMoved)
	{
	var xx = scrGetCellX(objPlayer.x);
	var yy = scrGetCellY(objPlayer.y);
	var d = global.cryptGrid[# xx, yy];
	if(!is_array(d))
		{scrBuildCryptRoom(xx, yy, [1,1,1,1,1]);}
	};
#endregion