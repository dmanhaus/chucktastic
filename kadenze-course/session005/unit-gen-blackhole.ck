// adc => Gain g => dac;  // NEVER Directly connect the adc to the dac, always put a controller in between
adc => Gain g => blackhole;

while ( true )  // infite time loop
{
  if (adc.last() > 0.25 ) // is it loud?
  {
    <<< "Loud!!!", adc.last() >>>;
  }
  1.0::samp => now;
}