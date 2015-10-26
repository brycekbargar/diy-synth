public class AppDispatcher
{
  static Dispatcher @ dispatcher;
  new Dispatcher @=> dispatcher;

  fun static Dispatcher Instance()
  {
    return dispatcher;
  }
}
