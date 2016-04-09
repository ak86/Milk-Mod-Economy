Scriptname MilkForSprigganScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
;nursing/milking cast
Event OnEffectStart( Actor akTarget, Actor akCaster )
	IF !akTarget.HasSpell( MilkQ.BeingMilkedPassive ) && !akTarget.IsInCombat() && !akTarget.IsOnMount()
		MilkQ.Milking(akTarget, 0, 1, 1)
	ELSEIF !akTarget.HasSpell( MilkQ.BeingMilkedPassive ) && (akTarget.IsInCombat() || akTarget.IsOnMount())
		MilkQ.Milking(akTarget, 0, 4, 0)
	ENDIF
EndEvent