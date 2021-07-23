/// @description Insert description here
// You can write your code in this editor



//create an empty map to find walls
global.wallMap = ds_grid_create(MAP_W, MAP_H);
ds_grid_set_region(global.wallMap,0,0,MAP_W-1,MAP_H-1,TileType.Wall);

//create an empty map to use for storing entity locations
global.entityMap = ds_grid_create(MAP_W, MAP_H);
ds_grid_set_region(global.entityMap,0,0,MAP_W-1,MAP_H-1,noone);

//create an empty map to store location of water
global.waterMap = ds_grid_create(MAP_W, MAP_H);
ds_grid_set_region(global.waterMap,0,0,MAP_W-1,MAP_H-1,0);

//to use when flooding map
global.waterChecked = ds_grid_create(MAP_W, MAP_H);
ds_grid_set_region(global.waterChecked,0,0,MAP_W-1,MAP_H-1,0);


//room list
global.roomList = ds_list_create();

//create map of factions and their feelings to the player
global.playerFaction = ds_map_create();
ds_map_add(global.playerFaction,"zealots","hostile");
ds_map_add(global.playerFaction,"slums","friendly");
ds_map_add(global.playerFaction,"pirates","hostile");


//create player inventory list
global.playerInventory = ds_list_create();

