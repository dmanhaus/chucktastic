SqrOsc s => dac;

Math.srandom(23); // seed the rng with the value 134

// infinite loop
while (true)
{
  Math.random2(20,500) => int i; // generate random freq int
  Math.random2f(.075, .2) => float v; // generate random volume float
  <<< i, v >>>; // print variables
  i => s.freq; // set frequency
  v => s.gain; // set gain
  .5::second => now;
}