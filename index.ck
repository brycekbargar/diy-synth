ConfiguredSynth theCoolSynth;
spork ~ theCoolSynth.MakesNoise();
ConfiguredMetronome theCoolMetronome;
spork ~ theCoolMetronome.MakesNoise();

theCoolSynth.Done => now;
