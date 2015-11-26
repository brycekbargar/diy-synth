public class DispatchToken
{
  string _value;
  fun string Value() { return _value; }

  fun static DispatchToken Create(string value)
  {
    DispatchToken token;
    value => token._value;

    return token;
  }
}
