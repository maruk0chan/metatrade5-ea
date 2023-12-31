void OnStart()
{
   //--- Show all the information available from the function AccountInfoInteger()
   printf("ACCOUNT_LOGIN =  %d", AccountInfoInteger(ACCOUNT_LOGIN));
   printf("ACCOUNT_LEVERAGE =  %d", AccountInfoInteger(ACCOUNT_LEVERAGE));
   bool thisAccountTradeAllowed = AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);
   bool EATradeAllowed = AccountInfoInteger(ACCOUNT_TRADE_EXPERT);
   ENUM_ACCOUNT_TRADE_MODE tradeMode = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE);
   ENUM_ACCOUNT_STOPOUT_MODE stopOutMode = (ENUM_ACCOUNT_STOPOUT_MODE)AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE);

   //--- Inform about the possibility to perform a trade operation
   if (thisAccountTradeAllowed)
      Print("Trade for this account is permitted");
   else
      Print("Trade for this account is prohibited!");

   //--- Find out if it is possible to trade on this account by Expert Advisors
   if (EATradeAllowed)
      Print("Trade by Expert Advisors is permitted for this account");
   else
      Print("Trade by Expert Advisors is prohibited for this account!");

   //--- Find out the account type
   switch (tradeMode)
   {
   case (ACCOUNT_TRADE_MODE_DEMO):
      Print("This is a demo account");
      break;
   case (ACCOUNT_TRADE_MODE_CONTEST):
      Print("This is a competition account");
      break;
   default:
      Print("This is a real account!");
   }

   //--- Find out the StopOut level setting mode
   switch (stopOutMode)
   {
   case (ACCOUNT_STOPOUT_MODE_PERCENT):
      Print("The StopOut level is specified percentage");
      break;
   default:
      Print("The StopOut level is specified in monetary terms");
   }
}