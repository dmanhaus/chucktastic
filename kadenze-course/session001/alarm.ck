// define a time in the future for the alarm clock to sound
now + 10::second => time later;

// tick off seconds in the console monitor
while( now < later )
{
    // print out
    <<< "time left:", (later-now)/second >>>;
    // advance time
    1::second => now;
}

<<< "IT'S TIME!!!" >>>;

SinOsc bell => dac;
880 => bell.freq;
2::second => now;

/*
  - Chucking a duration to now advances ChucK time precisely by that amount
    while automatically suspending your code and letting sound generate
  
  - now will never move forward unless / until you manipulate it,
    so until you explicity advance time, you are actually working at a 
    single point in time.

  - Another way to think about it: ChucK waits, precisely until now 
    becomes the time you want to reach

  - There are no restrictions on how much time is advanced. That said, 
    it is not possible to negatively decrement time.
*/