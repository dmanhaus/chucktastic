// sound chain
SndBuf snare => dac;

// load sound file
me.dir() + "/audio/snare_01.wav" => snare.read;
// set playhead to end to no initial sound 
snare.samples() => snare.pos;

// recursive function
fun int drumRoll ( int index )
{
  <<< index >>>;
  if( index >= 1 ) // conditional expression goes here
  {
     // play sound for duration of index
     0 => snare.pos;
     index::ms => now;
     // call drumRoll while reducing the index
     return drumRoll(index-1);
  }
  else if ( index == 0)
  {
     return 0;
  }
}

// MAIN PROGRAM
// call recursive function drumRoll
drumRoll(60);