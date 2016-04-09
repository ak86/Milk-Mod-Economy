Scriptname MME_Status extends Quest

GlobalVariable Property MME_Status_Global Auto
Message Property MME_StatusMsg Auto

Event OnInit()
	RegisterForSingleUpdate(60)
EndEvent

Event OnPlayerLoadGame()
	RegisterForSingleUpdate(30)
EndEvent

Event OnUpdate()
	if MME_Status_Global.GetValue() != 1
		MME_StatusMsg.Show()
		Debug.Trace("MilkModEconomy was not installed correctly, scripts are not running \n this can be false alarm when starting new game but if message keeps repeating, then something is wrong")
		RegisterForSingleUpdate(30)
	endif
	MME_Status_Global.SetValue(0)
EndEvent
