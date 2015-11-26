public class FactoryBase
{
  null => string _configuredValue;
  fun void Use(string configuredValue)
  {
    configuredValue => _configuredValue;
  }
}
