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
    // <<< "Getting", name, "scale" >>>;
    return scale[scaleName[name]];
}

fun void play_chord( float tonic, int notes[] )
{
    SinOsc n1 => dac;
    SinOsc n2 => dac;
    SinOsc n3 => dac;

    0.075 => n1.gain;
    0.075 => n2.gain;
    0.075 => n3.gain;

    calc_harmonic_freq(tonic, notes[0]) => n1.freq;
    calc_harmonic_freq(tonic, notes[1]) => n2.freq;
    calc_harmonic_freq(tonic, notes[2]) => n3.freq;

    1::second => now;
    0 => n1.gain;
    0 => n2.gain;
    0 => n3.gain;
}

fun int[] get_chord( string name)
{
   int chordName[0];
   0 => chordName["empty"];
   1 => chordName["major_triad"];
   2 => chordName["minor_triad"];

   [ [ 0 ] ,                // 0, Default to Tonic (no name found)
   [ 0, 4, 7],              // 1, Major Triad
   [ 0, 3, 7]               // 2, Minor Triad
   ] @=> int chord [][];

   return chord[chordName[name]];    
}

fun float get_frequency_for_note( string note )
{
    ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G","G#"] @=> string notes[];
    0 => int interval;
    // Get the index of the interval matching the note provided
    for(0 => int i; i < notes.cap(); i++)
    {
        // <<< i, note, notes[i], notes[i] == note >>>;
        if( notes[ i ] == note ) 
        {
           <<< notes[ i ] >>>;
           i => interval;
        }
    }

    get_scale("chromatic") @=> int chromatic[];

    // We start from A4 and then find the frequency of the target tonic by relation using the get_scale function 
    440.00 => float A4;   

    calc_harmonic_freq(A4, chromatic[interval]) => float frequency; 
    // <<< "tonic frequency", frequency >>>;
    return frequency;
}

SinOsc note => dac;
0.075 => note.gain;

"G" => string noteName;

// Play tonic
get_frequency_for_note(noteName) => float tonic;
tonic => note.freq;
<<< "tonic:", noteName, tonic, "Hz" >>>;

2::second => now;
0 => note.gain;

1::second => now; // rest

// Play scale
// "chromatic" => string scaleName;
"natural_major" => string scaleName;  
// "natural_minor" => string scaleName;  
// "harmonic_minor" => string scaleName;
// "octatonic" => string scaleName;
// "pentatonic" => string scaleName;
// "dorian_mode" => string scaleName;
// "phrygian_mode" => string scaleName;
// "lydian_mode" => string scaleName;
// "mixolydian_mode" => string scaleName;
// "aeolian_mode" => string scaleName;
// "locrian_mode" => string scaleName;

<<< "Playing", scaleName, "scale" >>>; 
play_scale(tonic, get_scale(scaleName));

"major_triad" => string chordName;
<<< "Playing", noteName, chordName, "chord" >>>;

play_chord(tonic, get_chord(chordName));

"minor_triad" => chordName;
<<< "Playing", noteName, chordName, "chord" >>>;

play_chord(tonic, get_chord(chordName));