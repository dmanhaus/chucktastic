FreqCalc fc;

SinOsc note => dac;
0.075 => note.gain;

"A" => string noteName;

0 => note.gain;

// Play tonic
fc.get_frequency_for_note(noteName) => float tonic;
tonic => note.freq;
<<< "tonic:", noteName, tonic, "Hz" >>>;

// ["major_triad", "minor_triad", "diminished_triad", "augmented_triad", "suspended_fourth", "suspended_second", "added_ninth" , "major_triad", "diminished_seventh","minor_seventh", "minor_major_seventh"] @=> string chords[];
["m7", "7", "min7", "maj7"] @=> string chords[];

0.5 => float duration; 

for(0 => int i; i < chords.cap(); i++)
{
    chords[i] => string chordName;
    noteName + chordName => string noteChordName;
    <<< "Playing", noteChordName, "chord" >>>;
    fc.play_chord(tonic, fc.get_chord(chordName), duration);
    duration::second => now;
}

