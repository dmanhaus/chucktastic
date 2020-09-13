PulseOsc p => dac;
0.075 => p.gain;

while ( true )
{
  Math.random2f(0.01,0.05) => p.width;
  0.1::second => now;
  if( Math.random2(0,1) == 1 ) // conditional expression goes here
  {
     84 => p.freq;
  }
  else
  {
     100 => p.freq;
  }
}