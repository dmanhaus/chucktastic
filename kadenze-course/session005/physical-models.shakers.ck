Shakers s => dac;

// for( 0 => int i; i < 23; i++)  // loop through the 23 different presets of shakers
// {
//  i => s.preset;
//  1.0 => s.noteOn;
//  1.0::second => now; 
//}

while ( true )
{
  Math.random2f(0.0,128.0) => s.objects; // objects sets the number of objects inside the shaker
  Math.random2f(0.0,1.0) => s.decay; // control the amount of dampening
  1.0 => s.energy;  // add energy to shake the shaker without resetting the decay
  1.0::second => now; 
}