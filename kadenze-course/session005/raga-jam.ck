// Raga Jam

// sound chain for Sitar
Sitar sitar => Gain sitarGain => Gain master => dac;
sitarGain => Gain sitarFeedback => Delay delay => sitarGain;

// drums
Shakers shaker => master;

// drone
VoicForm singerDrones[4];  // make four voices
NRev droneRev => master; 
for( 0 => int i; i < singerDrones.cap(); i++ )
{
  singerDrones[i] => droneRev;
  .5 / singerDrones.cap() => singerDrones[i].gain;
}

// global variables
[62, 62, 65, 67, 69, 70, 72, 74] @=> int raga[];  // The list of midi notes to play
[26, 38, 45, 50] @=> int drones[]; // The list of midi notes to drone/sing

// timing parameter
.2 => float beattime;

// sitar feedback parameters
beattime::second => delay.max;
beattime::second => delay.delay;
.75 => sitarFeedback.gain;

// singer parameters (drone)
.5 => droneRev.mix;
for ( 0 => int i; i < singerDrones.cap(); i++)
{
  .02 => singerDrones[i].vibratoGain;
  "lll" => singerDrones[i].phoneme;
  Std.mtof(drones[i]) => singerDrones[i].freq;
}

// MAIN PROGRAM

// drone solo
5::second => now;

// raga loop
while ( true )
{
  // time variation
  Math.random2(1,3) => int factor;

  // loop
  for( 0 => int i; i < raga.cap(); i++ )
  {
    // sitar control
    Std.mtof(raga[Math.random2(0,raga.cap() - 1)]) => sitar.freq; // play each note of the raga
    sitar.noteOn(Math.randomf());

    // drum control
    Math.random2(1,2) => shaker.preset;
    Math.random2f(60.0,128.0) => shaker.objects;
    Math.random2f(.8,1.0) => shaker.decay;
    shaker.noteOn(Math.random2f(0.0,4.0));

    // advance time
    beattime::second * factor => now;
  }
}
