adc => Gain inGain;

Delay d[3]; // array of delay lines

// Patch the gain into the delay lines
inGain => d[0];
inGain => d[1];
inGain => d[2];

// design: every foot that sound must travel = 1ms of delay
0.06::second => d[0].max => d[0].delay;  // allocates delay memory
0.08::second => d[1].max => d[1].delay;  // allocates delay memory
0.10::second => d[2].max => d[2].delay;  // allocates delay memory

// design: modeling sound bouncing back off walls by patching the delay into itself
d[0] => d[0] => dac;  

// design: all sound decays naturally over time, set the gain less than 1
0.6 => d[0].gain => d[1].gain => d[2].gain; // feedback gain

while ( true )
{
  1.0::second => now;
}