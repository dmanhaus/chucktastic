// sound chain
SndBuf mySound => dac;

// create path to file
me.dir() + "/audio/snare_01.wav" => string filename;

// open soundfile
filename => mySound.read;

// find the number of samples in the sound file
mySound.samples() => int numSamples;

// infinite loop
while ( true )
{
  numSamples => mySound.pos;  // set playhead position
  -1.0 => mySound.rate; // make sample play backwards
  1::second => now;
}
