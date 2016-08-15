Scriptname MME_SGO extends Quest

Event OnPlayerLoadGame()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.sgo",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function IsPregnant(Actor akActor)
	if StorageUtil.FormListFind(None,"SGO.ActorList.Gem",akActor) != -1
		debug.Trace("MilkModEconomy SGO3 Pregnancy(alt): " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif
	Return False
EndFunction
