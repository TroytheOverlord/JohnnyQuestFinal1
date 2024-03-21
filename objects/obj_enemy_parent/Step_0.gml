hsp = dir * move_speed;
vsp += grav;

// Horizontal Collision
if(place_meeting(x + hsp, y, obj_wall)){
    while(!place_meeting(x + sign(hsp), y, obj_wall)){
        x += sign(hsp);
    }
    hsp = 0;
	
	dir *= -1;
}

// Vertical Collision
if(place_meeting(x, y + vsp, obj_wall)){
    while(!place_meeting(x, y + sign(vsp), obj_wall)){
        y += sign(vsp);
    }
    vsp = 0;
}

// Enemy Collision 
if(place_meeting(x, y, obj_jthunderbird)){
	if(obj_jthunderbird.y < y-16){
		with(obj_jthunderbird) vsp = - jumpSpd;
		instance_destroy();
	}
	
	else{
		game_restart();
	}
}