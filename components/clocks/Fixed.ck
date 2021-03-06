public class Fixed extends ClockBase
{
  fun void Start()
  {
    // Fixed to 60 bpm 1/8th notes because math is hard
    (60.0 / 120.0) ::second => dur timing;
    while(true)
    {
      timing => now;
      ClockActions.Downbeat();

      timing => now;
      ClockActions.Upbeat(2);
    }
  }
}
ObjectFactory.Register("Fixed", new Fixed);
