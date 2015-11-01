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
        notes[i] @=> MidiNote thisNote;
        _ugens[i] @=> TriOsc thisUgen;

        if(thisNote == null && thisUgen != null)
        {
          0 => thisUgen.gain;
          null @=> _ugens[i];
        }
        else if(thisNote != null && thisUgen == null)
        {
          TriOsc newUgen => safety;
          0 => newUgen.gain;
          Std.mtof(thisNote.Number()) => newUgen.freq;
          newUgen @=> _ugens[i];
        }

        if(thisNote != null &&
          thisUgen != null)
        {
          if(thisNote.IsOn() && thisUgen.gain() == 0)
          {
            .01 => thisUgen.gain;
          }
          else if(thisNote.IsOff() && thisUgen.gain() > 0)
          {
            0 => thisUgen.gain;
          }
        }
      }

      0 => int onUgenCount;
      for(0 => int i; i < _ugens.size(); i++)
      {
        if(_ugens[i] != null && _ugens[i].gain() > 0)
        {
          1 +=> onUgenCount;
        }
      }
      for(0 => int i; i < _ugens.size(); i++)
      {
        if(_ugens[i] != null && _ugens[i].gain() > 0)
        {
          (1.0 / onUgenCount) => _ugens[i].gain;
        }
      }
    }
  }
}
