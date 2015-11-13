public class TunedPing extends MetronomeBase
{
  fun void Start()
  {
    // Fixed to 60 bpm 1/8th notes because math is hard
    Impulse beat => ResonZ pitch => Dyno safety => dac;
    90 => pitch.Q;

    (60.0 / 120.0) ::second => dur timing;
    while(true)
    {
      2500 => pitch.freq;
      2500 => beat.next;
      timing => now;

      2000 => pitch.freq;
      2000 => beat.next;
      timing => now;
    }
  }
}
