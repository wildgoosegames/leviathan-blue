

if (isMoving == true) {
	x += speedX;
	y += speedY;
	
	moveTimer -= moveSpeed;
	if (moveTimer == 0) isMoving = false;
}