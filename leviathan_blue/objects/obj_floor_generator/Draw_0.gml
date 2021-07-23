/// @description Insert description here
// You can write your code in this editor
var floor_counter = 0;
var wall_counter = 0;
var _tiles_checked = 0;

if ds_exists(global.wallMap, ds_type_grid) {
	for (var ii=0; ii<MAP_W; ii++) {
		for (var jj=0; jj<MAP_H; jj++) {
			if global.wallMap[# ii,jj] == TileType.Floor {
				draw_sprite(spr_tile_stone_16,image_index,ii*CELL_W,jj*CELL_H);
				floor_counter += 1;
				_tiles_checked += 1;
			}
			if global.wallMap[# ii,jj] == TileType.Wall {
				draw_sprite(spr_tile_stone_wall_16,image_index,ii*CELL_W,jj*CELL_H);
				_tiles_checked += 1;
				wall_counter += 1;
				}
			}
		}
	}
//show_debug_message("floors found: " + string(floor_counter) + ", walls found: " + string(wall_counter) + ", tiles checked: " + string(_tiles_checked));