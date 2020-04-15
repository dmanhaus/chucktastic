// sound chain
SinOsc s => Pan2 p => dac;  // Pan2 is a panning object for controllable stereo Range is -1 to 1

// initialize pan position value
1.0 => float panPosition;

// loop until pan moves from one side to the other
while ( panPosition > -1.0)
{
  panPosition => p.pan;  // set pan value
  <<< panPosition >>>;
  panPosition - .01 => panPosition;  // decrement the pan position each loop
  .01::second => now;
}

// hard pan
1.0 => p.pan;
1::second => now;

-1.0 => p.pan;
1::second => now;

