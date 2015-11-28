public class SimpleTriangle extends OutputBase
{
  FrequencyStore.Instance() @=> FrequencyStore _store;

  TriOsc _ugens[0];

  fun void Start()
  {
    Dyno safety
      => dac;

    while(true)
    {
      _store.OnChange => now;

      _store.OnFrequencies() @=> Frequency onFrequencies[];
      onFrequencies.size() => int onFrequencyCount;

      while(onFrequencyCount > _ugens.size())
      {
        TriOsc newUgen
          => safety;
        _ugens << newUgen;
      }

      while(onFrequencyCount < _ugens.size())
      {
        _ugens[_ugens.size() - 1] =< safety;
        _ugens.popBack();
      }

      for(0 => int i; i < onFrequencyCount; i++)
      {
        _ugens[i] @=> TriOsc thisUgen;

        (1.0 / onFrequencyCount) => thisUgen.gain;
        onFrequencies[i].Value() => thisUgen.freq;
      }
    }
  }
}
ObjectFactory.Register("SimpleTriangle", new SimpleTriangle);
