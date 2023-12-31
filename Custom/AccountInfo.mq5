#property library
#property copyright "---"
#property link "https://www.mql5.com"
#property version "1.00"

void print_account_info() export
{
  long accountTypeCode = AccountInfoInteger(ACCOUNT_MARGIN_MODE);
  string accountType;
  switch ((int)accountTypeCode)
  {
  case 0:
    accountType = "NETTING";
    break;

  case 1:
    accountType = "EXCHANGE";
    break;

  case 2:
    accountType = "HEDGING";
    break;

  default:
    accountType = "UNKNOWN";
  }

  long fillPolicyCode = SymbolInfoInteger(_Symbol, SYMBOL_FILLING_MODE);
  string fillPolicy;
  switch ((int)fillPolicyCode)
  {
  case 1:
    fillPolicy = "SYMBOL_FILLING_FOK";
    break;

  case 2:
    fillPolicy = "SYMBOL_FILLING_IOC";
    break;

  case 4:
    fillPolicy = "SYMBOL_FILLING_BOC";
    break;

  default:
    fillPolicy = "UNKNOWN";
  }

  ENUM_SYMBOL_TRADE_EXECUTION exeMode = (ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(NULL, SYMBOL_TRADE_EXEMODE);
  string executionType = EnumToString(exeMode);
  Comment( // new line
      "Account Type: " + accountType + "\n" +
      "Execution Type: " + executionType + "\n" +
      "Fill Policy: " + fillPolicy
      // new line
  );
}