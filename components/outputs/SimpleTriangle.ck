public class SimpleTriangle extends OutputBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _store;

  fun void Start()
  {
    while(true)
    {
      _store.OnChange => now;
    }
  }
}
