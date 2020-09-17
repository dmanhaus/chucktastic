// drums.ck
// sound chain
SndBuf hihat => dac;

// read audio file
me.dir(-1) + "/audio/hihat_01.wav" => hihat.read;

// loop
while ( true )
{
  Math.random2f(0.1,0.3) => hihat.gain;
  Math.random2f(.9,1.2) => hihat.rate;
  (Math.random2f(1,2) * 0.2)::second => now; // add swing feel
  0 => hihat.pos; // play the file
}

