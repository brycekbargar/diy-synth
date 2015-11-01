// Load all the Flux things!
Machine.add(me.dir()+"framework/PayloadBase.ck");
Machine.add(me.dir()+"framework/DispatchMessage.ck");
Machine.add(me.dir()+"framework/DispatchableBase.ck");
Machine.add(me.dir()+"framework/Dispatcher.ck");

// Domain
Machine.add(me.dir()+"models/MidiNote.ck");

// Plumbing
Machine.add(me.dir()+"dispatcher/AppDispatcher.ck");
Machine.add(me.dir()+"constants/Constants.ck");
Machine.add(me.dir()+"actions/payloads/MidiNoteCreatePayload.ck");
Machine.add(me.dir()+"actions/MidiNoteActions.ck");

// State
Machine.add(me.dir()+"stores/MidiNoteStore.ck");

// Components
Machine.add(me.dir()+"components/Synth.ck");

// Go!
Machine.add(me.dir()+"index.ck");
