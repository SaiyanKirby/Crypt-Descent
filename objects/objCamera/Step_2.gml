/// @description Move Camera

if(instance_exists(follow))
	{
	//x_to = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	//y_to = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	
	x_to = follow.x + (tile_size/2);
	y_to = follow.y + (tile_size/2);
	
	//x_to = clamp(x_to,(width/2),(room_width-(width/2)));
	//y_to = clamp(y_to,(height/2),(room_height-(height/2)));
	
	x = lerp(x,x_to,camera_speed);
	y = lerp(y,y_to,camera_speed);
	};

#region camera drag
if(mouse_check_button(mb_right))
	{
	drag_timer = 90;
	var mx = window_mouse_get_x() / zoom;
	var my = window_mouse_get_y() / zoom;
	if(mouse_check_button_pressed(mb_right))
		{
		follow = noone;
		drag_x = mx;
		drag_y = my;
		start_x = x;
		start_y = y;
		};
	x = start_x + (drag_x - mx);
	y = start_y + (drag_y - my);
	};
if(mouse_check_button_released(mb_right))
	{drag_timer = 90;};
if(drag_timer > 0)
	{
	--drag_timer;
	if(drag_timer == 0)//go back to active player after dragging
		{
		drag_timer = -1;
		follow = objPlayer;
		}
	};
#endregion

//x = clamp(round(x),(width/2),(room_width-(width/2)));
//y = clamp(round(y),(height/2),(room_height-(height/2)));
x = round(x);
y = round(y);

camera_x = x;
camera_y = y;

#region camera shake
if(camera_shake_magnitude > 0)
	{
	camera_shake_timer++;
	if(camera_shake_timer > 60)
		{camera_shake_timer -= 60;};
	if(!camera_shake_continuous)
		{
		if(camera_shake_timer % 3 == 0)
			{camera_shake_magnitude = lerp(camera_shake_magnitude,0,0.25);};
		};
	if(camera_shake_magnitude < 0.1)
		{camera_shake_magnitude = 0;};
	else
		{
		switch(camera_shake_type)
			{
			case 0:
				var d = camera_shake_dir;
				if(camera_shake_timer % 3 == 0)
					{
					camera_shake_dir = irandom(3);
					if(camera_shake_dir == d)
						{
						camera_shake_dir++;
						if(camera_shake_dir > 3)
							{camera_shake_dir = 0;};
						};
					};
				break;
			case 1:
				if(camera_shake_dir == 0 || camera_shake_dir == 2)
					{camera_shake_dir = 1;};
				if(camera_shake_timer % 3 == 0)
					{
					if(camera_shake_dir == 1)
						{camera_shake_dir = 3;};
					else
						{camera_shake_dir = 1;};
					};
				break;
			case 2:
				if(camera_shake_dir == 1 || camera_shake_dir == 3)
					{camera_shake_dir = 0;};
				if(camera_shake_timer % 3 == 0)
					{
					if(camera_shake_dir == 0)
						{camera_shake_dir = 2;};
					else
						{camera_shake_dir = 0;};
					};
				break;
			};
		switch(camera_shake_dir)
			{
			case 0:
				camera_x += camera_shake_magnitude;
				break;
			case 1:
				camera_y -= camera_shake_magnitude;
				break;
			case 2:
				camera_x -= camera_shake_magnitude;
				break;
			case 3:
				camera_y += camera_shake_magnitude;
				break;
			};
		};
	};
else
	{camera_shake_timer = 0;};
#endregion

//global.HUD_x = camera_x-(width/2);
//global.HUD_y = camera_y-(height/2);

var vm = matrix_build_lookat(camera_x,camera_y,-10000,camera_x,camera_y,0,0,1,0);
camera_set_view_mat(camera,vm);