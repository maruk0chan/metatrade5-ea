#define EXPERT_MAGIC 6766
#import "AccountInfo.ex5"
void print_account_info();
#import

void OnStart()
{
  print_account_info();

  MqlTradeRequest request = {};
  MqlTradeResult result = {};
  ZeroMemory(request);
  ZeroMemory(result);

  double price = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
  request.action = (ENUM_TRADE_REQUEST_ACTIONS)TRADE_ACTION_DEAL;
  request.magic = EXPERT_MAGIC;
  // request.order = 0.1;
  request.symbol = _Symbol;
  request.volume = 0.1;
  request.price = price;
  // request.stoplimit = 1;
  // request.sl = 500;
  // request.tp = 1000;
  request.deviation = 10;
  request.type = (ENUM_ORDER_TYPE)ORDER_TYPE_BUY;
  request.type_filling = (ENUM_ORDER_TYPE_FILLING)ORDER_FILLING_FOK;
  request.type_time = (ENUM_ORDER_TYPE_TIME)ORDER_TIME_DAY;
  // request.expiration = 1; // use when type_time is ORDER_TIME_SPECIFIED
  // request.comment = 1;
  // request.position = 1;
  // request.position_by = 1;
  bool sent = OrderSend(request, result);

  if (!sent)
    PrintFormat("OrderSend error %d", GetLastError());
  PrintFormat("retcode=%u  deal=%I64u  order=%I64u", result.retcode, result.deal, result.order);
}