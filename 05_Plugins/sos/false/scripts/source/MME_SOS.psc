Scriptname MME_SOS extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.sos",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

bool Function GetSOS(Actor akActor)
	return false
EndFunction

Function DecreaseSOS(Actor akActor)
EndFunction

Function IncreaseSOS(Actor akActor)
EndFunction