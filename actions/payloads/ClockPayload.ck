public class ClockPayload extends PayloadBase
{
  int _subdivision;
  fun int Type() { return _subdivision; }

  fun static ClockPayload From(int subdivision)
  {
    ClockPayload payload;
    type => payload._subdivision;

    return payload;
  }
}
