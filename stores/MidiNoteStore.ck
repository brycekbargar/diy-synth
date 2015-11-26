public class MidiNoteStore
{
  static Event @ OnChange;
  new Event @=> OnChange;
  fun void EmitChange()
  {
    OnChange.broadcast();
  }

  static DispatchToken @ _token;
  fun static string Token()
  {
    if(_token == null)
    {
      return "";
    }
    return _token.Value();
  }

  MidiNote @ _lastOn;
  fun MidiNote LastOn() { return _lastOn; }

  MidiNote @ _lastOff;
  fun MidiNote LastOff() { return _lastOff; }

  MidiNote _notes[0];
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

  fun void EnsureExists(int number)
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
    _notes[number] @=> _lastOn;
    _lastOn.TurnOn();
    null @=> _lastOff;
  }

  fun void TurnOff(int number)
  {
    _notes[number] @=> _lastOff;
    _lastOff.TurnOff();
    null @=> _lastOn;
  }

  static MidiNoteStore @ _store;
  fun static MidiNoteStore Instance()
  {
    if(_store == null)
    {
      new MidiNoteStore @=> _store;
      AppDispatcher.Instance()
        .Register(MidiNoteStoreDispatchable.Create(_store))
        @=> _token;
    }

    return _store;
  }
}
MidiNoteStore.Instance();

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

    if(actionType == Constants.MIDI_NOTE_ON ||
      actionType == Constants.MIDI_NOTE_OFF)
    {
      (message.Payload() $ MidiNotePayload).Number() => int number;
      _store.EnsureExists(number);

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
