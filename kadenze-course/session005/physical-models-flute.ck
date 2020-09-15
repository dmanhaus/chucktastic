Flute f => dac; 

330 => f.freq;

while (true) 
{
  1.0 => f.noteOn;   // start blowing with random blowing pressure
  Math.random2f(0.1,1.0) => f.jetDelay; // change the embouchure model the propagation time of the breathß
  0.2::second => now;

  1 => f.noteOff;

  0.5::second => now;
}
