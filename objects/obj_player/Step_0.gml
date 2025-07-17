// @description player movement code

// Check keys for movement
if (global.playerControl)
{
	moveRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
	moveUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
	moveLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
	moveDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
}
else
{
	moveRight = 0;
	moveUp = 0;
	moveLeft = 0;
	moveDown = 0;
}

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// If Idle
if (vx == 0 && vy == 0)
{ 
	myState = playerState.idle;
}
// If moving
if (vx != 0 || vy != 0)
{ 
	// Object environment collisions
	if !collision_point(x+vx,y,obj_par_environment,true,true){ x += vx; }
	if !collision_point(x,y+vy,obj_par_environment,true,true) { y += vy; }
	
	// Change direction based on movement
	if (vx > 0) { dir = 0; }
	if (vx < 0) { dir = 2; }
	if (vy > 0) { dir = 3; }
	if (vy < 0) { dir = 1; }

	// Set state
	myState = playerState.walking;
	
	// Move audio listener with player
	audio_listener_set_position(0,x,y,0);
}

// Check for collisions with NPCs
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_npc,false,true);
if nearbyNPC
{
	// Play greeting sound
	if (!hasGreeted)
	{
		if !(audio_is_playing(snd_greeting01))
		{
			audio_play_sound(snd_greeting01, 1, 0);
			hasGreeted = true;
		}
	}
	// Pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined)
	{
		npcPrompt = scr_showPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y-450);	
	}
}
else
{
	// Reset greeting
	if (hasGreeted)
	{
		hasGreeted = false;
	}
	// Get rid of prompt
	scr_dismissPrompt(npcPrompt, 0);
}

// Check for collisions with Items
nearbyItem = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_item,false,false);
if nearbyItem
{
	// Pop up prompt
	if (itemPrompt == noone || itemPrompt == undefined)
	{
		itemPrompt = scr_showPrompt(nearbyItem, nearbyItem.x, nearbyItem.y-300);
	}
}
else
{
	// Get rid of prompt
	scr_dismissPrompt(itemPrompt, 1);
}

// Auto-choose Sprite based on state and direction
sprite_index = playerSpr[myState][dir];

// Depth sorting
depth =-y;
