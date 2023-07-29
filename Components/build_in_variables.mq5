//+------------------------------------------------------------------+
//|                                                        input.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"
//--- day of week
enum dayOfWeek
{
  S = 0,  // Sundayfoobar
  M = 1,  // Monday
  T = 2,  // Tuesday
  W = 3,  // Wednesday
  Th = 4, // Thursday
  Fr = 5, // Friday
  St = 6, // Saturday
};
//--- input parameters
input dayOfWeek swapday = W;
input int maPeriod = 20;
input ENUM_MA_METHOD maMethod = MODE_SMA;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
  //---

  //---
  return (INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnStart()
{
  //---
  Comment("Symbol: ", _Symbol, "\n",
          "Period: ", _Period, "\n",
          "Point: ", _Point, "\n",
          "Digits: ", _Digits, "\n");
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
  //---
}
//+------------------------------------------------------------------+
