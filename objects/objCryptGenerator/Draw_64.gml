//draw_text(20,20,string(room_width) + ", " + string(room_height));
draw_set_halign(fa_left);

//print every room that's been generated
/*var str = ""
for(var iy = 0; iy < floor_size; iy++)
	{
	for(var ix = 0; ix < floor_size; ix++)
		{str += (global.cryptGrid[# ix, iy] != -1 ? "o" : "x") + " ";}
	str += "\n";
	};
draw_text(8, 68, str);*/

//print the design of the current room the player's in
var xx = scrGetCellX(objPlayer.x);
var yy = scrGetCellY(objPlayer.y);
var d = global.cryptGrid[# xx, yy];
str = "Room tiles: \n";
if(is_array(d))
	{
	str += "  40 " + string_format(d[1],2,0) + " 41\n";
	str += "  " + string_format(d[4],2,0) + " " + string_format(d[0],2,0) + " " + string_format(d[2],2,0) + "\n";
	str += "  56 " + string_format(d[3],2,0) + " 58";
	}
else
	{str += "[x]";}
draw_text(8, 392, "World Pos: " + string(objPlayer.x) + ", " + string(objPlayer.y));
draw_text(8, 416, "Room Pos: " + string(xx) + ", " + string(yy));
draw_text(8, 440, str);

draw_text(8,8,"Press space to regenerate the dungeon.\nPress WASD or arrow keys to move.\nPress numpad +/- to zoom in/out.");
draw_set_halign(fa_center);
draw_text_transformed(480,500,string(global.rooms_created) + " / " + string(global.crypt_room_number) + " rooms",2,2,0);
draw_set_halign(fa_left);