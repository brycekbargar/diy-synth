public class MetronomeFactory extends FactoryBase
{
  "TunedPing" => string _defaultValue;

  static MetronomeBase _possibleMetronomes[];
  new MetronomeBase[0] @=> _possibleMetronomes;
  fun static void Register(string key, MetronomeBase output)
  {
    output @=> _possibleMetronomes[key];
  }

  fun MetronomeBase GetConfigured()
  {
    if(_configuredValue == "")
    {
      return GetMetronome(_defaultValue);
    }
    return GetMetronome(_configuredValue);
  }

  fun MetronomeBase GetMetronome(string value)
  {
    return _possibleMetronomes[value];
  }

  static MetronomeFactory @ _factory;
  fun static MetronomeFactory Instance()
  {
    if(_factory == null)
    {
      new MetronomeFactory @=> _factory;
    }
    return _factory;
  }
}
MetronomeFactory.Instance() @=> MetronomeFactory factory;
Configurator.Instance().Configure("m", factory);
Configurator.Instance().Configure("metronome", factory);
