public class SimpleStrings extends OutputBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _store;
  second / samp => static float _sampleRate;


  fun void Start()
  {
    Noise noise => ADSR adsr => DelayA delay => Dyno safety => dac;
    delay => OneZero lowPass => delay;
    adsr.set(.002 ::second, .002 ::second, 0, .1 ::second);

    MidiNote knownOnNotes[0];
    while(true)
    {
      MidiNoteStore.OnChange => now;

      _store.OnNotes() @=> MidiNote onNotes[];

      MidiNote newNotes[0];
      for(0 => int i; i < onNotes.size(); i++)
      {
        onNotes[i] @=> MidiNote thisNote;
        0 => int noteFound;
        for(0 => int j; j < knownOnNotes.size(); j++)
        {
          if(knownOnNotes[j].Number() == thisNote.Number())
          {
            1 => noteFound;
          }
        }
        if(noteFound == 0)
        {
          newNotes << thisNote;
        }
      }

      for(0 => int i; i < newNotes.size(); i++)
      {
        Std.mtof(newNotes[i].Number()) => float frequency;
        (_sampleRate / frequency - .5) ::samp => delay.delay;
        1 => adsr.keyOn;
      }

      onNotes @=> knownOnNotes;
    }
  }
}
