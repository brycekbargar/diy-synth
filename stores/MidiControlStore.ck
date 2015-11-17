public class MidiControlStore
{
  static Event @ OnChange;
  new Event @=> OnChange;
  fun void EmitChange()
  {
    OnChange.broadcast();
  }

  0 => int _modWheel;
  fun int ModWheel()
  {
    return _modWheel;
  }

  fun void Set(int type, int value)
  {
    if(type == MidiControlType.ModWheel)
    {
      value => _modWheel;
    }
  }

  static MidiControlStore @ _store;
  fun static MidiControlStore Instance()
  {
    if(_store == null)
    {
      new MidiControlStore @=> _store;
      AppDispatcher.Instance()
        .Register(MidiControlStoreDispatchable.Create(_store));
    }

    return _store;
  }
}
MidiControlStore.Instance();

private class MidiControlStoreDispatchable extends DispatchableBase
{
  MidiControlStore @ _store;

  fun static DispatchableBase Create(MidiControlStore store)
  {
    MidiControlStoreDispatchable newDispatchable;
    store @=> newDispatchable._store;

    return newDispatchable;
  }

  fun void Handle(DispatchMessage message)
  {
    message.ActionType() => int actionType;

    if(actionType == Constants.MIDI_CONTROL)
    {
      (message.Payload() $ MidiControlPayload) @=> MidiControlPayload payload;
      _store.Set(payload.Type(), payload.Value());
      _store.EmitChange();
    }
  }
}
