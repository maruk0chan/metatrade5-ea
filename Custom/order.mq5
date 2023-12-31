#property description "Playground"
#property script_show_inputs

#define EXPERT_MAGIC 123456

input ENUM_ORDER_TYPE orderType = ORDER_TYPE_BUY_LIMIT;
input int offset = 50;
input int StopLoss = 1000;
input int TakeProfit = 1000;
input int StopLimitPrice = 500;

void OnStart()
{
  MqlTradeRequest request = {};
  MqlTradeResult result = {};
  request.action = TRADE_ACTION_PENDING;
  request.symbol = Symbol();
  request.volume = 0.1;
  request.deviation = 2;
  request.magic = EXPERT_MAGIC;
  request.type_time = ORDER_TIME_GTC;
  double price;
  double point = SymbolInfoDouble(_Symbol, SYMBOL_POINT);
  int digits = SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
  if (orderType == ORDER_TYPE_BUY_LIMIT)
  {
    request.type = ORDER_TYPE_BUY_LIMIT;
    price = SymbolInfoDouble(Symbol(), SYMBOL_BID) - offset * point;
    request.price = NormalizeDouble(price, digits);
    request.sl = price - (StopLoss * point);
    request.tp = price + (StopLoss * point);
  }
  else if (orderType == ORDER_TYPE_SELL_LIMIT)
  {
    request.type = ORDER_TYPE_SELL_LIMIT;
    price = SymbolInfoDouble(Symbol(), SYMBOL_ASK) + offset * point;
    request.price = NormalizeDouble(price, digits);
    request.sl = price + (StopLoss * point);
    request.tp = price - (StopLoss * point);
  }
  else if (orderType == ORDER_TYPE_BUY_STOP)
  {
    request.type = ORDER_TYPE_BUY_STOP;
    price = SymbolInfoDouble(Symbol(), SYMBOL_BID) + offset * point;
    request.price = NormalizeDouble(price, digits);
    request.sl = price + (StopLoss * point);
    request.tp = price - (TakeProfit * point);
  }
  else if (orderType == ORDER_TYPE_SELL_STOP)
  {
    request.type = ORDER_TYPE_SELL_STOP;
    price = SymbolInfoDouble(Symbol(), SYMBOL_ASK) - offset * point;
    request.price = NormalizeDouble(price, digits);
    request.sl = price + (StopLoss * point);
    request.tp = price - (TakeProfit * point);
  }
  else if (orderType == ORDER_TYPE_BUY_STOP_LIMIT)
  {
    request.type = ORDER_TYPE_BUY_STOP_LIMIT;
    price = SymbolInfoDouble(Symbol(), SYMBOL_BID) + offset * point;
    request.price = NormalizeDouble(price, digits);
    double slprice = price - (StopLimitPrice * point);
    request.stoplimit = slprice;
    request.sl = slprice - (StopLoss * point);
    request.tp = slprice + (TakeProfit * point);
  }
  else if (orderType == ORDER_TYPE_SELL_STOP_LIMIT)
  {
    request.type = ORDER_TYPE_SELL_STOP_LIMIT;
    price = SymbolInfoDouble(Symbol(), SYMBOL_ASK) - offset * point;
    double slprice = price + (StopLimitPrice * point);
    request.price = NormalizeDouble(price, digits);
    request.stoplimit = slprice;
    request.sl = slprice + (StopLoss * point);
    request.tp = slprice - (TakeProfit * point);
  }
  if (!OrderSend(request, result))
    PrintFormat("OrderSend error %d", GetLastError());
  PrintFormat("retcode=%u  deal=%I64u  order=%I64u", result.retcode, result.deal, result.order);
}
//+------------------------------------------------------------------+
