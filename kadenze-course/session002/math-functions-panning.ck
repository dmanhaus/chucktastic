// Audio Panning
SinOsc s => dac.left; // Chuck a Sine Wave Oscilator that only play to the left speaker
SinOsc t => dac.right;

// set frequencies
220.35 => s.freq;
330.67 => t.freq;

// advance time
1::second => now;
