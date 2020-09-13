// sound chain
SqrOsc clar => Envelope env => dac;
1.0::second => env.duration;  // control the timing of the rising and falling

1 => env.keyOn; // turns envelope on

2.0::second => now;

1 => env.keyOff; // turns envelope off

2.0::second => now;