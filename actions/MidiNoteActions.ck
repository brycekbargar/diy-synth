public class MidiNoteActions
{
  fun static void NoteOn(int number)
  {
    Dispatch(Constants.MIDI_NOTE_ON, number);
  }

  fun static void NoteOff(int number)
  {
    Dispatch(Constants.MIDI_NOTE_OFF, number);
  }

  fun static void Dispatch(int action, int number)
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        action,
        MidiNotePayload.From(number)));
  }
}
