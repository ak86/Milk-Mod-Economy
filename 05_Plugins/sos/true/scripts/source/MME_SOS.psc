Scriptname MME_SOS extends Quest

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function GetSOS(Actor akActor)
	bool hasSchlong = false
	SOS_SetupQuest_Script sosScript = Quest.GetQuest("SOS_SetupQuest") as SOS_SetupQuest_Script
	Form addon
	
	Faction SOS_SchlongifiedFaction = sosScript.SOS_SchlongifiedFaction
		If akActor.IsInFaction(SOS_SchlongifiedFaction)
			addon = sosScript.GetActiveAddon(akActor)
			Faction addonFaction = SOS_Data.GetFaction(addon)
			if addonFaction != none
				if addonFaction.getname() == "SOS No Schlong for Females" || addonFaction.getname() == "SOS Pubic Hair for Females"
					return hasSchlong
				else
					return akActor.IsInFaction(SOS_SchlongifiedFaction)
				endif
			endif
		endif
	return hasSchlong
EndFunction

Function DecreaseSOS(Actor akActor)
	SOS_SetupQuest_Script sosScript = Quest.GetQuest("SOS_SetupQuest") as SOS_SetupQuest_Script
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	Form addon
	
	If MilkQ.akActorSex(akActor) == "Male" || MilkQ.akActorSex(akActor) == "Futa" 			;decrease schlong size -1
		Faction SOS_SchlongifiedFaction = sosScript.SOS_SchlongifiedFaction
		If akActor.IsInFaction(SOS_SchlongifiedFaction)
			int size1 = akActor.GetFactionRank(SOS_SchlongifiedFaction)
			if size1 > 1
				akActor.SetFactionRank(SOS_SchlongifiedFaction, size1 - 1)
			endif
					
			addon = sosScript.GetActiveAddon(akActor)
			Faction addonFaction = SOS_Data.GetFaction(addon)
			int size2 = akActor.GetFactionRank(addonFaction)
			if size2 > 1
				akActor.SetFactionRank(addonFaction, size2 - 1)
				sosScript.ScaleSchlongBones(addon, akActor, size2 - 1)
			endif
		EndIf
	endIf
EndFunction

Function IncreaseSOS(Actor akActor)
	SOS_SetupQuest_Script sosScript = Quest.GetQuest("SOS_SetupQuest") as SOS_SetupQuest_Script
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	Form addon
	int size
	
	if MilkQ.akActorSex(akActor) == "Female"  												;make player futa with random addon
		int rnd = Utility.RandomInt(0, SOS_Data.countAddons() - 1)
		Form rndSchlong = SOS_Data.getAddon(rnd)
		if rndSchlong != none
			if SOS_Data.GetGender(rndSchlong) == (1 || 2)
				Faction addonFaction = SOS_Data.GetFaction(rndSchlong)
				if addonFaction != none
					if addonFaction.getname() == "SOS No Schlong for Females" || addonFaction.getname() == "SOS Pubic Hair for Females"
						return 
					else
						SOS_API.get().SetSchlong(akActor, rndSchlong)
					endif
				endif
			endif
		endif
	elseIf MilkQ.akActorSex(akActor) == "Male" || MilkQ.akActorSex(akActor) == "Futa" 		;increase schlong size +1
		Faction SOS_SchlongifiedFaction = sosScript.SOS_SchlongifiedFaction
		If akActor.IsInFaction(SOS_SchlongifiedFaction)
			int size1 = akActor.GetFactionRank(SOS_SchlongifiedFaction)
			if size1 < 20
				akActor.SetFactionRank(SOS_SchlongifiedFaction, size1 + 1)
			endif
			
			addon = sosScript.GetActiveAddon(akActor)
			Faction addonFaction = SOS_Data.GetFaction(addon)
			int size2 = akActor.GetFactionRank(addonFaction)
			if size2 < 20
				akActor.SetFactionRank(addonFaction, size2 + 1)
				sosScript.ScaleSchlongBones(addon, akActor, size2 + 1)
			endif
		endif
	endIf
EndFunction