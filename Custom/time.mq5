#define EXPERT_MAGIC 123456 // MagicNumber of the expert
//+------------------------------------------------------------------+
//| Opening Buy position                                             |
//+------------------------------------------------------------------+
void OnStart()
{
   datetime now = TimeLocal();
   Comment(now);
   Print(now);
}
//+---------rr---------------------------------------------------------+r