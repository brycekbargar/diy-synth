public class AppDispatcher
{
  static Dispatcher @ _dispatcher;
  new Dispatcher @=> _dispatcher;

  fun static Dispatcher Instance()
  {
    return _dispatcher;
  }
}
AppDispatcher appDispatcher;
