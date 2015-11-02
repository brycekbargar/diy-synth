public class Synth
{
  fun void MakesNoise()
  {
    SimpleTriangle output;
    spork ~ output.Start();

    InputFactory.GetConfigured() @=> InputBase input;
    spork ~ input.Start();

    InputBase.Closed => now;
  }
}
