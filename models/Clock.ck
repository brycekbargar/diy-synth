public class Clock
{
  int _subdivision;
  fun int Subdivision() { return _subdivision; }

  int _isDownbeat;
  fun int IsDownbeat() { return _isDownbeat; }
  fun int IsUpbeat() { return _isDownbeat != 1; }


  fun static Clock CreateDownbeat(int subdivision)
  {
    return Clock.Create(subdivision, 1);
  }
  fun static Clock CreateUpbeat(int subdivision)
  {
    return Clock.Create(subdivision, 0);
  }
  fun static Clock Create(int subdivision, int isDownbeat)
  {
    Clock newClock;
    subdivision => newClock._subdivision;
    isDownbeat => newClock._isDownbeat;
    return newClock;
  }
}
