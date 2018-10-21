if (keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("S")) or keyboard_check(ord("W"))) {
    sprite_index = sPlayerWalk;
}
else {
    sprite_index = sPlayer;
}
draw_self();