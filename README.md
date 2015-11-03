# A DIY Digital Synth using ChucK + Flux #

### Why build my own synthesizer? ###
$$$

##### No seriously, why? #####
Good vsts and hosts for them are expensive and heavyweight. They are riddled with bloat and yagni. My end goal is to have a generic synth engine that I can hook up to MidiKeyboards, drum triggers, magical future instruments I invent, or carrier pidgeons. Preferably headless and lightweight so I can run it over ssh on a Raspberry pi!

### Why ChucK ###
After looking at the various musical programming laguages out there it seemed like there were three viable candidates.
- [Max](https://cycling74.com/products/max/)
- [Pure Data](https://puredata.info/)
- [Chuck](http://chuck.cs.princeton.edu/)

Max was $$$$ and  hate visual "programming" so Pd was out leaving me with the scrappy, poorly documented underdog ChucK.

### Why Flux? ###
[yes really, that flux](https://facebook.github.io/flux/)

ChucK is garbage. It has poor documentation. It's inconsistent. It has such a bad type system it might as well not exist. Loading and managing source files and dependencies is a nightmare. It's asynchronous without a sane way to handle asyncronicity in the standard library. State is easily mismanaged.

It reminds me a lot of Javascript :troll:.

I messed around with the Flux pattern in actual JS and it seemed to handle the complexity of an event driven application. I liked how it consolidated the application state and had easily pluggable components. So I decided to try to adapt it to building a synth in the ChucK language. Unlike most of my crazy ideas I actually did it and it actually worked!

### Building and Running the Synth ###
Install chuck using `brew install chuck` or `sudo apt-get chuck` or whatever whiz-bang pm you use.

Run the inialize script using `chuck initialize.ck`

Pretty simple!

You can also configure the input and output components using command line  
[Not surprisingly ChucK has wonky argument syntax](http://chuck.cs.princeton.edu/doc/language/spork.html). If you want to use a different input or output than the default you need to pass it when you call the initialize script.

```
chuck initialize.ck:output:SimpleStrings  
chuck initialize.ck:input:HIDKeyboard
chuck initialize.ck:i:HIDKeyboard:o:SimpleTriangle
```

A complete list of input/output components can be found in [the configurator](configurator.ck)


### Testing the Synth ###
lol ChucK
