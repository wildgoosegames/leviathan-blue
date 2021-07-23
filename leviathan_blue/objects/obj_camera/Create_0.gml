/// @description Insert description here
// You can write your code in this editor
//resolution
#macro RES_W 800
#macro RES_H 450
#macro RES_SCALE 2

#macro CAM_SMOOTH 0.4

//enable views
view_enabled = true;
view_visible[0] = true;

//create camera
camera = camera_create_view(0,0,RES_W,RES_H);

view_set_camera(0,camera);

//resize window & application surface
window_set_size(RES_W * RES_SCALE, RES_H*RES_SCALE);
surface_resize(application_surface, RES_W*RES_SCALE,RES_H*RES_SCALE);

display_set_gui_size(RES_W,RES_H);

//center window
var display_width = 1600 //display_get_width;
var display_height = 900 //display_get_height;

var window_width = RES_W*RES_SCALE;
var window_height = RES_H*RES_SCALE;

//window_set_position((display_width/2 - window_width/2), display_height/2 - window_height/2);

//mouse previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);