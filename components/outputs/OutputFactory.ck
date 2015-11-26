public class OutputFactory extends FactoryBase
{
  "SimpleTriangle" => string _defaultValue;

  static OutputBase _possibleOutputs[];
  new OutputBase[0] @=> _possibleOutputs;
  fun static void Register(string key, OutputBase output)
  {
    output @=> _possibleOutputs[key];
  }

  fun OutputBase GetConfigured()
  {
    if(_configuredValue == "")
    {
      return GetOutput(_defaultValue);
    }
    return GetOutput(_configuredValue);
  }

  fun OutputBase GetOutput(string value)
  {
    return _possibleOutputs[value];
  }

  static OutputFactory @ _factory;
  fun static OutputFactory Instance()
  {
    if(_factory == null)
    {
      new OutputFactory @=> _factory;
    }
    return _factory;
  }
}
OutputFactory.Instance() @=> OutputFactory factory;
Configurator.Instance().Configure("o", factory);
Configurator.Instance().Configure("output", factory);
