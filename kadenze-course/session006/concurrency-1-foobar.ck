ModalBar one => dac.left;
ModalBar two => dac.right;

7 => one.preset;
4 => two.preset;
.9 => one.strikePosition => two.strikePosition;
60 => Std.mtof => one.freq;
64 => Std.mtof => two.freq;

fun void foo()
{
  while ( true )
  {
    // print
    <<< "foo!", "" >>>;
    // note!
    1 => one.strike;
    250::ms => now; // available time intervals are samp, ms, second, minute, hour, day, week
  }
}

// Spork the function foo() on a new shred (process/thread)
spork ~ foo();

fun void bar()
{
  // Now add bar while foo runs concurrently
  while ( true )
  {
    // print
    <<< "BARRRRRR!", "" >>>;
    //note 
    1 => two.strike;
    1::second => now; // available time intervals are samp, ms, second, minute, hour, day, week
  }
}

// Spork the function bar() on a new shred 
spork ~ bar();

// Infinite time loop
// Needed in order to keep the sporked shreds alive
// Sporked shreds terminate when their parent does and are cleaned up

while ( true )
{
  1::second => now; // available time intervals are samp, ms, second, minute, hour, day, week
}