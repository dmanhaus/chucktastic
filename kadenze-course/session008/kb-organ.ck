// human interface device
Hid hid;  // will represent the keyboard
HidMsg msg;   //  a message to convey data from the hid

// device number
2 => int device;  // 2 is the keyboard device, listed as one of three "unifying devices"

// try to open keyboard, exit if fails
if (hid.openKeyboard( device ) == false) me.exit();
// print 
<<< "keyboard:", hid.name(), " ready!" >>>;

// sound chain
BeeThree organ => JCRev reverb => dac;

// sound parameters
.05 => reverb.mix;

while ( true )
{
    // wait for event
    hid => now;
    
    // get event message
    while ( hid.recv( msg) )
    {
        // check
        if ( msg.isButtonDown() )
        {
          <<< "BUTTON DOWN:", msg.ascii >>>;
          msg.ascii => Std.mtof => float freq;
          if ( freq > 20000 ) continue;

          // set the frequency
          freq => organ.freq;
          // sound the note
          1 => organ.noteOn;

          80::ms => now;
        }
        else // should be a button up event
        {
          <<< "BUTTON UP:", msg.ascii >>>;
          1 => organ.noteOff;
        }
    }
}