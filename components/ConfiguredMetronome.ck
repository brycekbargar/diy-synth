public class ConfiguredMetronome
{
  fun void MakesNoise()
  {
    ClockGeneratorFactory.Instance().GetConfigured() @=> ClockGeneratorBase clockGenerator;
    if(clockGenerator != null)
    {
      spork ~ clockGenerator.Start();
    }

    MetronomeFactory.Instance().GetConfigured() @=> MetronomeBase metronome;
    if(metronome != null)
    {
      spork ~ metronome.Start();
    }

    Event e;
    e => now;
  }
}
