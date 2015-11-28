public class AlesisQ25 extends InputBase
{
  fun void Start()
  {
    MidiIn min;
    if (!min.open(0))
    {
      me.exit();
    }

    MidiControlActions.PitchBendSetTo(64);

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
        if(msg.data1 == 176)
        {
          if(msg.data2 == 1)
          {
            MidiControlActions.ModWheelSetTo(msg.data3);
          }
        }
        if(msg.data1 == 224)
        {
          MidiControlActions.PitchBendSetTo(msg.data3);
        }
      }
    }
  }
}
ObjectFactory.Register("AlesisQ25", new AlesisQ25);
