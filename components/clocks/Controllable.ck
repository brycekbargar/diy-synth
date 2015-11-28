public class Controllable extends ClockBase
{
  MidiControlStore.Instance() @=> MidiControlStore _store;

  fun void Start()
  {
    0 => int tempo;
    Shred @ clock;
    while(true)
    {
      MidiControlStore.OnChange => now;
      if(_store.ModWheel() == tempo)
      {
        // No changes!
        continue;
      }

      if(clock != null)
      {
        clock.exit();
      }

      _store.ModWheel() => tempo;
      spork ~ Clock(tempo + 40) @=> clock;
    }
  }

  fun static void Clock(int tempo)
  {
    (60.0 / tempo) ::second => dur clock;
    while(true)
    {
      clock => now;
      ClockActions.Downbeat();
    }
  }
}
ObjectFactory.Register("Controllable", new Controllable);
