public class AppFactory extends ObjectFactory
{
  fun InputBase GetConfiguredInput()
  {
    return _GetConfiguredInstance("i") $ InputBase;
  }

  fun OutputBase GetConfiguredOutput()
  {
    return _GetConfiguredInstance("o") $ OutputBase;
  }

  fun ClockGeneratorBase GetConfiguredClockGenerator()
  {
    return _GetConfiguredInstance("c") $ ClockGeneratorBase;
  }

  fun MetronomeBase GetConfiguredMetronome()
  {
    return _GetConfiguredInstance("m") $ MetronomeBase;
  }

  static AppFactory @ _appFactory;
  fun static AppFactory Instance()
  {
    if(_appFactory == null)
    {
      new AppFactory @=> _appFactory;
    }
    return _appFactory;
  }
}
AppFactory.Instance();
