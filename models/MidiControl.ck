public class MidiControl
{
  int _type;
  fun int Type() { return _type; }
  int _value;
  fun int Value() { return _value; }

  fun static MidiControl Create(int type, int value)
  {
    _type = type;
    _value = value;
  }
}
