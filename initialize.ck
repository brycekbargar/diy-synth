// Load all the Flux things!
Machine.add(me.dir()+"framework/PayloadBase.ck");
Machine.add(me.dir()+"framework/DispatchMessage.ck");
Machine.add(me.dir()+"framework/DispatchableBase.ck");
Machine.add(me.dir()+"framework/DispatchToken.ck");
Machine.add(me.dir()+"framework/Dispatcher.ck");
0 :: second => now;

// Configuration
// (...why is this language such shit?)
"" => string args;
for( int i; i < me.args(); i++ )
{
  (":" + me.arg(i)) +=> args;
}
Machine.add(me.dir()+"configuration/ObjectFactory.ck");
Machine.add(me.dir()+"configuration/Configurator.ck" + args);

0 :: second => now;
// Domain
Machine.add(me.dir()+"models/MidiNote.ck");
Machine.add(me.dir()+"models/MidiControlType.ck");
Machine.add(me.dir()+"models/MidiControl.ck");
Machine.add(me.dir()+"models/Clock.ck");
Machine.add(me.dir()+"models/Frequency.ck");
0 :: second => now;

// Flux stuffs
Machine.add(me.dir()+"dispatcher/AppDispatcher.ck");
Machine.add(me.dir()+"constants/Constants.ck");
Machine.add(me.dir()+"actions/payloads/MidiNotePayload.ck");
Machine.add(me.dir()+"actions/payloads/MidiControlPayload.ck");
Machine.add(me.dir()+"actions/payloads/ClockPayload.ck");
Machine.add(me.dir()+"actions/MidiNoteActions.ck");
Machine.add(me.dir()+"actions/MidiControlActions.ck");
Machine.add(me.dir()+"actions/ClockActions.ck");
0 :: second => now;

// State
Machine.add(me.dir()+"stores/MidiNoteStore.ck");
Machine.add(me.dir()+"stores/MidiControlStore.ck");
Machine.add(me.dir()+"stores/ClockStore.ck");
Machine.add(me.dir()+"stores/FrequencyStore.ck");
0 :: second => now;

// Component Plumbing
Machine.add(me.dir()+"components/plumbing/InputBase.ck");
Machine.add(me.dir()+"components/plumbing/OutputBase.ck");
Machine.add(me.dir()+"components/plumbing/MetronomeBase.ck");
Machine.add(me.dir()+"components/plumbing/ClockGeneratorBase.ck");
Machine.add(me.dir()+"components/plumbing/AppFactory.ck");
0 :: second => now;

// Components
Machine.add(me.dir()+"components/inputs/AlesisQ25.ck");
Machine.add(me.dir()+"components/inputs/HIDKeyboard.ck");
Machine.add(me.dir()+"components/outputs/SimpleTriangle.ck");
Machine.add(me.dir()+"components/outputs/SimpleStrings.ck");
Machine.add(me.dir()+"components/clock-generators/Fixed.ck");
Machine.add(me.dir()+"components/clock-generators/Controllable.ck");
Machine.add(me.dir()+"components/metronomes/TunedPing.ck");
0 :: second => now;

// Synths
Machine.add(me.dir()+"components/ConfiguredMetronome.ck");
Machine.add(me.dir()+"components/ConfiguredSynth.ck");
0 :: second => now;

// Go!
Machine.add(me.dir()+"index.ck");
0 :: second => now;
