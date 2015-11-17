public class ConfiguredMetronome
{
  fun void MakesNoise()
  {
    ClockGeneratorFactory.GetConfigured() @=> ClockGeneratorBase clockGenerator;
    if(clockGenerator != null)
    {
      spork ~ clockGenerator.Start();
    }

    MetronomeFactory.GetConfigured() @=> MetronomeBase metronome;
    if(metronome != null)
    {
      spork ~ metronome.Start();
    }

    Event e;
    e => now;
  }
}
