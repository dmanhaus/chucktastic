// A clarinet that understands MIDI noteOn!
class MyClarinet extends Clarinet
{
  fun float noteOn(int noteNum, float volume) {
    // Set frequency using MIDI note number
    Std.mtof(noteNum) => this.freq;
    // Call the inherited noteOn function
    volume => this.noteOn;
  }
}

MyClarinet myclar => dac;

myclar.noteOn(60, 1.0);
1.0 :: second => now;
