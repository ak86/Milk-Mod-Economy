Scriptname MilkBreastReducePotion extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
;on drink
Event OnEffectStart( Actor akTarget, Actor akCaster )
	if MilkQ.MILKmaid.find(akTarget) != -1 || MilkQ.MILKSlave.Find(akTarget) != -1
		StorageUtil.AdjustFloatValue(akTarget, "MME.MilkMaid.BreastBaseModPotion", -0.1)
	endif
EndEvent