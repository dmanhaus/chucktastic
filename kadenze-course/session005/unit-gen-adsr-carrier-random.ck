// sound chain
SinOsc mod => SinOsc car => ADSR env => dac;
(0.1::second, 0.01::second, 0.6, 0.2::second) => env.set; // Set Attack, Sustain, Decay, Release

10000.0 => mod.gain; // change vibrato
2 => car.sync; // set sync mode to Frequency Modulation (2)

0.125 => car.gain;

while ( true ) {
  Math.random2f(100.0,1000.0) => car.freq;
  Math.random2f(100.0,1000.0) => mod.freq;
  1 => env.keyOn;
  0.2::second => now;
  1 => env.keyOn;
  0.2::second => now;
}

2.0::second => now;q