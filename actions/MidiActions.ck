public class MidiActions
{
  fun static void Create(int number)
  {
    PayloadBase payload;
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(Constants.MIDI_NOTE_CREATE, payload));
  }
}
