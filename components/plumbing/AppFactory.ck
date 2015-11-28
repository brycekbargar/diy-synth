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

  fun ClockBase GetConfiguredClock()
  {
    return _GetConfiguredInstance("c") $ ClockBase;
  }

  fun MetronomeVoiceBase GetConfiguredMetronomeVoice()
  {
    return _GetConfiguredInstance("m") $ MetronomeVoiceBase;
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
