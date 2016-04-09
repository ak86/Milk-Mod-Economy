Scriptname MilkPUMP_B extends ObjectReference

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
EVENT OnActivate(ObjectReference akActionRef)
	Actor akActor = akActionRef as Actor
	IF !akActor.HasSpell( MilkQ.BeingMilkedPassive ) && akActor.GetSitState() <= 3 && akActor.GetSitState() > 0
		if akActor == MilkQ.PlayerRef
			Game.ForceThirdPerson()
		endif
		MilkQ.Milking(akActor, 0, 0, 1)
	ENDIF
ENDEVENT