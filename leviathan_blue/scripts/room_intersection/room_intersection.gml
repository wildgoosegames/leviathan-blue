// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function room_intersection(current_room,other_room){
//to do: fix intersection code to account for circular rooms
if ((current_room.left_x <= other_room.right_x) && 
(current_room.right_x >= other_room.left_x) && 
(current_room.top_y <= other_room.bottom_y) && 
(current_room.bottom_y >= other_room.top_y)) {
	show_debug_message("current room left x: " + string(current_room.left_x) + "vs other room right x: " + string(other_room.right_x) + ", current room right x: " + string(current_room.right_x) + "vs other room left x: " + string(other_room.left_x));
	show_debug_message("current room top y: " + string(current_room.top_y) + "vs other room bottom y: " + string(other_room.bottom_y) + ", current room bottom y: " + string(current_room.bottom_y) + "vs other room top y: " + string(other_room.top_y));
	return true;
} else {
	return false;
}
}