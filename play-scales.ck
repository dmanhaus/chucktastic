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

fun int[] get_scale( string name )
{
    int scaleName[0];
    // Assign integer index values to an associative array, with a string index to match to the "name" function argument 
    0 => scaleName["empty"];         // This index maps to an array containing one member, 0, which becomes the list returned when an invalid name is passed
    1 => scaleName["chromatic"];
    2 => scaleName["natural_major"];
    2 => scaleName["ionian_mode"];
    3 => scaleName["natural_minor"];
    4 => scaleName["harmonic_minor"];
    5 => scaleName["octatonic"];
    6 => scaleName["pentatonic"];
    7 => scaleName["dorian_mode"];
    8 => scaleName["phrygian_mode"];
    9 => scaleName["lydian_mode"];
    10 => scaleName["mixolydian_mode"];
    11 => scaleName["aeolian_mode"];
    12 => scaleName["locrian_mode"];
    
    // These arrays represent scales as a list of (integer) semitone intervals from the tonic 
    [ [ 0 ] ,                                          // 0, Default to Tonic (name not found) 
    [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ] ,     // 1, Chromatic
    [ 0, 2, 4, 5, 7, 9, 11, 12 ] ,                     // 2, Natural Major, Ionian mode 
    [ 0, 2, 3, 5, 7, 8, 10, 12 ] ,                     // 3, Natural Minor
    [ 0, 2, 3, 5, 7, 8, 11, 12 ] ,                     // 4, Harmonic Minor
    [ 0, 2, 3, 5, 6, 8, 9, 11, 12 ] ,                  // 5, Octatonic
    [ 0, 2, 4, 7, 9, 12 ] ,                            // 6, Pentatonic
    [ 0, 2, 3, 5, 7, 9, 10, 12],                       // 7, Dorian mode
    [ 0, 1, 3, 5, 7, 8, 10, 12 ],                      // 8, Phrygian mode 
    [ 0, 2, 4, 6, 7, 9, 11, 12 ],                      // 9, Lydian mode
    [ 0, 2, 4, 5, 7, 9, 10, 12 ],                      // 10, Mixolydian mode
    [ 0, 2, 3, 5, 7, 8, 10, 12 ],                      // 11, Aeolian mode
    [ 0, 1, 3, 5, 6, 8, 10, 12 ]                       // 12, Locrian mode
    ] @=> int scale [][];

    // Get the scale at the scaleName index passed in as the "name" function argument
    <<< "Playing", name, "scale" >>>;
    return scale[scaleName[name]];
}

261.63 => float tonic; // C4
<<< "tonic:", tonic >>>;

// play_scale(tonic, chromatic_scale);
play_scale(tonic, get_scale("locrian_mode"));
1::second => now; // rest
