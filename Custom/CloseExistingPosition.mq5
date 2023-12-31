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

  int total = PositionsTotal();
  Print(total);
  for (int i = total - 1; i >= 0; i--)
  {
    ulong position_ticket = PositionGetTicket(i);
    double volume = PositionGetDouble(POSITION_VOLUME);
    ENUM_POSITION_TYPE type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

    ZeroMemory(request);
    ZeroMemory(result);
    request.action = TRADE_ACTION_DEAL;
    request.position = position_ticket;
    request.symbol = _Symbol;
    request.volume = volume;
    request.deviation = 5;
    request.magic = EXPERT_MAGIC;
    request.type_filling = ORDER_FILLING_IOC;
    if (type == POSITION_TYPE_BUY)
    {
      request.price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      request.type = ORDER_TYPE_SELL;
    }
    else
    {
      request.price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      request.type = ORDER_TYPE_BUY;
    }

    bool success = OrderSend(request, result);
  }
}