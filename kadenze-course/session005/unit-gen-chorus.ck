adc => Chorus chor => dac;  // Simple chorus
0.05 => chor.modDepth; // Depth of modulation 
0.5 => chor.modFreq; // Frequency of modulation in hertz

while( true )
{
  1.0::second => now;
}