// sound chain
SinOsc mod => SinOsc car => ADSR env => dac;
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set; // Set Attack, Sustain, Decay, Release

100.0 => car.freq;
100.0 => mod.freq; // Set Vibrato frequency
10000.0 => mod.gain; // change vibrato
2 => car.sync; // set sync mode to Frequency Modulation (2)

0.125 => car.gain;


1 => env.keyOn; // turns envelope on

2.0::second => now;

1 => env.keyOff; // turns envelope off

2.0::second => now;