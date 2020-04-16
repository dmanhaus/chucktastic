SqrOsc s => dac;
.075 => s.gain;

// array declaration
[ 54, 56, 62, 54, 48, 50, 52] @=> int A[]; 
[.5, .2, .4, .6, .5, .3, .4] @=> float notes[];   // This enables us to vary the duration of each note using the same index

// A.cap() is the number of elements (blocks) in array A
<<< A.cap() >>>;

// loop
for(0 => int i; i < A.cap(); i++)
{
  <<< i, A[i] >>>;  // print index and value of array A at index i
  Math.mtof(A[i]) => s.freq;
  notes[i]::second => now;
}