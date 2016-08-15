Scriptname MME_SGO extends Quest

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.sgo",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

bool Function IsPregnant(Actor akActor)
	return false
EndFunction