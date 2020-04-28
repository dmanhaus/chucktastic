// sound chain
SndBuf mySound => Pan2 p => dac;

//directory of this file
me.dir() => string path;

// define the filename
"audio/snare_01.wav" => string filename;

path + filename => filename;

// open up the sound file
filename => mySound.read;

while ( true )
{
  Math.random2f(.2,.8) => mySound.gain;  // set volume at random between .2 and .8
  Math.random2f(.2,1.8) => mySound.rate; // set rate at random
  Math.random2f(-1.0,1.0) => p.pan;      // set pan at random
  0 => mySound.pos;
  100::ms => now;
}