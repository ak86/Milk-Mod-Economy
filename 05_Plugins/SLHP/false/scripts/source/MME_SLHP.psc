Scriptname MME_SLHP extends Quest

Event OnPlayerLoadGame()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.slhp",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

bool Function IsPregnant (Actor akActor)
	Return False
EndFunction