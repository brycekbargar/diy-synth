// Defaults
ClockGeneratorFactory.Configure(ClockGeneratorType.Controllable);
MetronomeFactory.Configure(MetronomeType.TunedPing);

for( int i; i < me.args() - 1; i++ )
{
  me.arg(i) => string thisArg;
  me.arg(i + 1) => string nextArg;

  if((thisArg == "metronome" || thisArg == "m"))
  {
    i++;
    if(nextArg == "TunedPing")
    {
      MetronomeFactory.Configure(MetronomeType.TunedPing);
      continue;
    }
    <<< "Couldn't find " + nextArg + ". We're using the default" >>>;
  }

  if((thisArg == "clock-generator" || thisArg == "c"))
  {
    i++;
    if(nextArg == "Fixed")
    {
      ClockGeneratorFactory.Configure(ClockGeneratorType.Fixed);
      continue;
    }
    if(nextArg == "Controllable")
    {
      ClockGeneratorFactory.Configure(ClockGeneratorType.Controllable);
      continue;
    }
    <<< "Couldn't find " + nextArg + ". We're using the default" >>>;
  }
}
