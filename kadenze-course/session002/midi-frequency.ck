// MIDI range is between 0 and 127
TriOsc s => dac;
0.075 => s.gain;

// This example plays a chromatic scale
for( 0 => int i; i <= 127; i++ )
{
  // The Standard Library has a "mtof" or "Midi to Frequency" function
  // This function converts a midi number to a frequency
  Std.mtof(i) => float Hz; // MIDI to hertz
  <<< i, Hz >>>;
  Hz => s.freq;
  200::ms => now;
}
