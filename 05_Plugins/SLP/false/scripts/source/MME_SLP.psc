Scriptname MME_SLP extends Quest

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.slp",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

bool Function IsPregnant (Actor akActor)
	Return False
EndFunction