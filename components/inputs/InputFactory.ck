public class InputFactory extends FactoryBase
{
  "AlesisQ25" => string _defaultValue;

  static InputBase _possibleInputs[];
  new InputBase[0] @=> _possibleInputs;
  fun static void Register(string key, InputBase output)
  {
    output @=> _possibleInputs[key];
  }

  fun InputBase GetConfigured()
  {
    if(_configuredValue == "")
    {
      return GetInput(_defaultValue);
    }
    return GetInput(_configuredValue);
  }

  fun InputBase GetInput(string value)
  {
    return _possibleInputs[value];
  }

  static InputFactory @ _factory;
  fun static InputFactory Instance()
  {
    if(_factory == null)
    {
      new InputFactory @=> _factory;
    }
    return _factory;
  }
}
InputFactory.Instance() @=> InputFactory factory;
Configurator.Instance().Configure("i", factory);
Configurator.Instance().Configure("input", factory);
