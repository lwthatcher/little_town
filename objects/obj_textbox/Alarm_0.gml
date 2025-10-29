// Return control to player if no Sequence to load 
if (sequenceToShow == noone) { 
global.playerControl = true; 
} 

// Create Sequence if appropriate
if (sequenceToShow != noone) { 
	// Play NPC Sequence
	seqID = scr_playSequence(sequenceToShow, seqID);
}

// Destroy me 
instance_destroy(); 