// sound chain
SndBuf2 mySound => dac;

// read the file
me.dir() + "/audio/stereo_fx_01.wav" => string filename;

// open the file
filename => mySound.read;

while( true )
{
  Math.random2f(.6,1.0) => mySound.gain;
  Math.random2f(.2,1.8) => mySound.rate;
  0 => mySound.pos; // set playhead
  5::second => now;
}