ModalBar m => dac;

while ( true )
{
  Math.random2(0,8) => m.preset;   // Randomly choose the tone of the bar struck
  Math.random2f(200.0,1000.0) => m.freq; 
  1.0 => m.noteOn;
  0.1::second => now;
  // Math.random2f(0.05,0.3)::second => now;
}
