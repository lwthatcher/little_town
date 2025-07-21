// Control Sequences 
switch sequenceState {
	case seqState.playing: {
		global.playerControl = false;
	} break;
	case seqState.finished: {
		// Remove Sequence 
		if (layer_sequence_exists(curSeqLayer,curSeqID)) {
			layer_sequence_destroy(curSeqID);
		}
		// Restore control to player, reset
		global.playerControl = true;
		sequenceState = seqState.notPlaying;
		curSeqID = noone;
	} break;
}
