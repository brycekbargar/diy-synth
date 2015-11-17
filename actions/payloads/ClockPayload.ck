public class ClockPayload extends PayloadBase
{
  int _subdivision;
  fun int Subdivision() { return _subdivision; }

  fun static ClockPayload From(int subdivision)
  {
    ClockPayload payload;
    subdivision => payload._subdivision;

    return payload;
  }
}
