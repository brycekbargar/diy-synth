public class MidiNote
{
  int _number;
  fun int Number() { return _number; }

  int _velocity;
  fun int Velocity() { return _velocity; }
  fun int Velocity(int velocity) { velocity => _velocity; }

  int _isOn;
  fun int IsOn() { return _isOn; }
  fun int IsOff() { return IsOn() == 0; }

  fun static MidiNote Create(int number)
  {
    MidiNote newNote;
    number => newNote._number;
    return newNote;
  }

  fun void TurnOn()
  {
    TurnOn(127);
  }
  fun void TurnOn(int velocity)
  {
    Velocity(velocity);
    1 => _isOn;
  }

  fun void TurnOff()
  {
    Velocity(0);
    0 => _isOn;
  }
}
