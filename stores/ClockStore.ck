public class ClockStore
{
  static Event @ OnChange;
  new Event @=> OnChange;
  fun void EmitChange()
  {
    OnChange.broadcast();
  }

  Clock @ _lastClock;
  fun Clock LastClock() { return _lastClock; }

  fun void Down()
  {
    0 => int lastSubdivision;
    if(_lastClock != null)
    {
      _lastClock.Subdivision() => lastSubdivision;
    }
    Clock.CreateDownbeat(lastSubdivision) @=> _lastClock;
  }
  fun void Up(int subdivision)
  {
    Clock.CreateUpbeat(subdivision) @=> _lastClock;
  }

  static ClockStore @ _store;
  fun static ClockStore Instance()
  {
    if(_store == null)
    {
      new ClockStore @=> _store;
      AppDispatcher.Instance()
        .Register(ClockStoreDispatchable.Create(_store));
    }

    return _store;
  }
}
ClockStore.Instance();

private class ClockStoreDispatchable extends DispatchableBase
{
  ClockStore @ _store;

  fun static DispatchableBase Create(ClockStore store)
  {
    ClockStoreDispatchable newDispatchable;
    store @=> newDispatchable._store;

    return newDispatchable;
  }

  fun void Handle(DispatchMessage message)
  {
    message.ActionType() => int actionType;

    if(actionType == Constants.CLOCK_DOWN)
    {
      _store.Down();
      _store.EmitChange();
    }
    if(actionType == Constants.CLOCK_UP)
    {
      (message.Payload() $ ClockPayload) @=> ClockPayload payload;
      _store.Up(payload.Subdivision());
      _store.EmitChange();
    }
  }
}
