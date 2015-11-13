// Defaults
InputFactory.Configure(InputType.AlesisQ25);
OutputFactory.Configure(OutputType.SimpleTriangle);

for( int i; i < me.args() - 1; i++ )
{
  me.arg(i) => string thisArg;
  me.arg(i + 1) => string nextArg;

  if((thisArg == "input" || thisArg == "i"))
  {
    i++;
    if(nextArg == "AlesisQ25")
    {
      InputFactory.Configure(InputType.AlesisQ25);
      continue;
    }
    if(nextArg == "HIDKeyboard")
    {
      InputFactory.Configure(InputType.HIDKeyboard);
      continue;
    }
    <<< "Couldn't find " + nextArg + ". We're using the default" >>>;
  }

  if((thisArg == "output" || thisArg == "o"))
  {
    i++;
    if(nextArg == "SimpleTriangle")
    {
      OutputFactory.Configure(OutputType.SimpleTriangle);
      continue;
    }
    if(nextArg == "SimpleStrings")
    {
      OutputFactory.Configure(OutputType.SimpleStrings);
      continue;
    }
    <<< "Couldn't find " + nextArg + ". We're using the default" >>>;
  }

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
    <<< "Couldn't find " + nextArg + ". We're using the default" >>>;
  }
}
