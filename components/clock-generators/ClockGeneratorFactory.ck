public class ClockGeneratorFactory
{
  0 => static int _configuredClockGeneratorType;
  fun static void Configure(int clockGeneratorType)
  {
    clockGeneratorType => _configuredClockGeneratorType;
  }

  fun static ClockGeneratorBase GetConfigured()
  {
    return GetClockGenerator(_configuredClockGeneratorType);
  }
  fun static ClockGeneratorBase GetClockGenerator(int clockGeneratorType)
  {
    if(clockGeneratorType == ClockGeneratorType.Fixed)
    {
      return new Fixed $ ClockGeneratorBase;
    }

    return null;
  }
}
ClockGeneratorFactory clockGeneratorFactory;
