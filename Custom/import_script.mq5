#define EXPERT_MAGIC 123456 // エキスパートアドバイザのMagicNumber
#import "print_account_info.ex5"
void print_account_info();
#import
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart()
{
  print_account_info();

  MqlTradeRequest request = {};
  MqlTradeResult result = {};
  request.action = TRADE_ACTION_DEAL;                     // 　取引操作タイプ
  request.symbol = Symbol();                              // シンボル
  request.volume = 0.1;                                   // 0.1ロットのボリューム
  request.type = ORDER_TYPE_BUY;                          // 注文タイプ
  request.price = SymbolInfoDouble(Symbol(), SYMBOL_ASK); // 発注価格
  request.deviation = 5;                                  // 価格からの許容偏差
  request.magic = EXPERT_MAGIC;                           // 注文のMagicNumber
  request.type_filling = ORDER_FILLING_IOC;

  bool success = OrderSend(request, result);

  if (result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE)
  {
    PrintFormat("Successful (%s)", result.retcode);
  }

  else
  {
    PrintFormat("Failed (%s)", result.comment);
  }
  Print("success: ", success);
}
//+------------------------------------------------------------------+
