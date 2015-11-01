public class Synth
{
  fun void MakesNoise()
  {
    SimpleTriangle output;
    spork ~ output.Start();

    AlesisQ25 input;
    spork ~ input.Start();

    InputBase.Closed => now;
  }
}
