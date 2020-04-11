SinOsc s => dac;  // send a sine wave to the dac

0.6 => s.gain; // set the volume of the sine wave (range is from 0 to 1)
220 => s.freq; // set the frequency of the sine wave in hertz (20 to 20000 is the human range of hearing)
1::second => now; // set the duration of the sine wave to one second

