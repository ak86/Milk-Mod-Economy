Scriptname MilkMakeMilkMaidScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart( Actor akTarget, Actor akCaster )
	IF MilkQ.MILKmaid.find(akTarget) == -1 && MilkQ.MILKslave.find(akTarget) == -1
		MilkQ.AssignSlot(akTarget)
	ELSEIF MilkQ.MILKmaid.find(akTarget) != -1
		debug.Notification( "Target is already milkmaid" )
	ELSE 
		debug.Notification( "Target is already milkslave" )
	ENDIF
EndEvent