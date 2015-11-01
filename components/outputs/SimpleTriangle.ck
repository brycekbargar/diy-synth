public class SimpleTriangle extends OutputBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _store;

  TriOsc _ugens[0];

  fun void Start()
  {
    Dyno safety => dac;

    while(true)
    {
      MidiNoteStore.OnChange => now;

      _store.AllNotes() @=> MidiNote notes[];
      _ugens.size(notes.size() + 1);

      for(0 => int i; i < notes.size(); i++)
      {
        if(notes[i] == null)
        {
          null @=> _ugens[i];
        }
        else
        {
          TriOsc thisUgen => safety;
          0 => thisUgen.gain;
          Std.mtof(notes[i].Number()) => thisUgen.freq;
          thisUgen @=> _ugens[i];
        }
      }
    }
  }
}
