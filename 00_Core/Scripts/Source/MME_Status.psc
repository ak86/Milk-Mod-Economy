Scriptname MME_Status extends Quest
{MME check script}
;Doesn't connect to main mod in anyway, only purpose is to check if MME scripts are initiated
;To do this we check MME_Status_Global, which should be set be MME to 1 by maintenance() in MilkPlayerLoadGame script

GlobalVariable Property MME_Status_Global Auto

Event OnInit()
	RegisterForSingleUpdate(60)
EndEvent

Event OnPlayerLoadGame()
	RegisterForSingleUpdate(60)
EndEvent

Event OnUpdate()
	if MME_Status_Global.GetValue() != 1
		Debug.Messagebox("MilkModEconomy was not installed correctly, scripts are not running \n this can be false alarm when starting new game but if message keeps repeating, then something is wrong, script will retry check in 60 sec")
		Debug.Trace("MilkModEconomy MilkPlayerLoadGame.Maintenance() script has not set MME_Status_Global to 1, retry check in 60 sec")
		RegisterForSingleUpdate(60)
	else
		Debug.Trace("MilkModEconomy Changed status to 0, shutting down")
		MME_Status_Global.SetValue(0)
	endif
EndEvent
