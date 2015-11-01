public class MidiNote
{
  int _number;
  fun int Number() { return _number; }

  fun static MidiNote Create(int number)
  {
    <<< "Creating" + number >>>;
    MidiNote newNote;
    number => newNote._number;
    return newNote;
  }

  0 => int _isOn;
  fun int IsOn() { return _isOn; }
  fun int IsOff() { return IsOn() == 0; }
  fun void TurnOn()
  {
    TurnOn(127);
  }
  fun void TurnOn(int velocity)
  {
    SetVelocity(velocity);
    1 => _isOn;
  }
  fun void TurnOff()
  {
    SetVelocity(0);
    0 => _isOn;
  }


  0 => int _velocity;
  fun int Velocity() { return _velocity; }
  fun void SetVelocity(int velocity) { velocity => _velocity; }
}
