Scriptname MME_BodyMod extends Quest

Function SetNodeScale(Actor akActor, string nodeName, float value)
	string modName = "MilkModEconomy"
	bool isFemale = false
	if akActor.GetLeveledActorBase().GetSex() == 1
		isFemale = true
	Else
		isFemale = false
	endif
	
	;Debug.Notification(akActor.GetLeveledActorBase().GetName() + " MME_BodyMod Scaling " + nodeName + " to " + value)
	if NetImmerse.HasNode(akActor, nodeName, false)
		MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
		If SKSE.GetPluginVersion("NiOverride") >= 3 && NiOverride.GetScriptVersion() >= 2 && MilkQ.BreastScale == 0		;nioverride, if value = 1, mod is removed from skse nio scaling
			if akActor == Game.GetPlayer()																				;update 1st person view/skeleton (player only)
				If value != 1.0
					NiOverride.AddNodeTransformScale(akActor, true, isFemale, nodeName, modName, value)
				Else
					NiOverride.RemoveNodeTransformScale(akActor, true, isFemale, nodeName, modName)
				Endif
				NiOverride.UpdateNodeTransform(akActor, true, isFemale, nodeName)
			endif
			If value != 1.0																								;update 3rd person view/skeleton (player & NPCs)
				NiOverride.AddNodeTransformScale(akActor, false, isFemale, nodeName, modName, value)
			Else
				NiOverride.RemoveNodeTransformScale(akActor, false, isFemale, nodeName, modName)
			Endif
			NiOverride.UpdateNodeTransform(akActor, false, isFemale, nodeName)
		ElseIf akActor.IsInLocation(Game.GetPlayer().getCurrentLocation())												;else netimmerse
			if akActor == Game.GetPlayer()																				;update 1st person view/skeleton (player only)
				NetImmerse.SetNodeScale(akActor, nodeName, value, true)
			Endif
			NetImmerse.SetNodeScale(akActor, nodeName, value, false)													;update 3rd person view/skeleton (player & NPCs)
		Endif
	Endif
EndFunction
