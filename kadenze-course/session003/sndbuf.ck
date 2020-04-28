// sound chain
SndBuf mySound => dac;

//directory of this file
me.dir() => string path;

// define the filename
"audio/snare_01.wav" => string filename;

path + filename => filename;

// open up the sound file
filename => mySound.read;

.5 => mySound.gain; // set volume
0 => mySound.pos; // sets playhead position to the beginning of the sound file
1.0 => mySound.rate; // default value (original speed)= 1.0, smaller value plays slower, higher value plays faster

1::second => now;