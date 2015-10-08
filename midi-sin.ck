SinOsc sineOscillator => dac;
0 => sineOscillator.gain;

MidiIn m          bvin;
if (!min.open(0))
{
  me.exit();
}

MidiMsg msg;
while(true)
{
  min => now;

  while(min.recv(msg))
  {
    <<< msg.data1, msg.data2, msg.data3 >>>;
    Std.mtof( msg.data2 ) => float newFreq;
    if(msg.data1 == 144)
    {
      .5 => sineOscillator.gain;
      Std.mtof( msg.data2 ) => sineOscillator.freq;
    }
    if(msg.data1 == 128 && newFreq == sineOscillator.freq())
    {
      0 => sineOscillator.gain;
    }
  }
}
