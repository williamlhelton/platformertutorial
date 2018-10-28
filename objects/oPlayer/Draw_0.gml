if (!place_meeting(x, y + 1, oWall)) {
	// sprite in air
	sprite_index = sPlayerJump;
	// how fast the animation should happen
	image_speed = 0;
	
	// determine if moving up or down
	if (sign(verticalSpeed) < 0) {
		image_index = 0;
	} else {
		image_index = 1;
		//sprite_index = sPlayerJump[1];
	}
} else {
	//sprite on ground
	image_speed = 1;
	if (keyboard_check(ord("D")) or keyboard_check(ord("A"))) {
	    sprite_index = sPlayerWalk;
	}
	else {
	    sprite_index = sPlayer;
	}	
}

// sprite facing left and right
if (horizontalSpeed != 0) {
	image_xscale = sign(horizontalSpeed);	
}

draw_self();