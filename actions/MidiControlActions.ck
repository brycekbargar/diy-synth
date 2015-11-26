public class MidiControlActions
{
  fun static void ModWheelSetTo(int value)
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        Constants.MIDI_CONTROL,
        MidiControlPayload.From(MidiControlType.ModWheel, value)));
  }

  fun static void PitchBendSetTo(int value)
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        Constants.MIDI_CONTROL,
        MidiControlPayload.From(MidiControlType.PitchBend, value)));
  }
}
