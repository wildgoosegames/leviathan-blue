/// @description Insert description here
// You can write your code in this editor
if (isMoving == false) {
		target_x = (x)/CELL_W;
		target_y = (y-CELL_H)/CELL_H;
		if check_grid_collision(id,target_x,target_y) == false {
		isMoving = true;
		moveTimer = CELL_W;
		speedX = 0;
		speedY = -moveSpeed;
	}
}
