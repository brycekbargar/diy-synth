public class ConfiguredMetronome
{
  fun void MakesNoise()
  {
    AppFactory.Instance().GetConfiguredClock() @=> ClockBase clock;
    if(clock != null)
    {
      spork ~ clock.Start();
    }

    AppFactory.Instance().GetConfiguredMetronomeVoice() @=> MetronomeVoiceBase metronome;
    if(metronome != null)
    {
      spork ~ metronome.Start();
    }

    Event e;
    e => now;
  }
}
