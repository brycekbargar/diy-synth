public class MetronomeFactory
{
  0 => static int _configuredMetronomeType;
  fun static void Configure(int metronomeType)
  {
    metronomeType => _configuredMetronomeType;
  }

  fun static MetronomeBase GetConfigured()
  {
    return GetMetronome(_configuredMetronomeType);
  }
  fun static MetronomeBase GetMetronome(int metronomeType)
  {
    if(metronomeType == MetronomeType.TunedPing)
    {
      return new TunedPing $ MetronomeBase;
    }

    return null;
  }
}
MetronomeFactory metronomeFactory;
