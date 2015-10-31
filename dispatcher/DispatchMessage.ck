public class DispatchMessage
{
  int _actionType;
  fun int ActionType() { return _actionType; }

  PayloadBase _payload;
  fun PayloadBase Payload() { return _payload; }

  fun static DispatchMessage Create(int actionType, PayloadBase payload)
  {
    DispatchMessage newMessage;
    actionType => newMessage._actionType;
    payload @=> newMessage._payload;

    return newMessage;
  }
}
