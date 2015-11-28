public class Controllable extends ClockGeneratorBase
{
  MidiControlStore.Instance() @=> MidiControlStore _store;

  fun void Start()
  {
    0 => int tempo;
    Shred @ clockGenerator;
    while(true)
    {
      MidiControlStore.OnChange => now;
      if(_store.ModWheel() == tempo)
      {
        // No changes!
        continue;
      }

      if(clockGenerator != null)
      {
        clockGenerator.exit();
      }

      _store.ModWheel() => tempo;
      spork ~ ClockGenerator(tempo + 40) @=> clockGenerator;
    }
  }

  fun static void ClockGenerator(int tempo)
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
