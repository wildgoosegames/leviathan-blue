// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_grid_collision(argument0,argument1,argument2){
target_object = argument0;
target_x = argument1;
target_y = argument2;

if global.wallMap[# target_x,target_y] == TileType.Wall {
	return true;
} else return false;
}