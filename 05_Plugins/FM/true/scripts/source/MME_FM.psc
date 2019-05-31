Scriptname MME_FM extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.fm",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function IsPregnant (Actor akActor)
	_JSW_BB_Utility FMQ = Quest.GetQuest("_JSW_BB_HandlerQuest") as _JSW_BB_Utility
	int index = FMQ.Storage.TrackedActors.Find(akActor)
	
	If (index != -1)
		If FMQ.Storage.LastConception[index] > 0.0
			debug.Trace("MilkModEconomy FM Pregnancy: " + akActor.GetLeveledActorBase().GetName())
			Return True
		endIf
	endIf
	
	Return False
EndFunction