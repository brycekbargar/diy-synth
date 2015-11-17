public class HIDKeyboard extends InputBase
{
  fun void Start()
  {
    Hid hi;
    if (!hi.openKeyboard(0))
    {
      me.exit();
    }

    HidMsg msg;
    while(true)
    {
      hi => now;

      while(hi.recv(msg))
      {
        msg.key + 45 => int midiNumber;
        if(midiNumber > 180)
        {
          midiNumber / 2 => midiNumber;
        }

        MidiNoteActions.NoteOn(midiNumber);
        spork ~ DelayedOff(.25 ::second, midiNumber);
      }
    }
  }

  fun void DelayedOff(dur delayTime, int number)
  {
    delayTime => now;
    MidiNoteActions.NoteOff(number);
  }
}
