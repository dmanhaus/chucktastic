<<< "DJ Dmanhaus" >>>; 

fun float calc_harmonic_freq( float root, int halfSteps )
{
    // This function calculates the frequency of harmonics in the equal tempered scale
    // following fn = f0 * (a) power n
    // where f0 = the root, n = interval in half steps, a = the twelfth root of 2
    1.0594630943593 => float a; // The twelfth root of two 
    return root * Math.pow( a, halfSteps ); 
}

fun void play_scale( float tonic, int semitones[] )
{
    SinOsc note => dac;
    0.075 => note.gain;
    
    // loop through the semitones from the list provided
    for(0 => int i; i < semitones.cap(); i++)
    {
        // Calculate the frequency of the interval, and assign it to the sine osc frequency
        calc_harmonic_freq(tonic, semitones[ i ] ) => float interval => note.freq;
        <<< "interval:", i, "degrees:", semitones[i], "freq:", interval >>>;
        
        // Play the interval
        .5::second => now;
    }
    0 => note.gain;
}

261.63 => float tonic; // C4
<<< "tonic:", tonic >>>;

// These arrays represent scales as integer semitones
[ 0, 2, 4, 5, 7, 9, 11, 12 ] @=> int natural_major_scale_semitones[]; 
[ 0, 2, 3, 5, 7, 8, 10, 12 ] @=> int natural_minor_scale_semitones[]; 

// Play a major scale
play_scale(tonic, natural_major_scale_semitones);
1::second => now; // rest

// Play a minor scale
play_scale(tonic, natural_minor_scale_semitones);