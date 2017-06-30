Scriptname MilkPUMP_B extends ObjectReference

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
EVENT OnActivate(ObjectReference akActionRef)
	Actor akActor = akActionRef as Actor
	IF !akActor.HasSpell( MilkQ.BeingMilkedPassive ) && akActor.GetSitState() <= 3 && akActor.GetSitState() > 0
		if akActor == MilkQ.PlayerRef
			;akActor.SetRestrained()		;Flags this actor as restrained or not. Restrained actors will not move from their current position, but will continue to "think" (pick packages, run detection so they could yell alarms) and go into dialogue.
			;akActor.Setunconscious(true)	;stand in place as if it's in a trance or their AI is disabled, wakeup if health is low
			Game.SetPlayerAIDriven(true)
			Game.DisablePlayerControls()
			Game.ForceThirdPerson()
		endif
		MilkQ.Milking(akActor, 0, 0, 1)
	ENDIF
ENDEVENT