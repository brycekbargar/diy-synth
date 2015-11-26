public class Configurator
{
  string _configs[0];

  fun void Configure(string key, FactoryBase factory)
  {
    _configs[key] => string value;
    if(value != null)
    {
      factory.Use(value);
    }
  }

  static Configurator @ _configurator;
  fun static Configurator Instance()
  {
    if(_configurator == null)
    {
      new Configurator @=> _configurator;

      for( int i; i < me.args() - 1; 2 +=> i )
      {
        me.arg(i) => string key;
        me.arg(i + 1) => string value;

        <<< key, value >>>;
        value => _configurator._configs[key];
      }
    }

    return _configurator;
  }
}
Configurator.Instance();
