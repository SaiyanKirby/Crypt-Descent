if(keyboard_check_pressed(vk_add))
	{
	zoom = 2;
	width = window_width / zoom;
	height = window_height / zoom;
	var vm = matrix_build_lookat(camera_x,camera_y,-10000,camera_x,camera_y,0,0,1,0);
	var pm = matrix_build_projection_ortho(width,height,-10000,100000);
	camera_set_view_mat(camera,vm);
	camera_set_proj_mat(camera,pm);
	view_camera[0] = camera;
	}
if(keyboard_check_pressed(vk_subtract))
	{
	zoom = 1;
	width = window_width / zoom;
	height = window_height / zoom;
	var vm = matrix_build_lookat(camera_x,camera_y,-10000,camera_x,camera_y,0,0,1,0);
	var pm = matrix_build_projection_ortho(width,height,-10000,100000);
	camera_set_view_mat(camera,vm);
	camera_set_proj_mat(camera,pm);
	view_camera[0] = camera;
	}