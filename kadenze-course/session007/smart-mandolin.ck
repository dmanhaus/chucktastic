// Four mando strings
class MandoPlayer {

  // Make an array of four mandolin strings and connect them up
  Mandolin m[4];
  m[0] => JCRev rev => Gain master => dac;
  m[1] => rev;
  m[2] => rev;
  m[3] => rev;
  0.25 => rev.gain;
  0.02 => rev.mix;

  // set all four string frequencies in one function
  fun void freqs(float gStr, float aStr, float dStr, float eStr)
  {
    m[0].freq(gStr);
    m[1].freq(aStr);
    m[2].freq(dStr);
    m[3].freq(eStr);
  }

  // set all four string notes in one function
  fun void notes(int gNote, int aNote, int dNote, int eNote)
  {
    m[0].freq(Std.mtof(gNote));
    m[1].freq(Std.mtof(aNote));
    m[2].freq(Std.mtof(dNote));
    m[3].freq(Std.mtof(eNote));
  }

  // damp all string by amount
  // 0.0 = lots of damping, 1.0 = no damping
  fun void damp(float amount)
  {
    for (0 => int i; i < 4; i++)
    {
      amount => m[i].stringDamping;
    }
  }

  // a few named chords to illustrate the behavior
  fun void chord(string which) {                   // (7) Chords by name.
      if (which == "G") this.notes(55,62,71,79);   // (8) G Chord is G3, D4, B4, G5.
      else if (which == "C") this.notes(55,64,72,79);
      else if (which == "D") this.notes(57,62,69,78);
      else <<< "I don't know this chord: ", which >>>;
  }

  // roll a chord from lowest note to highest at rate
  fun void roll(string chord, dur rate) 
  {                               // (9) Chord roll (arpeggiate) function.
      this.chord(chord);          // (10) Sets chord by string using MandoPlayer .chord function.
      for (0 => int i; i < 4; i++) {
          1 => m[i].noteOn;       // (11) Plays notes one at a time...
          rate => now;            // (12) ...with rate duration between.
      }
  } 

  fun void strum(int note, dur howLong) 
  {                                      // (13) Strumming function (tremolo).
      int whichString;
      if (note < 62) 0 => whichString;      // (14) Figures out which string to strum.
      else if (note < 69) 1 => whichString;
      else if (note < 76) 2 => whichString;
      else 3 => whichString;
      Std.mtof(note) => m[whichString].freq; // (15) Sets frequency.
      now + howLong => time stop;            // (16) Time to stop strumming...
      while (now < stop) {                   // (17) ...do it until you get to that time.
          Std.rand2f(0.5,1.0) => m[whichString].noteOn;  // (18) Somewhat random volume.
          Std.rand2f(0.06,0.09) :: second => now;       // (19) Somewhat random time.
      }
  }
}

MandoPlayer m;

// and declare some data for chording and strumming
["G","C","G","D","D","D","D","G"] @=> string chords[]; // (2) Array of string chord names
[0.4,0.4,0.4,0.1,0.1,0.1,0.1,0.01] @=> float durs[];
[79,81,83] @=> int strums[];                           // (3) Array of things to strum

// counter to iterate through the arrays
0 => int i;

// roll the basic chords, reading through the arrays
while (i < chords.cap()) {        // (4) ...through whole chord name array
    m.roll(chords[i],durs[i] :: second); // (5) Rolls each chord
    i++;
}

// now strum a few notes
0 => i;
while (i < strums.cap()) {          // (6) Strums through the array of strums
    m.strum(strums[i++], 1.0 :: second);
}

// then end up with a big open G chord
m.damp(1.0);                 // (7) Lets strings ring a long time
m.roll("G", 0.02 :: second); // (8) Rolls a chord
2.0 :: second => now;

// damp it to silence, letting it ring a little
m.damp(0.01);                // (9) Damps strings at the end
1.0 :: second => now;
