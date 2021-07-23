/// @description Insert description here
// You can write your code in this editor
if (isMoving == true) {
	x += speedX;
	y += speedY;
	
	moveTimer -= moveSpeed;
	if (moveTimer == 0) isMoving = false;
}