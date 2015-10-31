public class MidiNoteCreatePayload extends PayloadBase
{
  int _number;
  fun int Number() { return _number; }

  fun static MidiNoteCreatePayload From(int number)
  {
    MidiNoteCreatePayload payload;
    number => payload._number;

    return payload;
  }
}
