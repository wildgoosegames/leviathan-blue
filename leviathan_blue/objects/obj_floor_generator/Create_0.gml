/// @description Insert description here
// You can write your code in this editor
randomize();
var _random_room_x = irandom_range(1,MAP_W-1);
var _random_room_y = irandom_range(1,MAP_H-1);
var _random_room_length = irandom_range(MIN_ROOM_LENGTH,MAX_ROOM_LENGTH);
var _random_room_height = irandom_range(MIN_ROOM_HEIGHT,MAX_ROOM_HEIGHT);
var _number_of_rooms = irandom_range(MIN_NUMBER_OF_ROOMS,MAX_NUMBER_OF_ROOMS);
var _room_counter = _number_of_rooms;
var _tunnel_counter = 0;
var _floors_generated = 0;
var center_x = 0;
var center_y = 0;
var tile_floor_counter = 0;
does_intersect = false;
var intersection_counter = 0;
var any_intersections = 0;

if ds_exists(global.wallMap, ds_type_grid) {
	while _room_counter > -1 {
	//making sure random room variables don't go out of bounds
	if (_random_room_x + _random_room_length) < (MAP_W-1) {
		if (_random_room_y + _random_room_height) < (MAP_H-1) {
			
			//using a struct here
			current_room = new create_room(_random_room_x,_random_room_y,_random_room_x + _random_room_length,_random_room_y + _random_room_height);
			
			
		//look for intersections with previous rooms
			if ds_exists(global.roomList,ds_type_list) {
				if !ds_list_empty(global.roomList) {
					any_intersections = 0;
					for (var index=0; index<ds_list_size(global.roomList); index++) {
						does_intersect = room_intersection(current_room,global.roomList[| index]);
						intersection_counter += 1;
						//use any_intersections counter since continue doesn't seem to work for some reason
						if does_intersect {
							any_intersections += 1;
							show_debug_message("intersection found");
							continue;
						}
					}
				}
			}
			show_debug_message("total intersections with current room: " + string(any_intersections));
			
		//dig out the rooms if they are valid
			if (current_room.square_or_circle == "square") && (any_intersections == 0) {
				ds_grid_set_region(global.wallMap,current_room.left_x,current_room.top_y,current_room.right_x,current_room.bottom_y,TileType.Floor);
				//decrement the room counter
				_room_counter -= 1;
				}

			if (current_room.square_or_circle == "circle") && (any_intersections == 0) {
				ds_grid_set_disk(global.wallMap,current_room.center_x,current_room.center_y,current_room.right_x - current_room.left_x,TileType.Floor);
				//decrement the room counter
				_room_counter -= 1;
				}
			
			
			//add new room to the list
			if ds_exists(global.roomList,ds_type_list) && (any_intersections == 0) {
				ds_list_add(global.roomList,current_room);
				show_debug_message("rooms: " + string(ds_list_size(global.roomList)) + "current room: " + string(current_room));
			}
			
			//tunnel between rooms once there are at least 2 rooms dug out
			if ds_exists(global.roomList,ds_type_list) && (any_intersections == 0) {
				if ds_list_size(global.roomList) > 1 {
					tunnel_between(current_room,previous_room);
					_tunnel_counter++;
					show_debug_message("tunnels dug: " + string(_tunnel_counter));
				}
			}
			
			_floors_generated += _random_room_height*_random_room_length;
			show_debug_message("rooms left: " + string(_room_counter));
			
			
			//place the player object in the first room dug out, in the center of the room
			if !instance_exists(obj_player) {
				var _x_player = current_room.center_x;
				var _y_player = current_room.center_y;
				instance_create_depth(_x_player*CELL_W,_y_player*CELL_H,-9,obj_player);
				instance_create_depth(0,0,-100,obj_camera);
				show_debug_message("creating player at" + string(_x_player) + "," + string(_y_player));
			}
		//move current room to previous room
		if (any_intersections == 0) {
			previous_room = current_room;
		}
		}
	}

		//re-randomize room variables
		_random_room_y = irandom_range(1,MAP_H-1);
		_random_room_height = irandom_range(MIN_ROOM_HEIGHT,MAX_ROOM_HEIGHT);
		_random_room_x = irandom_range(1,MAP_W-1);
		_random_room_length = irandom_range(MIN_ROOM_LENGTH,MAX_ROOM_LENGTH);
			


			

	}
show_debug_message("floors generated: " + string(_floors_generated));
show_debug_message("tiles made into floors: " + string(tile_floor_counter));
show_debug_message("intersections checked: " + string(intersection_counter));
}

//set 1 inch thick wall around edge of map to prevent anything going out of bounds
ds_grid_set_region(global.wallMap,0,0,0,MAP_H-1,TileType.Wall);
ds_grid_set_region(global.wallMap,0,0,MAP_W-1,0,TileType.Wall);
ds_grid_set_region(global.wallMap,MAP_W-1,0,MAP_W-1,MAP_H-1,TileType.Wall);
ds_grid_set_region(global.wallMap,0,MAP_H-1,MAP_W-1,MAP_H-1,TileType.Wall);