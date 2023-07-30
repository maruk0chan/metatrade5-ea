=
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"
//--- day of week
enum dayOfWeek
{
  S = 0,  // Sunday
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