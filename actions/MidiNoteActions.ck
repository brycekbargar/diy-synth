public class MidiNoteActions
{
  fun static void Create(int number)
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        Constants.MIDI_NOTE_CREATE,
        MidiNoteCreatePayload.From(number)));
  }
}
