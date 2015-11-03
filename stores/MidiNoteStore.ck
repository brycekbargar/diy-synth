public class MidiNoteStore
{
  static Event @ OnChange;
  new Event @=> OnChange;

  MidiNote _notes[0];
  fun MidiNote[] AllNotes()
  {
    return _notes;
  }
  fun MidiNote[] OnNotes()
  {
    MidiNote onNotes[0];
    for(0 => int i; i < _notes.size(); i++)
    {
      if(_notes[i] != null && _notes[i].IsOn())
      {
        onNotes << _notes[i];
      }
    }

    return onNotes;
  }

  fun void EmitChange()
  {
    OnChange.broadcast();
  }

  fun void New(int number)
  {
    if(_notes.size() <= number)
    {
      _notes.size(number + 1);
    }

    if(_notes[number] == null)
    {
      MidiNote.Create(number) @=> _notes[number];
    }
  }
  fun void TurnOn(int number)
  {
    _notes[number].TurnOn();
  }
  fun void TurnOff(int number)
  {
    _notes[number].TurnOff();
  }

  static MidiNoteStore @ _store;
  fun static MidiNoteStore Instance()
  {
    if(_store == null)
    {
      new MidiNoteStore @=> _store;
      AppDispatcher.Instance()
        .Register(MidiNoteStoreDispatchable.Create(_store));
    }

    return _store;
  }
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

  fun void Handle(DispatchMessage message)
  {
    message.ActionType() => int actionType;

    if(actionType == Constants.MIDI_NOTE_CREATE ||
      actionType == Constants.MIDI_NOTE_ON ||
      actionType == Constants.MIDI_NOTE_OFF)
    {
      (message.Payload() $ MidiNotePayload).Number() => int number;

      if(actionType == Constants.MIDI_NOTE_CREATE)
      {
        _store.New(number);
      }
      if(actionType == Constants.MIDI_NOTE_ON)
      {
        _store.TurnOn(number);
      }
      if(actionType == Constants.MIDI_NOTE_OFF)
      {
        _store.TurnOff(number);
      }

      _store.EmitChange();
    }
  }
}
MidiNoteStore.Instance();
