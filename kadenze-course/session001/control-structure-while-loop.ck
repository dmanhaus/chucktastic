SinOsc s => dac;

.075 => s.gain;

// while loop

// initialize variable i
20 => int i;

while( i < 400 )
{
    i => s.freq;
    <<< i >>>;
    0.01::second => now;
    
    // Increment i by a value of 1
    i++;
}
