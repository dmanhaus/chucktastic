Noise n => Pan2 p => dac;

.075 => n.gain;

while( true )
{
  Math.sin(now/1::second*2*pi) => p.pan;  // pan from left to right following a sine wave
  10::ms => now;
}