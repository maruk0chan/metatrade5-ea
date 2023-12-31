//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart()
{
  int total = PositionsTotal();
  Print("total: ", total);
  for (int i = total - 1; i >= 0; i--)
  {
    string server = AccountInfoString(ACCOUNT_SERVER);
    double volume = PositionGetDouble(POSITION_VOLUME);
    ulong ticket = PositionGetTicket(i);
    long leverage = AccountInfoInteger(ACCOUNT_LEVERAGE);

    ENUM_POSITION_TYPE type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
    Print(
        "ticket: ", ticket, " ",
        "volume: ", volume, " ",
        "type: ", type, " ",
        "server: ", server, " ",
        "leverage: ", leverage, " "
        // new line
    );
    PrintFormat("ticket: %I64u , volume: %0.1f , type: %g", ticket, volume, type);
  }
}
//+------------------------------------------------------------------+
