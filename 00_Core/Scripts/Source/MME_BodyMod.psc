Scriptname MME_BodyMod extends Quest

Function SetNodeScale(Actor akActor, string nodeName, float value)
	string modName = "MilkModEconomy"
	;Debug.Notification(akActor.GetLeveledActorBase().GetName() + " MME_BodyMod Scaling " + nodeName + " to " + value)
	
;	If Game.GetModbyName("SexLab Inflation Framework.esp") != 255
;		string SLIF_modName = "Milk Mod Economy"
;		If nodeName == "NPC L Breast"
;			SLIF_Main.inflateBoth(akActor, SLIF_modName, "slif_breast", value, -1, -1, modName, 1.0, 100.0, 1.0, 0.1)
;		ElseIf nodeName == "NPC L Breast01"
;			SLIF_Main.inflateBoth(akActor, SLIF_modName, "slif_breast01", value, -1, -1, modName, 1.0, 100.0, 1.0, 0.1)
;		ElseIf nodeName == "NPC L Breast P1"
;			SLIF_Main.inflateBoth(akActor, SLIF_modName, "slif_breast_p", value, -1, -1, modName, 1.0, 100.0, 1.0, 0.1)
;		ElseIf nodeName == "NPC L GenitalsScrotum [LGenScrot]"
;			SLIF_Main.inflateBoth(akActor, SLIF_modName, "slif_scrotum", value, -1, -1, modName, 1.0, 100.0, 1.0, 0.1)
;		ElseIf nodeName == "NPC Belly"
;			SLIF_Main.inflate(akActor, SLIF_modName, "NPC Belly", value, -1, -1, modName, 1.0, 100.0, 1.0, 0.1)
;		EndIf
;	ElseIf NetImmerse.HasNode(akActor, nodeName, false)

	If NetImmerse.HasNode(akActor, nodeName, false)
		MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
		bool isFemale = false
		if akActor.GetLeveledActorBase().GetSex() == 1
			isFemale = true
		Else
			isFemale = false
		endif
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
