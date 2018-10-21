// key_right - key_left will be used for moving
// right is 1, left is -1
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

// set flip sprite left/right

// jumping
if (place_meeting(x, y + 1, oWall) && (key_jump)){
	verticalSpeed = -20;
}

// calculate movement direction
var move = key_right - key_left;
horizontalSpeed = move * walkSpeed;
verticalSpeed = verticalSpeed + playerGravity;

if (move < 0) {
	image_xscale = -1;	
} else if (move > 0) {
	image_xscale = 1;	
}

// check for collision
// place_meeting() is manual collision check

// HORIZONTAL
// moves as close as you can so you can stand flush against wall
// sign() returns 1 if positive, -1 if negative
if (place_meeting(x + horizontalSpeed, y, oWall)){
	while (!place_meeting(x + sign(horizontalSpeed), y, oWall)) {
		x += sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}

// x is built in, is this x coordinate
x += horizontalSpeed;

// VERTICAL
if (place_meeting(x, y + verticalSpeed, oWall)){
	while (!place_meeting(x, y + sign(verticalSpeed), oWall)) {
		y += sign(verticalSpeed);
	}
	verticalSpeed = 0;
}

// x is built in, is this x coordinate
y += verticalSpeed;