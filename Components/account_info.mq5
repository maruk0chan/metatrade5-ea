//+------------------------------------------------------------------+
//|                                                        input.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"

void OnStart()
{
  long accountType = AccountInfoInteger(ACCOUNT_MARGIN_MODE);

  switch (accountType)
  {
  case 0:
    Comment("口座タイプはネッティングタイプです");
    break;

  case 1:
    Comment("口座タイプはEXCHANGEタイプです");
    break;

  case 2:
    Comment("口座タイプはヘッジングタイプです");
    break;

  default:
    Comment("口座タイプを検知できませんでした");
  }
}