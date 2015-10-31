public class MidiNoteStore
{
  static Event @ OnChange;
  new Event @=> OnChange;

  fun void EmitChange()
  {
    OnChange.broadcast();
  }

  AppDispatcher.Instance().Register(MidiNoteStoreDispatchable.Create(new MidiNoteStore));
}

private class MidiNoteStoreDispatchable extends DispatchableBase
{
  MidiNoteStore @ _store;

  fun static DispatchableBase Create(MidiNoteStore store)
  {
    MidiNoteStoreDispatchable newDispatchable;
    store @=> newDispatchable._store;

    return newDispatchable;
  }

  fun void Handle(DispatchMessage message) { }
}
