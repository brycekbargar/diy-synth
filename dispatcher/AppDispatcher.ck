public class AppDispatcher
{
  static Dispatcher @ _dispatcher;

  fun static Dispatcher Instance()
  {
    if(_dispatcher == null)
    {
      new Dispatcher @=> _dispatcher;
    }
    
    return _dispatcher;
  }
}
