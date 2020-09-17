// sound chain
ModalBar modal => NRev reverb => dac.left;
ModalBar modal2 => NRev reverb2 => dac.right;

// set reverb mix
.1 => reverb.mix;

// modalbar parameters
7 => modal.preset;
.9 => modal.strikePosition;

.1 => reverb2.mix;

// modalbar parameters
3 => modal2.preset;
.9 => modal2.strikePosition;

spork ~ one();
spork ~ two();
spork ~ tune();

while( true ) 1::second => now;

fun void one()
{
  while ( true )
  {

    // note!
    1 => modal.strike;
    // wait
    300::ms => now; 
    // note!
    .7 => modal.strike;
    // wait
    300::ms => now; 

    repeat( 6 )
    {
      // note!
      .5 => modal.strike;
      // wait
      100::ms => now; 
    }
  }
}

fun void two()
{
  while ( true )
  {
    // offset (phasing)
    150::ms => now;
    
    // note!
    1 => modal2.strike;
    // wait
    300::ms => now;
    // note!
    .75 => modal2.strike;
    // wait
    300::ms => now;
    // note!
    1 => modal2.strike;
    // wait
    300::ms => now;
    // note!
    .75 => modal2.strike;
    // wait
    300::ms => now;
  }
}

fun void tune()
{
  while ( true )
  {
    // update frequency
    84 + Math.sin( now / second * Math.PI * .25 ) * 2 => Std.mtof => modal.freq;

    // advance time (freq update rate)
    5::ms => now;

  }
}
