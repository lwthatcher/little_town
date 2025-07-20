// Game Variables
global.playerControl = true;

// Player States
enum playerState {
	idle,
	walking,
	pickingUp,
	carrying,
	carryIdle,
	puttingDown,
}

// Item States
enum itemState {
	idle,
	taken,
	used,
	puttingBack,
}

// Sequence States
enum seqState {
	notPlaying,
	waiting,
	playing,
	finished,
}

// Sequence Variables
sequenceState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;
