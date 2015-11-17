public class MidiControl
{
  int _type;
  fun int Type() { return _type; }
  int _value;
  fun int Value() { return _value; }

  fun static MidiControl Create(int type, int value)
  {
    MidiControl model;
    type => model._type;
    value => model._value;

    return model;
  }
}
