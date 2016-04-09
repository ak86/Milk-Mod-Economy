Scriptname MME_SLA extends Quest

bool Function IsIntegraged ()
	Return False
EndFunction

int Function GetActorArousal(Actor akActor)
	return Utility.RandomInt(0, 100)
EndFunction

float Function GetActorExposure(Actor akActor)
	return 0
EndFunction

float Function GetActorExposureRate(Actor akActor)
	return 0
EndFunction

Function UpdateActorExposure(Actor akActor, Int value)
EndFunction

Function UpdateActorExposureRate(Actor akActor, Float value)
EndFunction

Function UpdateActorOrgasmDate(Actor akActor)
EndFunction