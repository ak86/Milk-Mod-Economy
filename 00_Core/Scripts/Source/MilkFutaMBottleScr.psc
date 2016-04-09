Scriptname MilkFutaMBottleScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart( Actor akTarget, Actor akCaster )
	MilkQ.SLA.UpdateActorExposureRate(akTarget, MilkQ.SLA.GetActorExposureRate(akTarget)/3)

	if MilkQ.Plugin_SOS
		MilkQ.SOS.IncreaseSOS(akTarget)
	endif
EndEvent