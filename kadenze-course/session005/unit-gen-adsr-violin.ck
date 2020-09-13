// sound chain
SinOsc vib => SawOsc viol => ADSR env => dac;
1.0::second => env.duration;  // control the timing of the rising and falling
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set; // Set Attack, Sustain, Decay, Release

660.0 => viol.freq;
6.0 => vib.freq; // Set Vibrato frequency
2 => viol.sync; // set sync mode to Frequency Modulation (2)

0.125 => viol.gain;
10.0 => vib.gain; // change vibrato

1 => env.keyOn; // turns envelope on

2.0::second => now;

1 => env.keyOff; // turns envelope off

2.0::second => now;