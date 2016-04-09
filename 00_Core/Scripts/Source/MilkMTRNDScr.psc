Scriptname MilkMTRNDScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;dummy variables
GlobalVariable Property RND_ThirstPoints = None Auto Hidden 
GlobalVariable Property RND_ThirstPointsPerHour = None Auto Hidden 
GlobalVariable Property RND_ThirstLastUpdateTimeStamp = None Auto Hidden 
GlobalVariable Property RND_WaterPoints = None Auto Hidden 

GlobalVariable Property RND_State = None Auto Hidden 
GlobalVariable Property RND_AnimDrink = None Auto Hidden 
GlobalVariable Property RND_1stPersonMsg = None Auto Hidden 

Idle Property idleDrink = None Auto Hidden 
Idle Property ChairDrinkingStart = None Auto Hidden 
Idle Property idleStop_Loose = None Auto Hidden 

Spell Property RND_ThirstSpell00 = None Auto Hidden 
Spell Property RND_ThirstSpell01 = None Auto Hidden 
Spell Property RND_ThirstSpell02 = None Auto Hidden 
Spell Property RND_ThirstSpell03 = None Auto Hidden 
Spell Property RND_ThirstSpell04 = None Auto Hidden 

GlobalVariable Property RND_ThirstLevel00 = None Auto Hidden 
GlobalVariable Property RND_ThirstLevel01 = None Auto Hidden 
GlobalVariable Property RND_ThirstLevel02 = None Auto Hidden 
GlobalVariable Property RND_ThirstLevel03 = None Auto Hidden 
GlobalVariable Property RND_ThirstLevel04 = None Auto Hidden 

Message Property RND_ThirstLevel00ConsumeMessage = None Auto Hidden 
Message Property RND_ThirstLevel01ConsumeMessage = None Auto Hidden 
Message Property RND_ThirstLevel02ConsumeMessage = None Auto Hidden 
Message Property RND_ThirstLevel03ConsumeMessage = None Auto Hidden 
Message Property RND_ThirstLevel04ConsumeMessage = None Auto Hidden 

Message Property RND_ThirstLevel00ConsumeMessageB = None Auto Hidden 
Message Property RND_ThirstLevel01ConsumeMessageB = None Auto Hidden 
Message Property RND_ThirstLevel02ConsumeMessageB = None Auto Hidden 
Message Property RND_ThirstLevel03ConsumeMessageB = None Auto Hidden 
Message Property RND_ThirstLevel04ConsumeMessageB = None Auto Hidden 

Potion Property RND_EmptyBottle03 = None Auto Hidden 

;----------------------------------------------------------------------------
;on drink
Event OnEffectStart( Actor akTarget, Actor akCaster )
	Actor PlayerRef = Game.GetPlayer()

	if MilkQ.Plugin_RealisticNeedsandDiseases && PlayerREF == akTarget
		;fill RND variables
		RND_ThirstPoints = Game.GetFormFromFile(0x2e07, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ThirstPointsPerHour = Game.GetFormFromFile(0x2e08, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ThirstLastUpdateTimeStamp = Game.GetFormFromFile(0x2e09, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_WaterPoints = Game.GetFormFromFile(0x6f16, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_AnimDrink = Game.GetFormFromFile(0x24489, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_1stPersonMsg = Game.GetFormFromFile(0x900ca, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_State = Game.GetFormFromFile(0x12c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable

		idleDrink = Game.GetFormFromFile(0xfd68b, "Skyrim.esm") as Idle
		ChairDrinkingStart = Game.GetFormFromFile(0x65d07, "Skyrim.esm") as Idle
		idleStop_Loose = Game.GetFormFromFile(0x10d9ee, "Skyrim.esm") as Idle

		RND_ThirstSpell00 = Game.GetFormFromFile(0x1da1, "RealisticNeedsandDiseases.esp") as Spell
		RND_ThirstSpell01 = Game.GetFormFromFile(0x1da3, "RealisticNeedsandDiseases.esp") as Spell
		RND_ThirstSpell02 = Game.GetFormFromFile(0x1da5, "RealisticNeedsandDiseases.esp") as Spell
		RND_ThirstSpell03 = Game.GetFormFromFile(0x2dfa, "RealisticNeedsandDiseases.esp") as Spell
		RND_ThirstSpell04 = Game.GetFormFromFile(0x2dfc, "RealisticNeedsandDiseases.esp") as Spell

		RND_ThirstLevel00 = Game.GetFormFromFile(0x2e0a, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ThirstLevel01 = Game.GetFormFromFile(0x2e0b, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ThirstLevel02 = Game.GetFormFromFile(0x2e0c, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ThirstLevel03 = Game.GetFormFromFile(0x2e0d, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ThirstLevel04 = Game.GetFormFromFile(0x2e0e, "RealisticNeedsandDiseases.esp") as GlobalVariable

		RND_ThirstLevel00ConsumeMessage = Game.GetFormFromFile(0x5ecc, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel01ConsumeMessage = Game.GetFormFromFile(0x5ecd, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel02ConsumeMessage = Game.GetFormFromFile(0x5ece, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel03ConsumeMessage = Game.GetFormFromFile(0x5ecf, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel04ConsumeMessage = Game.GetFormFromFile(0x5ed0, "RealisticNeedsandDiseases.esp") as Message

		RND_ThirstLevel00ConsumeMessageB = Game.GetFormFromFile(0x90b97, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel01ConsumeMessageB = Game.GetFormFromFile(0x90b98, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel02ConsumeMessageB = Game.GetFormFromFile(0x90b99, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel03ConsumeMessageB = Game.GetFormFromFile(0x90b96, "RealisticNeedsandDiseases.esp") as Message
		RND_ThirstLevel04ConsumeMessageB = Game.GetFormFromFile(0x90b95, "RealisticNeedsandDiseases.esp") as Message

		RND_EmptyBottle03 = Game.GetFormFromFile(0x43b4, "RealisticNeedsandDiseases.esp") as Potion

		;run rnd script
		if RND_State.GetValue() == 1
				; drink water
				int AdjPoints = Utility.RandomInt(-5,5)
				RND_ThirstPoints.SetValue(RND_ThirstPoints.GetValue() - RND_WaterPoints.GetValue() - AdjPoints)

				if RND_ThirstPoints.GetValue() > RND_ThirstLevel04.GetValue()
					RND_ThirstPoints.SetValue(RND_ThirstLevel04.GetValue())
				elseif RND_ThirstPoints.GetValue() < 0
					RND_ThirstPoints.SetValue(0)
				endif
			
				RND_ThirstLastUpdateTimeStamp.SetValue(Utility.GetCurrentGameTime())
			
				; new spell to add
				Spell ThirstSpell = RND_ThirstSpell02
				Message ThirstLevelMessage = None
			
				if RND_ThirstPoints.GetValue() < RND_ThirstLevel01.GetValue()
					ThirstSpell = RND_ThirstSpell00
					if RND_1stPersonMsg.GetValue() == 1
						ThirstLevelMessage = RND_ThirstLevel00ConsumeMessage
					else
						ThirstLevelMessage = RND_ThirstLevel00ConsumeMessageB
					endif
			
				elseif RND_ThirstPoints.GetValue() >= RND_ThirstLevel01.GetValue() && RND_ThirstPoints.GetValue() < RND_ThirstLevel02.GetValue()
					ThirstSpell = RND_ThirstSpell01
					if RND_1stPersonMsg.GetValue() == 1
						ThirstLevelMessage = RND_ThirstLevel01ConsumeMessage
					else
						ThirstLevelMessage = RND_ThirstLevel01ConsumeMessageB
					endif
			
				elseif RND_ThirstPoints.GetValue() >= RND_ThirstLevel02.GetValue() && RND_ThirstPoints.GetValue() < RND_ThirstLevel03.GetValue()
					ThirstSpell = RND_ThirstSpell02
					if RND_1stPersonMsg.GetValue() == 1
						ThirstLevelMessage = RND_ThirstLevel02ConsumeMessage
					else
						ThirstLevelMessage = RND_ThirstLevel02ConsumeMessageB
					endif
			
				elseif RND_ThirstPoints.GetValue() >= RND_ThirstLevel03.GetValue() && RND_ThirstPoints.GetValue() < RND_ThirstLevel04.GetValue()
					ThirstSpell = RND_ThirstSpell03
					if RND_1stPersonMsg.GetValue() == 1
						ThirstLevelMessage = RND_ThirstLevel03ConsumeMessage
					else
						ThirstLevelMessage = RND_ThirstLevel03ConsumeMessageB
					endif
			
				elseif RND_ThirstPoints.GetValue() >= RND_ThirstLevel04.GetValue() 
					ThirstSpell = RND_ThirstSpell04
					if RND_1stPersonMsg.GetValue() == 1
						ThirstLevelMessage = RND_ThirstLevel04ConsumeMessage
					else
						ThirstLevelMessage = RND_ThirstLevel04ConsumeMessageB
					endif
			
				endif
			
				if PlayerREF.HasSpell(ThirstSpell)
					ThirstLevelMessage.Show()
				else
					RemoveThirstSpells()
					PlayerREF.AddSpell(ThirstSpell, false)
					ThirstLevelMessage.Show()
				endif
				
			akTarget.AddItem(RND_EmptyBottle03, 1, true)

			if RND_AnimDrink.GetValue() == 1 && idleDrink
				if !PlayerREF.GetAnimationVariableInt("i1stPerson") == 1
					if PlayerREF.GetSitState() == 3
						PlayerREF.PlayIdle(ChairDrinkingStart)
						Utility.Wait(10)
						PlayerREF.PlayIdle(idleStop_Loose)
					else
						PlayerREF.PlayIdle(idleDrink)
					endif
				endif
			endif
		endif
	endif
EndEvent

Function RemoveThirstSpells()
	Actor PlayerRef = Game.GetPlayer()
	PlayerRef.RemoveSpell(RND_ThirstSpell00)
	PlayerRef.RemoveSpell(RND_ThirstSpell01)
	PlayerRef.RemoveSpell(RND_ThirstSpell02)
	PlayerRef.RemoveSpell(RND_ThirstSpell03)
	PlayerRef.RemoveSpell(RND_ThirstSpell04)
EndFunction
