public class MtoF extends FrequencyStoreBase
{
  MidiNoteStore.Instance() @=> MidiNoteStore _noteStore;

  fun Frequency LastOn()
  {
    _noteStore.LastOn() @=> MidiNote note;
    if(note == null)
    {
      return null;
    }
    return Frequency.Create(
      Std.mtof(note.Number()),
      note.Velocity());
  }
  fun Frequency[] OnFrequencies()
  {
    _noteStore.OnNotes() @=> MidiNote onNotes[];

    Frequency onFrequencies[];
    for(0 => int i; i < onNotes.size(); i++)
    {
      onNotes[i] @=> MidiNote note;
      onFrequencies <<
        Frequency.Create(
          Std.mtof(note.Number()),
          note.Velocity());
    }

    return onFrequencies;
  }

  fun static void Configure()
  {
    if(_store == null)
    {
      MtoF store @=> _store;
      AppDispatcher.Instance()
        .Register(MtoFDispatchable.Create(store));
    }
  }
}

private class MtoFDispatchable extends DispatchableBase
{
  MtoF @ _store;

  fun static DispatchableBase Create(MtoF store)
  {
    MtoFDispatchable newDispatchable;
    store @=> newDispatchable._store;

    return newDispatchable;
  }

  fun void Handle(DispatchMessage message)
  {
    message.ActionType() => int actionType;

    if(actionType == Constants.MIDI_NOTE_ON ||
      actionType == Constants.MIDI_NOTE_OFF)
    {
      AppDispatcher.Instance().WaitFor(MidiNoteStore.Token());
      _store.EmitChange();
    }
  }
}
