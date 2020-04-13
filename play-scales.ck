<<< "DJ Dmanhaus" >>>; 

fun float calc_harmonic_freq( float root, int halfSteps )
{
    // This function calculates the frequency of harmonics in the equal tempered scale
    // following fn = f0 * (a) power n
    // where f0 = the root, n = interval in half steps, a = the twelfth root of 2
    1.0594630943593 => float a; // The twelfth root of two 
    return root * Math.pow( a, halfSteps ); 
}

fun void play_scale( float tonic, int notes[] )
{
    SinOsc note => dac;
    0.075 => note.gain;
    
    // loop through the notes from the list provided
    for(0 => int i; i < notes.cap(); i++)
    {
        // Calculate the frequency of the interval, and assign it to the sine osc frequency
        calc_harmonic_freq(tonic, notes[ i ] ) => float interval => note.freq;
        <<< "interval:", i, "degrees:", notes[i], "freq:", interval >>>;
        
        // Play the interval
        .5::second => now;
    }
    0 => note.gain;
}

261.63 => float tonic; // C4
<<< "tonic:", tonic >>>;

// These arrays represent scales as a list of (integer) half-step intervals from the tonic 
[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ] @=> int chromatic_scale[]; 
[ 0, 2, 4, 5, 7, 9, 11, 12 ] @=> int natural_major_scale[]; 
[ 0, 2, 3, 5, 7, 8, 10, 12 ] @=> int natural_minor_scale[]; 
[ 0, 2, 3, 5, 6, 8, 9, 11, 12 ] @=> int octatonic_scale[];
[ 0, 2, 4, 7, 9, 12 ] @=> int pentatonic_scale[];

<<< "chromatic scale" >>>;
play_scale(tonic, chromatic_scale);
1::second => now; // rest

<<< "major scale" >>>;
play_scale(tonic, natural_major_scale);
1::second => now; // rest

<<< "minor scale" >>>;
play_scale(tonic, natural_minor_scale);
1::second => now; // rest

<<< "octatonic scale" >>>;
play_scale(tonic, octatonic_scale);
1::second => now; // rest

<<< "pentatonic scale" >>>;
play_scale(tonic, pentatonic_scale);
1::second => now; // rest
