Scriptname MME_Status_Player_Alias extends ReferenceAlias
{MME check script Player_Alias}
;Should (re)launch MME_Status script on every player load game

Event OnPlayerLoadGame()
	Quest.GetQuest("mme_StatusCheck").stop()
	Quest.GetQuest("mme_StatusCheck").start()
EndEvent