// Game Variables
global.playerControl = true;
global.gameOver = false;
global.gameStart = false;
townBGMvolume = audio_sound_get_gain(snd_townBGM);
townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);

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

// NPC State
enum npcState {
	normal,
	done,
}

// Sequence Variables
sequenceState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;

function npcsExist() {
	return instance_exists(obj_npc_baker) 
		&& instance_exists(obj_npc_teacher)
		&& instance_exists(obj_npc_grocer);
}

function npcsHaveState(state) {
	return obj_npc_baker.myState == state
		&& obj_npc_teacher.myState == state
		&& obj_npc_grocer.myState == state;
}
