Scriptname MME_BreastReducePotion extends activemagiceffect Hidden

Event OnEffectStart( Actor akTarget, Actor akCaster )
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	
	if MilkQ.MILKmaid.find(akTarget) != -1 || MilkQ.MILKSlave.Find(akTarget) != -1
		StorageUtil.AdjustFloatValue(akTarget, "MME.MilkMaid.BreastBaseModPotion", -0.1)
	endif
EndEvent