// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_room(x1,y1,x2,y2) constructor {
left_x = x1;
right_x = x2;
top_y = y1;
bottom_y = y2;
center_x = (right_x + left_x) div 2;
center_y = (bottom_y + top_y) div 2;

var _length = x2 - x1;
var _height = y2 - y1;
var _room_size = _length*_height;
var _cell_count = 0;

square_or_circle = choose("square","circle");
//square_or_circle = "square";

}