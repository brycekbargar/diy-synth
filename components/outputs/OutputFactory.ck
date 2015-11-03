public class OutputFactory
{
  0 => static int _configuredOutputType;
  fun static void Configure(int outputType)
  {
    outputType => _configuredOutputType;
  }

  fun static OutputBase GetConfigured()
  {
    return GetOutput(_configuredOutputType);
  }
  fun static OutputBase GetOutput(int outputType)
  {
    if(outputType == OutputType.SimpleTriangle)
    {
      return new SimpleTriangle $ OutputBase;
    }
    if(outputType == OutputType.SimpleStrings)
    {
      return new SimpleStrings $ OutputBase;
    }

    return null;
  }
}
OutputFactory outputFactory;
