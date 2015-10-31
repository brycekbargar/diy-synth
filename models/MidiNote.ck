public class MidiNote
{
  int _number;
  fun int GetNumber()
  {
    return _number;
  }

  fun static MidiNote Create(int number)
  {
    MidiNote newNote;
    number => newNote._number;
    return newNote;
  }

  0 => int _on;
  fun void TurnOn()
  {
    TurnOn(127);
  }
  fun void TurnOn(int velocity)
  {
    SetVelocity(velocity);
    1 => _on;
  }
  fun void TurnOff()
  {
    SetVelocity(0);
    0 => _on;
  }
  fun int IsOn()
  {
    return _on;
  }
  fun int IsOff()
  {
    return _on == 0;
  }

  0 => int _velocity;
  fun void SetVelocity(int velocity)
  {
    velocity => _velocity;
  }
  fun int GetVelocity()
  {
    return _velocity;
  }
}
