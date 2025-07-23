// Textbox variables 
textToShow = "This is a textbox."
textWidth = 450;
lineHeight = 28;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;
seqID = noone;

// Dismiss any visible prompts
scr_dismissPrompt(obj_prompt,0);

// Disable player control
global.playerControl = false;

// Play UI sound 
audio_play_sound(snd_pop01,1,0);
