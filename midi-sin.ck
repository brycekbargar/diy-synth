Dyno safety => dac;

MidiIn min;
if (!min.open(0))
{
  me.exit();
}

SinOsc ugens[88];
for(0 => int i; i < ugens.cap(); i++)
{
  ugens[i] => safety;
  0 => ugens[i].gain;
  Std.mtof(i) => ugens[i].freq;
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

fun void turnOn(SinOsc ugens[], int midiNote)
{
  .01 =>  ugens[midiNote].gain;
  <<< "turning " + ugens[midiNote].freq() +  " on!" >>>;
}
fun void turnOff(SinOsc ugens[], int midiNote)
{
  0 =>  ugens[midiNote].gain;
  <<< "turning " + ugens[midiNote].freq() +  " off!">>>;
}

fun void eq(SinOsc ugens[])
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
