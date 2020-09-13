Impulse imp => ResonZ filt => dac;
800.0 => filt.freq;
400 => filt.Q;

while ( true )
{
  200.0 => imp.next; // generate 1 for one sample
  Math.random2f(500,2000) => filt.freq;
  Math.random2f(0.05,0.02)::second => now;  
}

2.0::second => now;
