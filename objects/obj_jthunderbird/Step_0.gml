// Get Input 
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
jumpKeyPressed = keyboard_check_pressed(vk_space);

// Detect input for sprinting
if (keyboard_check(vk_shift)) {
    moveSpd = sprintSpd; // Switch to sprint speed if shift key is held down
} else {
    moveSpd = regularSpd; // Use regular speed if shift key is not held down
}

// Getting xspd and yspd
// xspd based on button presses
xspd = (rightKey - leftKey) * moveSpd;

// Apply gravity to the yspd
yspd += grav;

// Jump
if (jumpKeyPressed && (place_meeting(x, y+1, obj_tile1) || place_meeting(x, y+1, obj_forg_tile2))){
    yspd = jumpSpd;
}

// Collisions 
// X Collisions with obj_forg_tile2
if (place_meeting(x + xspd, y, obj_forg_tile2)){
    // Move player as close to the wall as possible 
    var _pixelCheck = sign(xspd);
    
    while (!place_meeting(x + _pixelCheck, y, obj_forg_tile2)){
        x += _pixelCheck;
    }
    
    // Set xspd to 0
    xspd = 0;
}

// X Collisions with obj_tile1
if (place_meeting(x + xspd, y, obj_tile1)){
    // Move player as close to the wall as possible 
    var _pixelCheck = sign(xspd);
    
    while (!place_meeting(x + _pixelCheck, y, obj_tile1)){
        x += _pixelCheck;
    }
    
    // Set xspd to 0
    xspd = 0;
}

// Y Collisions with obj_forg_tile2
if (place_meeting(x, y + yspd, obj_forg_tile2)){
    // Move player as close to the wall as possible 
    var _pixelCheck = sign(yspd);
    
    while (!place_meeting(x, y + _pixelCheck, obj_forg_tile2)){
        y += _pixelCheck;
    }
    
    // Set yspd to 0 
    yspd = 0;
}

// Y Collisions with obj_tile1
if (place_meeting(x, y + yspd, obj_tile1)){
    // Move player as close to the wall as possible 
    var _pixelCheck = sign(yspd);
    
    while (!place_meeting(x, y + _pixelCheck, obj_tile1)){
        y += _pixelCheck;
    }
    
    // Set yspd to 0 
    yspd = 0;
}

// Move the Player 
x += xspd;
y += yspd;


