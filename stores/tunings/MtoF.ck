public class MtoF extends FrequencyStoreBase
{
  3 => float _pitchBendStepMax;

  MidiNoteStore.Instance() @=> MidiNoteStore _noteStore;
  MidiControlStore.Instance() @=> MidiControlStore _controlStore;

  // fn = f0 * (a)^n
  Math.pow(2, 1.0/12) => float _a;
  fun Frequency _FrequencyFrom(MidiNote note)
  {
    Std.mtof(note.Number()) => float f0;

    (_controlStore.PitchBend() - 64)
    / (64.0 / _pitchBendStepMax)
      => float n;

    f0 * Math.pow(_a, n) => float fn;

    return Frequency.Create(
      fn,
      note.Velocity());
  }

  fun Frequency LastOn()
  {
    _noteStore.LastOn() @=> MidiNote note;
    if(note == null)
    {
      return null;
    }
    return _FrequencyFrom(note);
  }
  fun Frequency[] OnFrequencies()
  {
    _noteStore.OnNotes() @=> MidiNote onNotes[];

    Frequency onFrequencies[0];
    for(0 => int i; i < onNotes.size(); i++)
    {
      onNotes[i] @=> MidiNote note;
      onFrequencies << _FrequencyFrom(note);
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

    if(actionType == Constants.MIDI_CONTROL)
    {
      AppDispatcher.Instance().WaitFor(MidiControlStore.Token());
      _store.EmitChange();
    }
  }
}
