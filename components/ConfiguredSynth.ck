public class ConfiguredSynth
{
  Event Done;

  fun void MakesNoise()
  {
    AppFactory.Instance().GetConfiguredOutput() @=> OutputBase output;
    spork ~ output.Start();

    AppFactory.Instance().GetConfiguredInput() @=> InputBase input;
    spork ~ input.Start();

    InputBase.Closed => now;
    Done.broadcast();
  }
}
