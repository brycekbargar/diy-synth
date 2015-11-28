ObjectFactory.UseDefault("o", "SimpleTriangle");
ObjectFactory.UseDefault("i", "AlesisQ25");
ObjectFactory.UseDefault("m", "TunedPing");
ObjectFactory.UseDefault("c", "Controllable");

ConfiguredSynth theCoolSynth;
spork ~ theCoolSynth.MakesNoise();
ConfiguredMetronome theCoolMetronome;
spork ~ theCoolMetronome.MakesNoise();

theCoolSynth.Done => now;
