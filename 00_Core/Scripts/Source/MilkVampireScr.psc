Scriptname MilkVampireScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart( Actor akTarget, Actor akCaster )
	PlayerVampireQuestScript VampireQuest = Quest.GetQuest("PlayerVampireQuest") as PlayerVampireQuestScript

	if akTarget == MilkQ.PlayerRef && MilkQ.MilkVampireTransform && MilkQ.Plugin_Dawnguard
		int ButtonPressed = ((Game.GetFormFromFile(0x4E562, "MilkModNEW.esp")) as message).Show()
		if ButtonPressed == 0
			VampireQuest.DLC1VampireChange.Cast(akTarget)		; this line needs dawnguard extracted script PlayerVampireQuestScript or better vampires 6.6+ with loose files
			if MilkQ.MILKmaid.find(akTarget) != -1
				Utility.Wait(10.0)
				MilkQ.CurrentSize(akTarget)
			endif
		endif
	endif
EndEvent