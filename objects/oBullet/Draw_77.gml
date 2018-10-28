// destroy bullet if it hits wall
if (place_meeting(x, y, oWall)) {
	instance_destroy();
}