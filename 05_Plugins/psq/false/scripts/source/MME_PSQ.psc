Scriptname MME_PSQ extends Quest

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.psq",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

Function AddEnergy ()
EndFunction