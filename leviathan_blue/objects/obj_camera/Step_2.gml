/// @description Insert description here
// You can write your code in this editor
//get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);


//panning
if (mouse_check_button(mb_middle)) {
	var move_x = device_mouse_x_to_gui(0) - mouse_x_previous;
	var move_y = device_mouse_y_to_gui(0) - mouse_y_previous;
	
	camX -= move_x;
	camY -= move_y;
}

//set target camera position
var targetX = obj_player.x - camW/2;
var targetY = obj_player.y - camH/2;

//clamp the target to room bounds
targetX = clamp(targetX, 0, room_width - camW);
targetY = clamp(targetY,0,room_height-camH);

//smoothly move camera to target position
camX = lerp(camX, targetX, CAM_SMOOTH);
camY = lerp(camY, targetY, CAM_SMOOTH);

//zooming
var wheel = mouse_wheel_down() - mouse_wheel_up();

if (wheel != 0) {
	wheel *= 0.1;
	//add to size
	var addW = camW * wheel;
	var addH = camH * wheel;
	
	camW += addW;
	camH += addH;
	
	//position
	camX -= addW/2;
	camY -= addH/2;
}

//apply camera position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera,camW,camH);