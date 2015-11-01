public class AlesisQ25 extends InputBase
{
  fun void Start()
  {
    for(124 => int midiNote; midiNote > 0; midiNote--)
    {
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
        if(msg.data1 == 144)
        {
          MidiNoteActions.NoteOn(msg.data2);
        }
        if(msg.data1 == 128)
        {
          MidiNoteActions.NoteOff(msg.data2);
        }

        if(msg.data1 == 224)
        {
          InputBase.Closed.broadcast();
        }
      }
    }
  }
}
