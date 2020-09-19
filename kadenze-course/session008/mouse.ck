// human interface device
Hid hid;  // will represent the input device
HidMsg msg;   //  a message to convey data from the hid

// device number
2 => int device;  // 2 is the keyboard device, listed as one of three "unifying devices"

// try to open mouse, exit if fails
if (hid.openMouse( device ) == false) me.exit();
// print 
<<< "mouse ( device:", device, "):", hid.name(), "ready!" >>>;

// sound chain
SndBuf buffy => dac;
me.dir() + "audio/snare_01.wav" => buffy.read;
buffy.samples() => buffy.pos;

while ( true )
{
    // wait for event
    hid => now;
    
    // get event message
    while ( hid.recv( msg) )
    {
      if ( msg.isButtonDown() )
      {
        <<< "BUTTON DOWN!" >>>;
        // play
        0 => buffy.pos;
      }
      else if ( msg.isMouseMotion() )
      {
        <<< "MOUSE DELTA X:", msg.deltaX >>>;
        msg.deltaX / 20.0 => buffy.rate;  // change rate of playback
      }
    }
}