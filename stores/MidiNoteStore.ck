public class MidiNoteStore
{
  static Event @ OnChange;
  new Event @=> OnChange;

  MidiNote _notes[0];
  fun MidiNote[] AllNotes()
  {
    return _notes;
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
    if(message.ActionType() == Constants.MIDI_NOTE_CREATE)
    {
      message.Payload() $ MidiNoteCreatePayload @=> MidiNoteCreatePayload payload;
      _store.New(payload.Number());
      _store.EmitChange();
    }
  }
}

MidiNoteStore.Instance();
