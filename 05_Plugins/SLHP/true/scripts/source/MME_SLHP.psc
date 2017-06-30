Scriptname MME_SLHP extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.slhp",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function IsPregnant (Actor akActor)
	HentaiPregnancy HPQ = Quest.GetQuest("HentaiPregnancyQuest") as HentaiPregnancy
	int i = 0
	while i < HPQ.PregnantActors.Length
		if HPQ.PregnantActors[i].getState() == "Pregnant"
			if HPQ.PregnantActors[i].getMother() == akActor
				debug.Trace("MilkModEconomy HP Pregnancy: " + akActor.GetLeveledActorBase().GetName())
				Return True
			endIf
		endIf
		i += 1
	endWhile
	Return False
EndFunction