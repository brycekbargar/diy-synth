MetronomeFactory.GetConfigured() @=> MetronomeBase metronome;
if(metronome != null)
{
  spork ~ metronome.Start();
}

Synth theCoolSynth;
theCoolSynth.MakesNoise();
