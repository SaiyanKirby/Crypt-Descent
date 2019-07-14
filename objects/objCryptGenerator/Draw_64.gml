//draw_text(20,20,string(room_width) + ", " + string(room_height));

for(var ix = 0; ix < floor_size; ix++)
	{
	for(var iy = 0; iy < floor_size; iy++)
		{
		var str = cryptGrid[#ix,iy] != 0 ? 1 : 0;
		draw_text(8 + ix*12, 8 + iy*12, str);
		}
	};