// sound chain
SinOsc s => dac;

// function
fun float halfGain ( float originalGain )
{
  return (originalGain*.5);
}

// remember that .gain() is a method that is part of SinOsc()
<<< "Full Gain:", s.gain() >>>;

1::second => now;

// call the function
halfGain(s.gain()) => s.gain;

<<< "Half Gain:", s.gain() >>>;

1::second => now;