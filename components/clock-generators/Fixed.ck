public class Fixed extends ClockGeneratorBase
{
  fun void Start()
  {
    // Fixed to 60 bpm 1/8th notes because math is hard
    (60.0 / 120.0) ::second => dur timing;
    while(true)
    {
      timing => now;
      // Up
      timing => now;
      // Down
    }
  }
}
