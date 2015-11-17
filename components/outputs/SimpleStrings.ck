public class SimpleStrings extends OutputBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _store;
  second / samp => static float _sampleRate;

  fun void Start()
  {
    Noise noise
      => ADSR adsr
      => DelayA delay
      => Dyno safety
      => dac;
    delay
      => OneZero lowPass
      => delay;
    adsr.set(.002 ::second, .002 ::second, 0, .1 ::second);

    while(true)
    {
      _store.OnChange => now;

      _store.LastOn() @=> MidiNote newNote;
      if(newNote == null)
      {
        continue;
      }

      Std.mtof(newNote.Number()) => float frequency;
      (_sampleRate / frequency - .5) ::samp => delay.delay;
      1 => adsr.keyOn;
    }
  }
}
