public class AlesisQ25 extends InputBase
{
  fun void Start()
  {
    for(124 => int midiNote; midiNote > 0; midiNote--)
    {
      now => now;
      MidiNoteActions.Create(midiNote);
    }

    MidiIn min;
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
        if(msg.data1 == 224)
        {
          InputBase.Closed.broadcast();
        }
      }
    }
  }
}
