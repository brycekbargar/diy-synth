public class Synth
{
  fun void MakesNoise()
  {
    for(0 => int midiNote; midiNote <= 120; midiNote++)
    {
      MidiNoteActions.Create(midiNote);
    }
  }
}
