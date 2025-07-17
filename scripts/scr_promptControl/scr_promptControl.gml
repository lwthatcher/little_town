/// @description Displays a prompt for the provided object.
function scr_showPrompt(_object, _x, _y){
	if (instance_exists(_object)) {
		if (!instance_exists(obj_textbox) && !instance_exists(obj_prompt)) {
				var iii = instance_create_depth(_x, _y, -10000, obj_prompt);
				return iii;
		}
	}
}

/// @description Dismisses a a displayed prompt
function scr_dismissPrompt(_whichPrompt,_toReset) {
	if (_whichPrompt != undefined) {
		if (instance_exists(_whichPrompt)) {
			// Tell prompt object to fade out
			with (_whichPrompt) {
				fadeMe = "fadeOut";
			}
			// Reset appropriate prompt variable
			if (instance_exists(obj_player)) {
				with (obj_player) {
					switch _toReset {
						// Reset NPC prompt
						case 0: npcPrompt = noone;
						break;
					}
				}
			}
		}
	}
}
