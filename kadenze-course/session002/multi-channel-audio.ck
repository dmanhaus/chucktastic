// sound chain to multiple channels
SinOsc s => dac.chan(0); // Send a Sine wave osc to channel 0
SinOsc t => dac.chan(1);
SinOsc u => dac.chan(2);
SinOsc v => dac.chan(3);

// TODO: Determine how many channels are available on my mac