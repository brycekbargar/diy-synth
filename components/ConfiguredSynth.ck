public class ConfiguredSynth
{
  Event Done;

  fun void MakesNoise()
  {
    OutputFactory.GetConfigured() @=> OutputBase output;
    spork ~ output.Start();

    InputFactory.GetConfigured() @=> InputBase input;
    spork ~ input.Start();

    InputBase.Closed => now;
    Done.broadcast();
  }
}
