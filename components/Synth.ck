public class Synth
{
  fun void MakesNoise()
  {
    SimpleTriangle output;
    spork ~ output.Start();

    AlesisQ25 input;
    spork ~ input.Start();

    for(0 => int midiNote; midiNote <= 120; midiNote++)
    {
      now => now;
      MidiNoteActions.Create(midiNote);
    }

    InputBase.Closed => now;
  }
}
