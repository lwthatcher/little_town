// @description player movement code

// Check keys for movement 
moveRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
moveUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
moveLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
moveDown = keyboard_check(vk_down) or keyboard_check(ord("S"));

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// If Idle
if (vx == 0 && vy == 0)
{ 
	// Change idle Sprite based on last direction 
	switch dir
	{ 
		case 0: sprite_index = spr_player_idle_right; break; 
		case 1: sprite_index = spr_player_idle_up; break; 
		case 2: sprite_index = spr_player_idle_left; break; 
		case 3: sprite_index = spr_player_idle_down; break; 
	}
} 
// If moving
if (vx != 0 || vy != 0)
{ 
	if !collision_point(x+vx,y,obj_par_environment,true,true){ x += vx; }
	if !collision_point(x,y+vy,obj_par_environment,true,true) { y += vy; }
}

// Change walking sprite based on direction
if (vx > 0)
{
	sprite_index = spr_player_walk_right;
	dir = 0;
}
if (vx < 0)
{
	sprite_index = spr_player_walk_left;
	dir = 2;
}
if (vy > 0)
{
	sprite_index = spr_player_walk_down;
	dir = 3;
}
if (vy < 0)
{
	sprite_index = spr_player_walk_up;
	dir = 1;
}

// Check for collisions with NPCs
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_npc,false,true);
if nearbyNPC
{
	show_debug_message("player has found an NPC!");
}
else
{
	//show_debug_message("No NPCs found :(");
}

// Depth sorting
depth =-y;
