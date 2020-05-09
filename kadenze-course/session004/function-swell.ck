SinOsc s => dac;

// global variables
[60,62,63,65,63,64,65,58,57] @=> int A[];

fun void swell (float begin, float end, float grain)
{
  for ( begin => float j; j < end; j + grain => j)
  {
    j => s.gain;
    .01::second => now;
  }

  // swell down
  for ( end => float j; j > begin; j - grain => j)
  {
    j => s.gain;
    .01::second => now;
  }
}

// MAIN PROGRAM
// loop
for ( 0 => int i; i < A.cap(); i++)
{
  Std.mtof(A[i]) => s.freq;
  swell(.4, .9,.03);
  .1::second => now;
}