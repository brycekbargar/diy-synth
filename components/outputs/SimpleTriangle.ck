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
      MidiNoteStore.OnChange => now;

      _store.AllNotes() @=> MidiNote notes[];
      if(_ugens.size() < notes.size() + 1)
      {
        _ugens.size(notes.size() + 1);
      }

      for(0 => int i; i < _ugens.size(); i++)
      {
        _ugens[i] @=> TriOsc thisUgen;
        if(thisUgen != null)
        {
          0 => thisUgen.gain;
        }

        if((notes.size() <= i && thisUgen != null) ||
          (notes.size() > i && notes[i] == null && thisUgen != null))
        {
          // Delete it!
          null @=> _ugens[i];
        }
        else if(notes.size() > i && notes[i] != null && thisUgen == null)
        {
          // Create it!
          TriOsc newUgen
            => safety;
          0 => newUgen.gain;
          Std.mtof(notes[i].Number()) => newUgen.freq;
          newUgen @=> _ugens[i];
        }
      }

      if(_ugens.size() >= notes.size())
      {
        _ugens.size(notes.size() + 1);
      }

      _store.OnNotes() @=> MidiNote onNotes[];
      onNotes.size() => int noteCount;
      for(0 => int i; i < onNotes.size(); i++)
      {
        _ugens[onNotes[i].Number()] @=> TriOsc thisUgen;
        if(thisUgen != null)
        {
          (1.0 / noteCount) => thisUgen.gain;
        }
      }
    }
  }
}
