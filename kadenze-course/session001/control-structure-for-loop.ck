SinOsc s => dac;

// for loop

 // initialize a loop counter at i with a range from 0 to 4 with an increment of 1
for(20 => int i; i < 400; i++)
{
    <<< i >>>;
    i => s.freq;
    0.1::second => now;   
}   