Scriptname MilkExhaustedDebuffScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

int i = 0
float SleepStartTime

; ----------------------------------------------------------------------------------
Event OnEffectStart( Actor akTarget, Actor akCaster )
	If MilkQ.PlayerREF == akTarget && MilkQ.MilkMsgs
		Debug.Notification( "Drained until you take a nap" )
	endif
	i = MilkQ.MILKmaid.find(akTarget)
	if i != -1
		if !MilkQ.MilkQC.Buffs
			if akTarget.HasSpell(MilkQ.MilkExhaustion)
				akTarget.RemoveSpell( MilkQ.MilkExhaustion )
			endif
			if akTarget.HasSpell(MilkQ.MilkMentalExhaustion)
				akTarget.RemoveSpell( MilkQ.MilkMentalExhaustion )
			endif
		else
			RegisterForSleep()
		endif
	else
		if akTarget.HasSpell(MilkQ.MilkExhaustion)
			akTarget.RemoveSpell( MilkQ.MilkExhaustion )
		endif
		if akTarget.HasSpell(MilkQ.MilkMentalExhaustion)
			akTarget.RemoveSpell( MilkQ.MilkMentalExhaustion )
		endif
	endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	SleepStartTime = afSleepStartTime
EndEvent

Event OnSleepStop ( bool abInterrupted )
	int scriptupdatetimes = ((Math.Floor(Utility.GetCurrentGameTime()*24)) - (Math.Floor(SleepStartTime*24)))
	if scriptupdatetimes >= 6 - MilkQ.ExhaustionSleepMod && !abInterrupted
		if MilkQ.MILKmaid[i].HasSpell(MilkQ.MilkExhaustion)
			MilkQ.MILKmaid[i].RemoveSpell( MilkQ.MilkExhaustion )
		endif
		if MilkQ.MILKmaid[i].HasSpell(MilkQ.MilkMentalExhaustion)
			MilkQ.MILKmaid[i].RemoveSpell( MilkQ.MilkMentalExhaustion )
		endif
		If MilkQ.PlayerREF == MilkQ.MILKmaid[i] && MilkQ.MilkMsgs
			Debug.Notification("You have rested enough")
		endif
	endif
EndEvent