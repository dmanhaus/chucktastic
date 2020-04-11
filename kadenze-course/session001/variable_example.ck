// Primitive Data Types: https://chuck.cs.princeton.edu/doc/language/type.html#prim

// sound network
SinOsc s => dac;

// store the value 261.63 into the float type variable named freq
261.63 => float freq;  // 261.63 is the frequency of middle-C

// variable for volume control
.075 => float vol;     

// set frequency
freq => s.freq;

// set volume
vol => s.gain;

// play a one second tone
1::second => now;