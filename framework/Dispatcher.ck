public class Dispatcher
{
  "ID_" => string _prefix;

  1 => int _lastId;
  string _dispatchTokens[0];
  DispatchableBase _dispatchables[0];
  int _isPending[0];
  int _isHandled[0];
  0 => int _isDispatching;
  DispatchMessage @ _pendingMessage;

  fun DispatchToken Register(DispatchableBase dispatchable)
  {
    1 +=> _lastId;
    (_prefix + _lastId) => string id;
    _dispatchTokens << id;

    dispatchable @=> _dispatchables[id];

    return DispatchToken.Create(id);
  }

  fun void Unregister(string id)
  {
    if(_dispatchables[id] != null)
    {
      null @=> _dispatchables[id];
    }
    for(0 => int i; i < _dispatchTokens.size(); i++)
    {
      if(_dispatchTokens[i] == id)
      {
        null => _dispatchTokens;
      }
    }
  }

  fun void WaitFor(string id)
  {
    [ id ] @=> string ids[];
    WaitFor(ids);
  }

  fun void WaitFor(string ids[])
  {
    if(_isDispatching == 0)
    {
      <<< "Called waitFor while not Dispatching" >>>;
      return;
    }

    for(0 => int i; i < ids.size(); i++)
    {
      ids[i] => string thisId;

      if (_isPending[thisId] == 1 &&
        _isHandled[thisId] == 0)
      {
        <<< "Circular Dispatch Callbacks" >>>;
        return;
      }

      if(_dispatchables[thisId] == null)
      {
        <<< "Waiting for a non-existent Callback" >>>;
        return;
      }

      _CallDispatchable(thisId);
    }
  }

  fun void Dispatch(DispatchMessage message)
  {
    if(_isDispatching)
    {
      <<< "Trying to nested Dispatch" >>>;
      return;
    }

    _StartDispatching(message);
    for (0 => int i; i < _dispatchTokens.size(); i++)
    {
      _dispatchTokens[i] => string thisId;
      if (_isPending[thisId] == 1)
      {
        continue;
      }
      _CallDispatchable(thisId);
    }
    _StopDispatching();
  }

  fun void _CallDispatchable(string id)
  {
    1 => _isPending[id];
    if(_dispatchables[id] != null)
    {
      _dispatchables[id].Handle(_pendingMessage);
    }
    1 => _isHandled[id];
  }

  fun void _StartDispatching(DispatchMessage message)
  {
    for(0 => int i; i < _dispatchTokens.size(); i++)
    {
      _dispatchTokens[i] => string thisToken;
      0 => _isPending[thisToken];
      0 => _isHandled[thisToken];
    }

    message @=> _pendingMessage;
    1 => _isDispatching;
  }

  fun void _StopDispatching()
  {
    null @=> _pendingMessage;
    0 => _isDispatching;
  }
}
