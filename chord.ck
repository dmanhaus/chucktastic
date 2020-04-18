FreqCalc fc;

["major_triad", "minor_triad", "diminished_triad", "augmented_triad", "suspended_fourth", "suspended_second", "added_ninth" , "major_triad", "diminished_seventh","minor_seventh", "minor_major_seventh"] @=> string chords[];
// ["diminished_seventh"] @=> string chords[];

for(0 => int i; i < chords.cap(); i++)
{
    chords[i] => string chordName;
    <<< "Playing", noteName, chordName, "chord" >>>;
    fc.play_chord(tonic, fc.get_chord(chordName));
    1::second => now;
}

