public class ConfiguredMetronome
{
  fun void MakesNoise()
  {
    AppFactory.Instance().GetConfiguredClockGenerator() @=> ClockGeneratorBase clockGenerator;
    if(clockGenerator != null)
    {
      spork ~ clockGenerator.Start();
    }

    AppFactory.Instance().GetConfiguredMetronome() @=> MetronomeBase metronome;
    if(metronome != null)
    {
      spork ~ metronome.Start();
    }

    Event e;
    e => now;
  }
}
