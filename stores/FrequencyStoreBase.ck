public class FrequencyStoreBase
{
  static Event @ OnChange;
  new Event @=> OnChange;
  fun void EmitChange()
  {
    OnChange.broadcast();
  }

  fun Frequency LastOn() { return null; }
  fun Frequency[] OnFrequencies() { return null; }

  static FrequencyStoreBase @ _store;
  fun static FrequencyStoreBase Instance()
  {
    return _store;
  }
}
