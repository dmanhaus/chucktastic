// conversion example

// volume as integer
1 => int volume;
// MIDI note as float
45.6 => float MIDI_note;

// convert using Std.ftoi()
volume => float f_volume;
Std.ftoi( MIDI_note) => int i_MIDI_note;

<<< f_volume, i_MIDI_note >>>;