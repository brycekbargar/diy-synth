public class ClockActions
{
  fun static void Downbeat()
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        Constants.CLOCK_DOWN,
        ClockPayload.From(0)));
  }
  fun static void Upbeat(int subdivision)
  {
    AppDispatcher.Instance()
      .Dispatch(DispatchMessage.Create(
        Constants.CLOCK_UP,
        ClockPayload.From(subdivision)));
  }
}
