public class TunedPing extends MetronomeBase
{
  ClockStore.Instance() @=> ClockStore _store;

  fun void Start()
  {
    Impulse down
      => ResonZ pitch
      => Dyno safety
      => dac;
    Impulse up
      => pitch
      => safety
      => dac;
    90 => pitch.Q;

    while(true)
    {
      ClockStore.OnChange => now;

      if(_store.LastClock().IsDownbeat())
      {
        2500 => pitch.freq;
        2500 => down.next;
      }
      if(_store.LastClock().IsUpbeat())
      {
        2000 => pitch.freq;
        2000 => up.next;
      }
    }
  }
}
