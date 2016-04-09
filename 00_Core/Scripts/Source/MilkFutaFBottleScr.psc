Scriptname MilkFutaFBottleScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart( Actor akTarget, Actor akCaster )
	MilkQ.SLA.UpdateActorExposureRate(akTarget, MilkQ.SLA.GetActorExposureRate(akTarget)/3)

	if MilkQ.Plugin_SOS
		MilkQ.SOS.DecreaseSOS(akTarget)
	endif
EndEvent