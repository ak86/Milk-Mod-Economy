Scriptname MME_ineed extends Quest

Event OnPlayerLoadGame()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.ineed",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

Function iNeedfoodlistaddon()
	debug.Trace("MilkModEconomy iNeed options is not installed")
EndFunction