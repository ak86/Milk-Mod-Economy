Scriptname MME_BodyMod extends Quest Hidden

Function SetNodeScale(Actor akActor, string nodeName, float value, bool isFemale)
	string modName = "MilkModEconomy"
	If nodeName == "NPC L Breast"
		SetMorphScale(akActor, "Breasts", value)
		SetMorphScale(akActor, "BreastsSH", value)
		SetMorphScale(akActor, "BreastsSSH", value)
		SetMorphScale(akActor, "BreastGravity", value)
		SetMorphScale(akActor, "NippleAreola", value)
		SetMorphScale(akActor, "DoubleMelon", value)
		SetMorphScale(akActor, "BreastsFantasy", value)
		SetMorphScale(akActor, "NipplePerkiness", value)
		SetMorphScale(akActor, "NippleLength", value)
	ElseIf nodeName == "NPC Belly"
		SetMorphScale(akActor, "PregnancyBelly", value)
	EndIf
EndFunction

Function RemoveNiONodeScale(Actor akActor, string nodeName, bool isFemale)
	string modName = "MilkModEconomy"
	If nodeName == "NPC L Breast"
		ClearMorphScale(akActor, "Breasts")
		ClearMorphScale(akActor, "BreastsSH")
		ClearMorphScale(akActor, "BreastsSSH")
		ClearMorphScale(akActor, "BreastGravity")
		
		ClearMorphScale(akActor, "NippleAreola")
		ClearMorphScale(akActor, "DoubleMelon")
		ClearMorphScale(akActor, "BreastsFantasy")
		ClearMorphScale(akActor, "NipplePerkiness")
		ClearMorphScale(akActor, "NippleLength")
	ElseIf nodeName == "NPC Belly"
		ClearMorphScale(akActor, "PregnancyBelly")
	EndIf
EndFunction

Function SetMorphScale(Actor akActor, string nodeName, float value)
	string modName = "MilkModEconomy"
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	
	;SE bodyslide notes:
	;BreastsSH changed to BreastsNewSH
	;BreastsSSH doesnt exist in SE
	;BreastGravity changed to BreastGravity2
	;NippleAreola changed to AreolaSize
	;try to scale all nodes for se converted/legacy armors
	
	;NetImmerse-Bodyslide converter
	float bodyslide_value = (value - 1)
	float bodyslide_divider_breast = (MilkQ.BoobMAX)
	float bodyslide_divider_belly = (5)
	
	if bodyslide_value < 0
		bodyslide_value = 0
	endif
	if bodyslide_divider_breast < 1
		bodyslide_divider_breast = 1
	endif
	if bodyslide_divider_belly < 1
		bodyslide_divider_belly = 1
	endif
	
	
	;breast scale
	If nodeName == "Breasts"
		NiOverride.SetBodyMorph(akActor, "Breasts", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
	ElseIf nodeName == "BreastsSH"
		NiOverride.SetBodyMorph(akActor, "BreastsSH", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
		NiOverride.SetBodyMorph(akActor, "BreastsNewSH", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
	ElseIf nodeName == "BreastsSSH"
		NiOverride.SetBodyMorph(akActor, "BreastsSSH", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
	ElseIf nodeName == "BreastGravity"
		NiOverride.SetBodyMorph(akActor, "BreastGravity", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
		NiOverride.SetBodyMorph(akActor, "BreastGravity2", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
	ElseIf nodeName == "NippleAreola"
		NiOverride.SetBodyMorph(akActor, "NippleAreola", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))
		NiOverride.SetBodyMorph(akActor, "AreolaSize", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_breast, 0, 1))

	;belly scale
	ElseIf nodeName == "PregnancyBelly"
		NiOverride.SetBodyMorph(akActor, "PregnancyBelly", modName, PapyrusUtil.ClampFloat(bodyslide_value / bodyslide_divider_belly, 0, 1))

	;breast(milk) scale
	ElseIf nodeName == "DoubleMelon"
		NiOverride.SetBodyMorph(akActor, "DoubleMelon", modName, PapyrusUtil.ClampFloat((value) / (bodyslide_divider_breast), 0, 1))
	ElseIf nodeName == "BreastsFantasy"
		NiOverride.SetBodyMorph(akActor, "BreastsFantasy", modName, PapyrusUtil.ClampFloat((value) / (bodyslide_divider_breast), 0, 1))
	ElseIf nodeName == "NipplePerkiness"
		NiOverride.SetBodyMorph(akActor, "NipplePerkiness", modName, PapyrusUtil.ClampFloat((value) / (bodyslide_divider_breast), 0, 1))
	ElseIf nodeName == "NippleLength"
		NiOverride.SetBodyMorph(akActor, "NippleLength", modName, PapyrusUtil.ClampFloat((value) / (bodyslide_divider_breast), 0, 1))
	EndIf
	NiOverride.UpdateModelWeight(akActor)
EndFunction

Function ClearMorphScale(Actor akActor, string nodeName)
	string modName = "MilkModEconomy"

	If nodeName == "Breasts"
		NiOverride.ClearBodyMorph(akActor, "Breasts", modName)
	ElseIf nodeName == "BreastsSH"
		NiOverride.ClearBodyMorph(akActor, "BreastsNewSH", modName)
		NiOverride.ClearBodyMorph(akActor, "BreastsSH", modName)
	ElseIf nodeName == "BreastsSSH"
		NiOverride.ClearBodyMorph(akActor, "BreastsSSH", modName)
	ElseIf nodeName == "BreastGravity"
		NiOverride.ClearBodyMorph(akActor, "BreastGravity", modName)
		NiOverride.ClearBodyMorph(akActor, "BreastGravity2", modName)
	ElseIf nodeName == "NippleAreola"
		NiOverride.ClearBodyMorph(akActor, "NippleAreola", modName)
		NiOverride.ClearBodyMorph(akActor, "AreolaSize", modName)
		
	ElseIf nodeName == "PregnancyBelly"
		NiOverride.ClearBodyMorph(akActor, "PregnancyBelly", modName)

	ElseIf nodeName == "DoubleMelon"
		NiOverride.ClearBodyMorph(akActor, "DoubleMelon", modName)
	ElseIf nodeName == "BreastsFantasy"
		NiOverride.ClearBodyMorph(akActor, "BreastsFantasy", modName)
	ElseIf nodeName == "NipplePerkiness"
		NiOverride.ClearBodyMorph(akActor, "NipplePerkiness", modName)
	ElseIf nodeName == "NippleLength"
		NiOverride.ClearBodyMorph(akActor, "NippleLength", modName)
	EndIf
	NiOverride.UpdateModelWeight(akActor)
EndFunction