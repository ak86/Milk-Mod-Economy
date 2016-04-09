Scriptname MilkSuccubusScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
;increase arousal by 25 for everyone in close range(500)
;----------------------------------------------------------------------------
	
Event OnEffectStart( Actor akTarget, Actor akCaster )
	if akTarget == MilkQ.PlayerRef && MilkQ.MilkSuccubusTransform
	
		Cell akTargetCell = MilkQ.PlayerREF.GetParentCell()
		int iRef = 0
		while iRef <= akTargetCell.getNumRefs(43) ;GetType() 62-char,44-lvchar,43-npc
			Actor aNPC = akTargetCell.getNthRef(iRef, 43) as Actor
			If aNPC.GetDistance(akTarget) < 500 
				MilkQ.SLA.UpdateActorExposure(aNPC, 25)
			EndIf
			iRef = iRef + 1
		endWhile
	endif
EndEvent