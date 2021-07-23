// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro CELL_W 16
#macro CELL_H 16

#macro MAP_W 100
#macro MAP_H 100

#macro ROOM_W 1366
#macro ROOM_H 768

#macro MIN_ROOM_LENGTH 3
#macro MAX_ROOM_LENGTH 10

#macro MIN_ROOM_HEIGHT 3
#macro MAX_ROOM_HEIGHT 10

#macro MIN_NUMBER_OF_ROOMS 10
#macro MAX_NUMBER_OF_ROOMS 20

enum TileType {
	Wall,
	Floor,
	StairUp,
	StairDown
}

