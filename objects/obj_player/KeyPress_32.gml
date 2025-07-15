var _text;

// Create a textbox if NPC is nearby
if (nearbyNPC) {
	_text = nearbyNPC.myText;
	if (!instance_exists(obj_textbox)) {
		var iii = instance_create_depth(x,y,-10000,obj_textbox);
		iii.textToShow = _text;
	}
}
