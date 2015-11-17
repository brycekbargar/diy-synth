public class Frequency
{
  float _value;
  fun float Value() { return _value; }

  0 => int _velocity;
  fun int Velocity() { return _velocity; }

  fun static Frequency Create(float value, int velocity)
  {
    Frequency newFrequency;
    value => newFrequency._value;
    velocity => newFrequency._velocity;
    
    return newFrequency;
  }
}
