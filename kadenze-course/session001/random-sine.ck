SinOsc foo => dac;

// .075 is a gentle gain level with the room speaker output set to 29 dB 
.075 => foo.gain;  // Set the volume of the SinOsc (range is 0 - 1, 1 = full volume)

while ( true )
{
  Math.random2f(30,1000) => foo.freq;
  125::ms => now; // available time intervals are samp, ms, second, minute, hour, day, week
}