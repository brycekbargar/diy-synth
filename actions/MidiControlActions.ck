public class MidiControlActions
{
  fun static void ModWheelActivated(int value)
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        Constants.MIDI_CONTROL,
        MidiControlPayload.From(MidiControlType.ModWheel, value)));
  }
}
