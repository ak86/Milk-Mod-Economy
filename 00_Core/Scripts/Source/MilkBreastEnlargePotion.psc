Scriptname MilkBreastEnlargePotion extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
;on drink
Event OnEffectStart( Actor akTarget, Actor akCaster )
	if MilkQ.MILKmaid.find(akTarget) != -1 || MilkQ.MILKSlave.Find(akTarget) != -1
		StorageUtil.AdjustFloatValue(akTarget, "MME.MilkMaid.BreastBaseModPotion", 0.1)
		if Utility.RandomInt(0, 100) < 25
			if StorageUtil.GetFloatValue(akTarget, "MME.MilkMaid.MilkGen") == 0 
				debug.Notification(akTarget.GetLeveledActorBase().GetName() + "'s breasts has started lactating.")
				StorageUtil.AdjustFloatValue(akTarget, "MME.MilkMaid.MilkGen", 1/3/10)
				MilkQ.AddMilkFx(akTarget, 1)
				MilkQ.AddLeak(akTarget)
			endif
		endif
	endif
EndEvent