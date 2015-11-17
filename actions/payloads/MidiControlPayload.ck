public class MidiControlPayload extends PayloadBase
{
  int _type;
  fun int Type() { return _type; }
  int _value;
  fun int Value() { return _value; }

  fun static MidiControlPayload From(int type, int value)
  {
    MidiControlPayload payload;
    type => payload._type;
    value => payload._value;

    return payload;
  }
}
