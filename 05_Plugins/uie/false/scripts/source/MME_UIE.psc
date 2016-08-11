Scriptname MME_UIE extends Quest

Event OnPlayerLoadGame()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.uie",1)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction