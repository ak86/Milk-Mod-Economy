Scriptname MilkWerewolfScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart( Actor akTarget, Actor akCaster )
	CompanionsHousekeepingScript WereWolfQuest = Quest.GetQuest("C00") as CompanionsHousekeepingScript

	if akTarget == MilkQ.PlayerRef && MilkQ.MilkWerewolfTransform
		int ButtonPressed = (Game.GetFormFromFile(0x4E562, "MilkModNEW.esp") as message).Show()
		if ButtonPressed == 0
			WereWolfQuest.BeastForm.Cast(akTarget)
			if MilkQ.MILKmaid.find(akTarget) != -1
				Utility.Wait(10.0)
				MilkQ.CurrentSize(akTarget)
			endif
		endif
	endif
EndEvent