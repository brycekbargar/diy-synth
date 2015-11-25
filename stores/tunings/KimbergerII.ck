public class KimbergerII extends FrequencyStoreBase
{
  3 => float _pitchBendStepMax;

  MidiNoteStore.Instance() @=> MidiNoteStore _noteStore;
  MidiControlStore.Instance() @=> MidiControlStore _controlStore;

  // Reference A * Ratio to Middle C
  (440.0 * (.5963)) => float _middleC;

  [1.0, // C
  (256.0/243), // C#
  (9.0/8), // D
  (32.0/27), // D#
  (5.0/4), // E
  (4.0/3), // F
  (45.0/32), // F#
  (3.0/2), // G
  (128.0/81), // G#
  1.677, // A
  (16.0/9), // A#
  (15.0/8)] // B
    @=> float _ratiosFromC[];

  fun Frequency _FrequencyFrom(MidiNote note)
  {
    note.Number() % 12 => int stepFromC;
    note.Number() / 12 => int octave;

    _middleC => float baseFrequency;
    if(octave < 5)
    {
      ((5 - octave) * 2) /=> baseFrequency;
    }
    if(octave > 5)
    {
      ((octave - 5) * 2) *=> baseFrequency;
    }

    _ratiosFromC[stepFromC] * baseFrequency => float frequency;

    return Frequency.Create(
      frequency,
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
      KimbergerII store @=> _store;
      AppDispatcher.Instance()
        .Register(KimbergerIIDispatchable.Create(store));
    }
  }
}

private class KimbergerIIDispatchable extends DispatchableBase
{
  KimbergerII @ _store;

  fun static DispatchableBase Create(KimbergerII store)
  {
    KimbergerIIDispatchable newDispatchable;
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
