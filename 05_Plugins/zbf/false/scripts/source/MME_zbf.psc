Scriptname MME_zbf extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.zbf",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

bool Function IsWearingZaZGag_Open (Actor akActor)	;oral permitted
	Return False
EndFunction

bool Function IsWearingZaZGag (Actor akActor)
	Return False
EndFunction