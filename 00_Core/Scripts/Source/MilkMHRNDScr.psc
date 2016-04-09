Scriptname MilkMHRNDScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;dummy variables
GlobalVariable Property RND_HungerPoints = None Auto Hidden 
GlobalVariable Property RND_HungerPointsPerHour = None Auto Hidden 
GlobalVariable Property RND_HungerLastUpdateTimeStamp = None Auto Hidden 
GlobalVariable Property RND_FoodPoints = None Auto Hidden 
GlobalVariable Property RND_ForceSatiation = None Auto Hidden 

GlobalVariable Property RND_State = None Auto Hidden 
GlobalVariable Property RND_1stPersonMsg = None Auto Hidden 

Spell Property RND_HungerSpell00 = None Auto Hidden 
Spell Property RND_HungerSpell01 = None Auto Hidden 
Spell Property RND_HungerSpell02 = None Auto Hidden 
Spell Property RND_HungerSpell03 = None Auto Hidden 
Spell Property RND_HungerSpell04 = None Auto Hidden 
Spell Property RND_HungerSpell05 = None Auto Hidden 

GlobalVariable Property RND_HungerLevel00 = None Auto Hidden 
GlobalVariable Property RND_HungerLevel01 = None Auto Hidden 
GlobalVariable Property RND_HungerLevel02 = None Auto Hidden 
GlobalVariable Property RND_HungerLevel03 = None Auto Hidden 
GlobalVariable Property RND_HungerLevel04 = None Auto Hidden 
GlobalVariable Property RND_HungerLevel05 = None Auto Hidden 

Message Property RND_HungerLevel00ConsumeMessage = None Auto Hidden 
Message Property RND_HungerLevel01ConsumeMessage = None Auto Hidden 
Message Property RND_HungerLevel02ConsumeMessage = None Auto Hidden 
Message Property RND_HungerLevel03ConsumeMessage = None Auto Hidden 
Message Property RND_HungerLevel04ConsumeMessage = None Auto Hidden 
Message Property RND_HungerLevel05ConsumeMessage = None Auto Hidden 

Message Property RND_HungerLevel00ConsumeMessageB = None Auto Hidden 
Message Property RND_HungerLevel01ConsumeMessageB = None Auto Hidden 
Message Property RND_HungerLevel02ConsumeMessageB = None Auto Hidden 
Message Property RND_HungerLevel03ConsumeMessageB = None Auto Hidden 
Message Property RND_HungerLevel04ConsumeMessageB = None Auto Hidden 
Message Property RND_HungerLevel05ConsumeMessageB = None Auto Hidden 

;----------------------------------------------------------------------------
;on drink
Event OnEffectStart( Actor akTarget, Actor akCaster )
	Actor PlayerRef = Game.GetPlayer()
	
	if MilkQ.Plugin_RealisticNeedsandDiseases && PlayerREF == akTarget
		;fill RND variables
		RND_HungerPoints = Game.GetFormFromFile(0x2884, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerPointsPerHour = Game.GetFormFromFile(0x2de7, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerLastUpdateTimeStamp = Game.GetFormFromFile(0x2de8, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_FoodPoints = Game.GetFormFromFile(0x6f1e, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_1stPersonMsg = Game.GetFormFromFile(0x900ca, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_State = Game.GetFormFromFile(0x12c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_ForceSatiation = Game.GetFormFromFile(0x536D7, "RealisticNeedsandDiseases.esp") as GlobalVariable
		
		RND_HungerSpell00 = Game.GetFormFromFile(0x1d97, "RealisticNeedsandDiseases.esp") as Spell
		RND_HungerSpell01 = Game.GetFormFromFile(0x1d99, "RealisticNeedsandDiseases.esp") as Spell
		RND_HungerSpell02 = Game.GetFormFromFile(0x1d9b, "RealisticNeedsandDiseases.esp") as Spell
		RND_HungerSpell03 = Game.GetFormFromFile(0x1d9d, "RealisticNeedsandDiseases.esp") as Spell
		RND_HungerSpell04 = Game.GetFormFromFile(0x231b, "RealisticNeedsandDiseases.esp") as Spell
		RND_HungerSpell05 = Game.GetFormFromFile(0x231c, "RealisticNeedsandDiseases.esp") as Spell

		RND_HungerLevel00 = Game.GetFormFromFile(0x2de9, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerLevel01 = Game.GetFormFromFile(0x2dea, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerLevel02 = Game.GetFormFromFile(0x2deb, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerLevel03 = Game.GetFormFromFile(0x2dec, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerLevel04 = Game.GetFormFromFile(0x2ded, "RealisticNeedsandDiseases.esp") as GlobalVariable
		RND_HungerLevel05 = Game.GetFormFromFile(0x2dee, "RealisticNeedsandDiseases.esp") as GlobalVariable

		RND_HungerLevel00ConsumeMessage = Game.GetFormFromFile(0x53f5, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel01ConsumeMessage = Game.GetFormFromFile(0x53f6, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel02ConsumeMessage = Game.GetFormFromFile(0x53f7, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel03ConsumeMessage = Game.GetFormFromFile(0x53f8, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel04ConsumeMessage = Game.GetFormFromFile(0x53f9, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel05ConsumeMessage = Game.GetFormFromFile(0x53fa, "RealisticNeedsandDiseases.esp") as Message

		RND_HungerLevel00ConsumeMessageB = Game.GetFormFromFile(0x900c4, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel01ConsumeMessageB = Game.GetFormFromFile(0x900c5, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel02ConsumeMessageB = Game.GetFormFromFile(0x900c6, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel03ConsumeMessageB = Game.GetFormFromFile(0x900c7, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel04ConsumeMessageB = Game.GetFormFromFile(0x900c8, "RealisticNeedsandDiseases.esp") as Message
		RND_HungerLevel05ConsumeMessageB = Game.GetFormFromFile(0x900c9, "RealisticNeedsandDiseases.esp") as Message

		;run rnd script
		if RND_State.GetValue() == 1
				; drink water
				int AdjPoints = Utility.RandomInt(-5,5)
				float HungerPoints = RND_HungerPoints.GetValue()
				RND_HungerPoints.SetValue(RND_HungerPoints.GetValue() - RND_FoodPoints.GetValue() - AdjPoints)

				if RND_ForceSatiation.GetValue() == 1
					if HungerPoints >= RND_HungerLevel02.GetValue() && RND_HungerPoints.GetValue() < RND_HungerLevel01.GetValue()
						RND_HungerPoints.SetValue(RND_HungerLevel01.GetValue())
					endif
				endif

				if RND_HungerPoints.GetValue() > RND_HungerLevel05.GetValue()
					RND_HungerPoints.SetValue(RND_HungerLevel05.GetValue())
				elseif RND_HungerPoints.GetValue() < 0
					RND_HungerPoints.SetValue(0)
				endif
			
				RND_HungerLastUpdateTimeStamp.SetValue(Utility.GetCurrentGameTime())
			
				; new spell to add
				Spell HungerSpell = RND_HungerSpell02
				Message HungerLevelMessage = None
			
				if RND_HungerPoints.GetValue() < RND_HungerLevel01.GetValue()
					HungerSpell = RND_HungerSpell00
					if RND_1stPersonMsg.GetValue() == 1
						HungerLevelMessage = RND_HungerLevel00ConsumeMessage
					else
						HungerLevelMessage = RND_HungerLevel00ConsumeMessageB
					endif
			
				elseif RND_HungerPoints.GetValue() >= RND_HungerLevel01.GetValue() && RND_FoodPoints.GetValue() < RND_HungerLevel02.GetValue()
					HungerSpell = RND_HungerSpell01
					if RND_1stPersonMsg.GetValue() == 1
						HungerLevelMessage = RND_HungerLevel01ConsumeMessage
					else
						HungerLevelMessage = RND_HungerLevel01ConsumeMessageB
					endif
			
				elseif RND_HungerPoints.GetValue() >= RND_HungerLevel02.GetValue() && RND_FoodPoints.GetValue() < RND_HungerLevel03.GetValue()
					HungerSpell = RND_HungerSpell02
					if RND_1stPersonMsg.GetValue() == 1
						HungerLevelMessage = RND_HungerLevel02ConsumeMessage
					else
						HungerLevelMessage = RND_HungerLevel02ConsumeMessageB
					endif
			
				elseif RND_HungerPoints.GetValue() >= RND_HungerLevel03.GetValue() && RND_FoodPoints.GetValue() < RND_HungerLevel04.GetValue()
					HungerSpell = RND_HungerSpell03
					if RND_1stPersonMsg.GetValue() == 1
						HungerLevelMessage = RND_HungerLevel03ConsumeMessage
					else
						HungerLevelMessage = RND_HungerLevel03ConsumeMessageB
					endif
			
				elseif RND_HungerPoints.GetValue() >= RND_HungerLevel04.GetValue() 
					HungerSpell = RND_HungerSpell04
					if RND_1stPersonMsg.GetValue() == 1
						HungerLevelMessage = RND_HungerLevel04ConsumeMessage
					else
						HungerLevelMessage = RND_HungerLevel04ConsumeMessageB
					endif
			
				elseif RND_HungerPoints.GetValue() >= RND_HungerLevel05.GetValue()
					HungerSpell = RND_HungerSpell05
					if RND_1stPersonMsg.GetValue() == 1
						HungerLevelMessage = RND_HungerLevel05ConsumeMessage
					else
						HungerLevelMessage = RND_HungerLevel05ConsumeMessageB
					endif

				endif
			
				if PlayerREF.HasSpell(HungerSpell)
					HungerLevelMessage.Show()
				else
					RemoveHungerSpells()
					PlayerREF.AddSpell(HungerSpell, false)
					HungerLevelMessage.Show()
				endif
		endif
	endif
EndEvent

Function RemoveHungerSpells()
	Actor PlayerRef = Game.GetPlayer()
	PlayerRef.RemoveSpell(RND_HungerSpell00)
	PlayerRef.RemoveSpell(RND_HungerSpell01)
	PlayerRef.RemoveSpell(RND_HungerSpell02)
	PlayerRef.RemoveSpell(RND_HungerSpell03)
	PlayerRef.RemoveSpell(RND_HungerSpell04)
EndFunction
