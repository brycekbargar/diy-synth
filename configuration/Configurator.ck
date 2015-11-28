for(0 => int i; i < me.args() - 1; 2 +=> i )
{
  me.arg(i) => string key;
  me.arg(i + 1) => string value;

  ObjectFactory.Use(key, value);
}
