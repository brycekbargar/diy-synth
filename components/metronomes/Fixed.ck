public class Fixed extends MetronomeBase
{
  fun void Start()
  {
    // Fixed to 80 bpm 1/8th notes because that is what I use most often
    Impulse beat => Dyno safety => dac;

    while(true)
    {
      .75 => beat.gain;
      1.0 => beat.next;
      (1/160) ::minute => now;

      .5 => beat.gain;
      1.0 => beat.next;
      (1/160) ::minute => now;
    }
  }
}
