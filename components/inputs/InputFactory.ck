public class InputFactory
{
  0 => static int _configuredInputType;
  fun static void Configure(int inputType)
  {
    inputType => _configuredInputType;
  }

  fun static InputBase GetConfigured()
  {
    return GetInput(_configuredInputType);
  }
  fun static InputBase GetInput(int inputType)
  {
    if(inputType == InputType.AlesisQ25)
    {
      return new AlesisQ25 $ InputBase;
    }

    return null;
  }
}
InputFactory inputFactory;
