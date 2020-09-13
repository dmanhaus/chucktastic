// adc => JCRev rev => dac;  // basic reverb
adc => NRev rev => dac;  // best sounding, most complex reverb
0.05 => rev.mix;  // dry/wet mix

while( true )
{
  1.0::second => now;
}