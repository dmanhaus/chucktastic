// Connect the mic (adc analog to digital converter) to the output speaker (dac)
adc => Gain g => dac;  // Always put the Gain in between the adc and dac (FEEDBACK)

3::second => now;
<<< "done" >>>; 