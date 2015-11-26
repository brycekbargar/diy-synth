public class FactoryBase
{
  "" => string _configuredValue;
  fun void Use(string configuredValue)
  {
    configuredValue => _configuredValue;
  }
}
