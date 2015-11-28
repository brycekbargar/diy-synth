public class ObjectFactory
{
  static string _configuredValues[];
  fun static void Use(string key, string configuredValue)
  {
    if(_configuredValues == null)
    {
      new string[0] @=> _configuredValues;
    }
    configuredValue => _configuredValues[key];
  }
  fun static void UseDefault(string key, string configuredValue)
  {
    if(_configuredValues == null || _configuredValues[key] == null)
    {
      Use(key, configuredValue);
    }
  }

  static Object _registeredInstances[];
  fun static void Register(string value, Object instance)
  {
    if(_registeredInstances == null)
    {
      new Object[0] @=> _registeredInstances;
    }
    instance @=> _registeredInstances[value];
  }

  fun Object _GetConfiguredInstance(string key)
  {
    _configuredValues[key] => string value;
    return _GetInstance(value);
  }

  fun Object _GetInstance(string value)
  {
    if(value == null)
    {
      return null;
    }
    return _registeredInstances[value];
  }
}
ObjectFactory objectFactory;
