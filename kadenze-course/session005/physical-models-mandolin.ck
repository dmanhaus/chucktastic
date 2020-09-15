// waveguide filter synthesis (modeling strings using delay lines)
Mandolin m => dac; // A mandolin is a model that consists of two strings

0.2 => m.pluckPos; // pick the position on the string where we pluck
1.0 => m.noteOn; // pluck the mandolin string

0.02 => m.stringDetune; // detune one of the strings from the other
0.7 => m.bodySize;  // .5 corresponds to the natural size of the mandolin body
500 => m.freq;


2.0::second => now;

