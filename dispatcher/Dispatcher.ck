public class Dispatcher
{
  DispatchableBase _dispatchables[0];

  fun void Register(DispatchableBase dispatchable)
  {
    _dispatchables << dispatchable;
  }

  fun void Dispatch(DispatchMessage message)
  {
    for(0 => int i; i < _dispatchables.cap(); i++)
    {
      _dispatchables[i].Handle(message);
    }
  }
}
