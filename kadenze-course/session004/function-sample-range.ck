// sound chain
SndBuf click => dac;

// read sound file
// me.dir() + "/audio/stereo_fx_01.wav" => click.read;
me.dir() + "/audio/love_today.wav" => click.read;

// set playhead to end of file so no initial sound
click.samples() => click.pos;

// function
fun void granularize( int steps )
{
  // samples/steps = grain size
  click.samples()/steps => int grain;
  // randomly set grain position
  Math.random2(0,click.samples() - grain) => click.pos;
  // advance time
  grain::samp => now;
}

fun void sample( int start, int steps )
{
  // samples/steps = grain size
  click.samples()/steps => int grain;
  // set grain position
  start => click.pos;
  // advance time
  grain::samp => now;
}

// MAIN PROGRAM
// infinite loop
sample(0, 1);