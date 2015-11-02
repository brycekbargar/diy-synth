public class SimpleStrings extends OutputBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _store;

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
        0 => int noteFound;
        for(0 => int j; j < knownOnNotes.size(); j++)
        {
          if(knownOnNotes[j] == onNotes[i])
          {
            1 => noteFound;
          }
        }
        if(noteFound)
        {
          continue;
        }

        for(0 => int i; i < onNotes.size(); i++)
        {
          200 ::samp => delay.delay;
          1 => adsr.keyOn;
        }
      }

      onNotes @=> knownOnNotes;
    }
  }
}
