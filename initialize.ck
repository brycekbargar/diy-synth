// Load all the Flux things!
Machine.add(me.dir()+"framework/PayloadBase.ck");
Machine.add(me.dir()+"framework/DispatchMessage.ck");
Machine.add(me.dir()+"framework/DispatchableBase.ck");
Machine.add(me.dir()+"framework/Dispatcher.ck");

// Domain
Machine.add(me.dir()+"models/MidiNote.ck");
Machine.add(me.dir()+"models/MidiControlType.ck");
Machine.add(me.dir()+"models/MidiControl.ck");


// Plumbing
Machine.add(me.dir()+"dispatcher/AppDispatcher.ck");
Machine.add(me.dir()+"constants/Constants.ck");
Machine.add(me.dir()+"actions/payloads/MidiNotePayload.ck");
Machine.add(me.dir()+"actions/payloads/MidiControlPayload.ck");
Machine.add(me.dir()+"actions/MidiNoteActions.ck");
Machine.add(me.dir()+"actions/MidiControlActions.ck");

// State
Machine.add(me.dir()+"stores/MidiNoteStore.ck");
Machine.add(me.dir()+"stores/MidiControlStore.ck");

// Component Pluming
Machine.add(me.dir()+"components/inputs/InputBase.ck");
Machine.add(me.dir()+"components/outputs/OutputBase.ck");
Machine.add(me.dir()+"components/clock-generators/ClockGeneratorBase.ck");
Machine.add(me.dir()+"components/metronomes/MetronomeBase.ck");
Machine.add(me.dir()+"components/inputs/InputTypes.ck");
Machine.add(me.dir()+"components/outputs/OutputTypes.ck");
Machine.add(me.dir()+"components/clock-generators/ClockGeneratorTypes.ck");
Machine.add(me.dir()+"components/metronomes/MetronomeTypes.ck");

// Components
Machine.add(me.dir()+"components/inputs/AlesisQ25.ck");
Machine.add(me.dir()+"components/inputs/HIDKeyboard.ck");
Machine.add(me.dir()+"components/outputs/SimpleTriangle.ck");
Machine.add(me.dir()+"components/outputs/SimpleStrings.ck");
Machine.add(me.dir()+"components/clock-generators/Fixed.ck");
Machine.add(me.dir()+"components/metronomes/TunedPing.ck");

// Factories
Machine.add(me.dir()+"components/inputs/InputFactory.ck");
Machine.add(me.dir()+"components/outputs/OutputFactory.ck");
Machine.add(me.dir()+"components/clock-generators/ClockGeneratorFactory.ck");
Machine.add(me.dir()+"components/metronomes/MetronomeFactory.ck");

// Synths
Machine.add(me.dir()+"components/Synth.ck");

// Go!
// (...why is this language such shit?)
me.dir()+"configurator.ck" => string configurator;
for( int i; i < me.args(); i++ )
{
  (configurator + ":" + me.arg(i)) => configurator;
}
Machine.add(configurator);
Machine.add(me.dir()+"index.ck");
