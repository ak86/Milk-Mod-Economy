Scriptname MME_SGO extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.sgo",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function IsPregnant(Actor akActor)
	dcc_sgo_QuestController SGO = Quest.GetQuest("dcc_sgo_QuestController") as dcc_sgo_QuestController
	if SGO.ActorGemGetWeight(akActor, FALSE) > 0
		return True
	endif
	return False
EndFunction