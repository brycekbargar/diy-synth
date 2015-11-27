public class ClockGeneratorFactory extends FactoryBase
{
  "Controllable" => string _defaultValue;

  static ClockGeneratorBase _possibleClockGenerators[];
  new ClockGeneratorBase[0] @=> _possibleClockGenerators;
  fun static void Register(string key, ClockGeneratorBase output)
  {
    output @=> _possibleClockGenerators[key];
  }

  fun ClockGeneratorBase GetConfigured()
  {
    if(_configuredValue == "")
    {
      return GetClockGenerator(_defaultValue);
    }
    return GetClockGenerator(_configuredValue);
  }

  fun ClockGeneratorBase GetClockGenerator(string value)
  {
    return _possibleClockGenerators[value];
  }

  static ClockGeneratorFactory @ _factory;
  fun static ClockGeneratorFactory Instance()
  {
    if(_factory == null)
    {
      new ClockGeneratorFactory @=> _factory;
    }
    return _factory;
  }
}
ClockGeneratorFactory.Instance() @=> ClockGeneratorFactory factory;
Configurator.Instance().Configure("c", factory);
Configurator.Instance().Configure("clock", factory);
