TriOsc chord[3];
Gain master => dac;
for ( 0 => int i; i < chord.cap(); i++)
{
  // use array to chuck unit generator to master
  chord[i] => master;
  1.0/chord.cap() => chord[i].gain;
}

// function
fun void playChord( int root, string quality, float length)
{
  // function will make major or minor chords
  // root
  Std.mtof(root) => chord[0].freq;

  // third
  if( quality == "major" ) // conditional expression goes here
  {
     Std.mtof(root + 4) => chord[1].freq;
  }
  else if(quality == "minor")
  {
     Std.mtof(root + 3) => chord[1].freq;
  }
  else
  {
    <<< "Must specify 'major' or 'minor'" >>>;
  }

  // fifth above root
  Std.mtof(root + 7) => chord[2].freq;

  length::ms => now;
}

// MAIN PROGRAM
// infinite loop
// while ( true )
// {
//   playChord(Math.random2(60,72), "minor", 250);
//   playChord(Math.random2(60,72), "major", 500);
// }

for (0 => int octave; octave < 11; octave + 1 => octave)
{
  for (0 => int root; root <= 11; root + 1 => root)
  {
    root + (12 * octave) => int midiNote;
    <<< midiNote >>>;
    if(midiNote <= 127)
    {
      playChord(midiNote, "minor", 250);
    }
  }
}