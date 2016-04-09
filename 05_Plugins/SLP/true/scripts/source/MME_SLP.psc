Scriptname MME_SLP extends Quest

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function IsPregnant (Actor akActor)
	ProCEvaluator SLP = Quest.GetQuest("_ProcreationSystem") as ProCEvaluator
	if akActor == Game.GetPlayer() && SLP.config.IsPregnant
		debug.Trace("MilkModEconomy SLP Pregnancy: " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif
	Return False
EndFunction