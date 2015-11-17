public class SimpleTriangle extends OutputBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _store;

  TriOsc _ugens[0];

  fun void Start()
  {
    Dyno safety
      => dac;

    while(true)
    {
      _store.OnChange => now;

      _store.OnNotes() @=> MidiNote onNotes[];
      onNotes.size() => int onNoteCount;

      while(onNoteCount > _ugens.size())
      {
        TriOsc newUgen
          => safety;
        _ugens << newUgen;
      }

      while(onNoteCount < _ugens.size())
      {
        _ugens[_ugens.size() - 1] =< safety;
        _ugens.popBack();
      }

      for(0 => int i; i < onNoteCount; i++)
      {
        _ugens[i] @=> TriOsc thisUgen;

        (1.0 / onNoteCount) => thisUgen.gain;
        Std.mtof(onNotes[i].Number()) => thisUgen.freq;
      }
    }
  }
}
