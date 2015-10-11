Dyno safety => dac;

MidiIn min;
if (!min.open(0))
{
  me.exit();
}

Osc ugens[0];
for(0 => int i; i < 122; i++)
{
  TriOsc thisUgen => safety;
  0 => thisUgen.gain;
  Std.mtof(i) => thisUgen.freq;
  ugens << thisUgen;
}

MidiMsg msg;
while(true)
{
  min => now;

  while(min.recv(msg))
  {
    <<< msg.data1, msg.data2, msg.data3 >>>;
    if(msg.data1 == 144)
    {
      turnOn(ugens, msg.data2);
    }
    if(msg.data1 == 128)
    {
      turnOff(ugens, msg.data2);
    }

    eq(ugens);
  }
}

fun void turnOn(Osc ugens[], int midiNote)
{
  .01 =>  ugens[midiNote].gain;
  <<< "turning " + ugens[midiNote].freq() +  " on!" >>>;
}
fun void turnOff(Osc ugens[], int midiNote)
{
  0 =>  ugens[midiNote].gain;
  <<< "turning " + ugens[midiNote].freq() +  " off!">>>;
}

fun void eq(Osc ugens[])
{
  0 => int onUgenCount;
  for(0 => int i; i < ugens.cap(); i++)
  {
    if(ugens[i].gain() > 0)
    {
      1 +=> onUgenCount;
    }
  }
  <<< "there are " + onUgenCount + " ugens!">>>;
  for(0 => int i; i < ugens.cap(); i++)
  {
    if(ugens[i].gain() > 0)
    {
      (1.0 / onUgenCount) => ugens[i].gain;
      <<< "equing " + ugens[i].freq() + " to " + ugens[i].gain() >>>;
    }
  }
}
