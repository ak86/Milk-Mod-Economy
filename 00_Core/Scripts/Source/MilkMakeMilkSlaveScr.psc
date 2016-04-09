Scriptname MilkMakeMilkSlaveScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart( Actor akTarget, Actor akCaster )
	IF MilkQ.MILKmaid.find(akTarget) == -1 && MilkQ.MILKslave.find(akTarget) == -1
		MilkQ.AssignSlotSlave(akTarget, 0, 0)
	ELSEIF MilkQ.MILKmaid.find(akTarget) != -1
		debug.Notification( "Target is already milkmaid" )
	ELSE 
		debug.Notification( "Target is already milkslave" )
	ENDIF
EndEvent