var _text;

// If player has control
if (global.playerControl) {
	// Near NPC
	if (nearbyNPC) {
		// If player does not have an item
		if (hasItem == noone || hasItem == undefined) {
			_text = nearbyNPC.myText;
			if (!instance_exists(obj_textbox)) {
				var iii = instance_create_depth(nearbyNPC.x,nearbyNPC.y-400,-10000,obj_textbox);
				iii.textToShow = _text;
			}
		}
	}

	// Near Item
	if (nearbyItem && !nearbyNPC) {
		// If player does not have an item
		if (hasItem == noone || hasItem == undefined) {
			global.playerControl = false;
			myState = playerState.pickingUp;
			image_index = 0;
			hasItem = nearbyItem;
			// Take into account weight of the item we're picking up
			carryLimit = hasItem.itemWeight * 0.1;
			// Change state of item we're picking up
			with (hasItem) {
				myState = itemState.taken;
			}
			// Play pickup sound
			audio_play_sound(snd_itemPickup, 1, 0);
		}
	}
	
	// Not Near Item or NPC
	if (!nearbyItem && !nearbyNPC) {
		// Put down an item
		if (hasItem != noone) {
			myState = playerState.puttingDown;
			image_index = 0;
			global.playerControl = false;
			// Change state of item we're carrying
			with (hasItem) {
				putDownY = obj_player.y + 5;
				myState = itemState.puttingBack;
			}
			// Play put-down sound
			audio_play_sound(snd_itemPutDown, 1, 0);
			// Reset item
			hasItem = noone;
		}
	}
	
}

