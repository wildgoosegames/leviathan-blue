// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tunnel_between(current_room,previous_room){
	x1 = current_room.center_x;
	x2 = previous_room.center_x;
	y1 = current_room.center_y;
	y2 = previous_room.center_y;
	
	var _coin_flip = irandom_range(0,1);
	if _coin_flip == 0 {
		corner_x = x2;
		corner_y = y1;
	} else {
		corner_x = x1;
		corner_y = y2;
	}
	
	
	ds_grid_set_region(global.wallMap,x1,y1,corner_x,corner_y,TileType.Floor);
	ds_grid_set_region(global.wallMap,corner_x,corner_y,x2,y2,TileType.Floor);
	/*for (i=x1; i<x1+corner_x; i++) {
		for (j=y1;j<y1+corner_y; j++) {
			variable_struct_set(global.GameMap[# i,j],"tile_type",TileType.Floor);
		}
	}
	
	for (i=corner_x; i<x2+corner_x; i++) {
		for (j=corner_y;j<y2+corner_y; j++) {
			variable_struct_set(global.GameMap[# i,j],"tile_type",TileType.Floor);
		}
	}*/
	
	//show_debug_message("x1: " + string(x1) + ", x2: " + string(x2) + ", y1: " + string(y1) + ", y2: " + string(y2) + ", corner_x: " + string(corner_x) + ", corner_y: " + string(corner_y));
}