camera = camera_create();

global.window_width = 960;
global.window_height = 540;

zoom = 2;

width = global.window_width / zoom;
height = global.window_height / zoom;

camera_x = x;
camera_y = y;

//camera instance following
camera_speed = 0.1;
follow = instance_find(objPlayer,1);
if(instance_exists(follow))
	{
	x = follow.x + (tile_size/2);
	y = follow.y + (tile_size/2);
	};
x_to = x;
y_to = y;

//camera shake
camera_shake_continuous = false;
camera_shake_type = 1; // 0 = random, 1 = vertical, 2 = horizontal
camera_shake_timer = 0;
camera_shake_magnitude = 0;
camera_shake_dir = 0; // 0 = 0, 1 = 90, 2 = 180, 3 = 270

//camera drag
drag_x = x;//where the player is dragging from on the screen
drag_y = y;
start_x = x;//where the camera is when the player starts dragging
start_y = y;
drag_timer = -1;//wait 3s after dragging, then move camera back to active player

var vm = matrix_build_lookat(camera_x,camera_y,-10000,camera_x,camera_y,0,0,1,0);
var pm = matrix_build_projection_ortho(width,height,-10000,100000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;