public class MidiNotePayload extends PayloadBase
{
  int _number;
  fun int Number() { return _number; }

  fun static MidiNotePayload From(int number)
  {
    MidiNotePayload payload;
    number => payload._number;

    return payload;
  }
}
