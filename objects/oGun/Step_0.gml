// set position to player and point at mouse
x = oPlayer.x;
y = oPlayer.y;

image_angle = point_direction(x, y, mouse_x, mouse_y);

// fire bullets
firingdelay -= 1;
recoil = max(0, recoil-1);

if (mouse_check_button(mb_left)) && (firingdelay < 0) {
	recoil = 4;
	firingdelay = 5;
	
	// create a bullet
	with (instance_create_layer(x, y, "Bullet", oBullet)) {
		speed = 25;
		
		// "other" refers to the gun, not the bullet
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

// gun kickback
// "lengthdir(length, direction)" uses trigonometry to move object in a direction
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

// flip sprite from right to left 
if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;	
}