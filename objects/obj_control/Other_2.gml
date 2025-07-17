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
