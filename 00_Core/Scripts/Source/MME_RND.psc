Scriptname MME_RND extends Quest Hidden

bool Function IsIntegraged ()
	Return True
EndFunction

Function Hunger(Int mod = 0)
	GlobalVariable RND_State = Game.GetFormFromFile(0x12c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable

	if RND_State.GetValue() == 1
		Actor PlayerRef = Game.GetPlayer()
		
		GlobalVariable RND_HungerPoints = Game.GetFormFromFile(0x2884, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerPointsPerHour = Game.GetFormFromFile(0x2de7, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerLastUpdateTimeStamp = Game.GetFormFromFile(0x2de8, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_FoodPoints = Game.GetFormFromFile(0x6f1e, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_1stPersonMsg = Game.GetFormFromFile(0x900ca, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_ForceSatiation = Game.GetFormFromFile(0x536D7, "RealisticNeedsandDiseases.esp") as GlobalVariable
		
		GlobalVariable RND_HungerLevel00 = Game.GetFormFromFile(0x2de9, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerLevel01 = Game.GetFormFromFile(0x2dea, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerLevel02 = Game.GetFormFromFile(0x2deb, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerLevel03 = Game.GetFormFromFile(0x2dec, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerLevel04 = Game.GetFormFromFile(0x2ded, "RealisticNeedsandDiseases.esp") as GlobalVariable
		GlobalVariable RND_HungerLevel05 = Game.GetFormFromFile(0x2dee, "RealisticNeedsandDiseases.esp") as GlobalVariable

		Spell RND_HungerSpell00 = Game.GetFormFromFile(0x1d97, "RealisticNeedsandDiseases.esp") as Spell
		Spell RND_HungerSpell01 = Game.GetFormFromFile(0x1d99, "RealisticNeedsandDiseases.esp") as Spell
		Spell RND_HungerSpell02 = Game.GetFormFromFile(0x1d9b, "RealisticNeedsandDiseases.esp") as Spell
		Spell RND_HungerSpell03 = Game.GetFormFromFile(0x1d9d, "RealisticNeedsandDiseases.esp") as Spell
		Spell RND_HungerSpell04 = Game.GetFormFromFile(0x231b, "RealisticNeedsandDiseases.esp") as Spell
		Spell RND_HungerSpell05 = Game.GetFormFromFile(0x231c, "RealisticNeedsandDiseases.esp") as Spell

		Message RND_HungerLevel00ConsumeMessage = Game.GetFormFromFile(0x53f5, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel01ConsumeMessage = Game.GetFormFromFile(0x53f6, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel02ConsumeMessage = Game.GetFormFromFile(0x53f7, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel03ConsumeMessage = Game.GetFormFromFile(0x53f8, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel04ConsumeMessage = Game.GetFormFromFile(0x53f9, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel05ConsumeMessage = Game.GetFormFromFile(0x53fa, "RealisticNeedsandDiseases.esp") as Message

		Message RND_HungerLevel00ConsumeMessageB = Game.GetFormFromFile(0x900c4, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel01ConsumeMessageB = Game.GetFormFromFile(0x900c5, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel02ConsumeMessageB = Game.GetFormFromFile(0x900c6, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel03ConsumeMessageB = Game.GetFormFromFile(0x900c7, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel04ConsumeMessageB = Game.GetFormFromFile(0x900c8, "RealisticNeedsandDiseases.esp") as Message
		Message RND_HungerLevel05ConsumeMessageB = Game.GetFormFromFile(0x900c9, "RealisticNeedsandDiseases.esp") as Message
		
		int AdjPoints = Utility.RandomInt(-5,5)
		float HungerPoints = RND_HungerPoints.GetValue()
		RND_HungerPoints.SetValue(RND_HungerPoints.GetValue() - RND_FoodPoints.GetValue() - mod - AdjPoints)

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
	
		elseif RND_HungerPoints.GetValue() >= RND_HungerLevel01.GetValue() && RND_FoodPoints.GetValue() + mod < RND_HungerLevel02.GetValue()
			HungerSpell = RND_HungerSpell01
			if RND_1stPersonMsg.GetValue() == 1
				HungerLevelMessage = RND_HungerLevel01ConsumeMessage
			else
				HungerLevelMessage = RND_HungerLevel01ConsumeMessageB
			endif
	
		elseif RND_HungerPoints.GetValue() >= RND_HungerLevel02.GetValue() && RND_FoodPoints.GetValue() + mod < RND_HungerLevel03.GetValue()
			HungerSpell = RND_HungerSpell02
			if RND_1stPersonMsg.GetValue() == 1
				HungerLevelMessage = RND_HungerLevel02ConsumeMessage
			else
				HungerLevelMessage = RND_HungerLevel02ConsumeMessageB
			endif
	
		elseif RND_HungerPoints.GetValue() >= RND_HungerLevel03.GetValue() && RND_FoodPoints.GetValue() + mod < RND_HungerLevel04.GetValue()
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
EndFunction

Function Thirst(Int mod = 0)
	GlobalVariable RND_State = Game.GetFormFromFile(0x12c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable

		if RND_State.GetValue() == 1
			Actor PlayerRef = Game.GetPlayer()

			Idle idleDrink = Game.GetFormFromFile(0xfd68b, "Skyrim.esm") as Idle
			Idle ChairDrinkingStart = Game.GetFormFromFile(0x65d07, "Skyrim.esm") as Idle
			Idle idleStop_Loose = Game.GetFormFromFile(0x10d9ee, "Skyrim.esm") as Idle

			GlobalVariable RND_ThirstPoints = Game.GetFormFromFile(0x2e07, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_ThirstPointsPerHour = Game.GetFormFromFile(0x2e08, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_ThirstLastUpdateTimeStamp = Game.GetFormFromFile(0x2e09, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_WaterPoints = Game.GetFormFromFile(0x6f16, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_AnimDrink = Game.GetFormFromFile(0x24489, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_1stPersonMsg = Game.GetFormFromFile(0x900ca, "RealisticNeedsandDiseases.esp") as GlobalVariable

			GlobalVariable RND_ThirstLevel00 = Game.GetFormFromFile(0x2e0a, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_ThirstLevel01 = Game.GetFormFromFile(0x2e0b, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_ThirstLevel02 = Game.GetFormFromFile(0x2e0c, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_ThirstLevel03 = Game.GetFormFromFile(0x2e0d, "RealisticNeedsandDiseases.esp") as GlobalVariable
			GlobalVariable RND_ThirstLevel04 = Game.GetFormFromFile(0x2e0e, "RealisticNeedsandDiseases.esp") as GlobalVariable

			Spell RND_ThirstSpell00 = Game.GetFormFromFile(0x1da1, "RealisticNeedsandDiseases.esp") as Spell
			Spell RND_ThirstSpell01 = Game.GetFormFromFile(0x1da3, "RealisticNeedsandDiseases.esp") as Spell
			Spell RND_ThirstSpell02 = Game.GetFormFromFile(0x1da5, "RealisticNeedsandDiseases.esp") as Spell
			Spell RND_ThirstSpell03 = Game.GetFormFromFile(0x2dfa, "RealisticNeedsandDiseases.esp") as Spell
			Spell RND_ThirstSpell04 = Game.GetFormFromFile(0x2dfc, "RealisticNeedsandDiseases.esp") as Spell


			Message RND_ThirstLevel00ConsumeMessage = Game.GetFormFromFile(0x5ecc, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel01ConsumeMessage = Game.GetFormFromFile(0x5ecd, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel02ConsumeMessage = Game.GetFormFromFile(0x5ece, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel03ConsumeMessage = Game.GetFormFromFile(0x5ecf, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel04ConsumeMessage = Game.GetFormFromFile(0x5ed0, "RealisticNeedsandDiseases.esp") as Message

			Message RND_ThirstLevel00ConsumeMessageB = Game.GetFormFromFile(0x90b97, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel01ConsumeMessageB = Game.GetFormFromFile(0x90b98, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel02ConsumeMessageB = Game.GetFormFromFile(0x90b99, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel03ConsumeMessageB = Game.GetFormFromFile(0x90b96, "RealisticNeedsandDiseases.esp") as Message
			Message RND_ThirstLevel04ConsumeMessageB = Game.GetFormFromFile(0x90b95, "RealisticNeedsandDiseases.esp") as Message

			Potion RND_EmptyBottle03 = Game.GetFormFromFile(0x43b4, "RealisticNeedsandDiseases.esp") as Potion

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
			
		PlayerRef.AddItem(RND_EmptyBottle03, 1, true)

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
EndFunction

Function RemoveHungerSpells()
	GlobalVariable RND_State = Game.GetFormFromFile(0x12c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable

	if RND_State != none && RND_State.GetValue() == 1
		Actor PlayerRef = Game.GetPlayer()
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1d97, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1d99, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1d9b, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1d9d, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x231b, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x231c, "RealisticNeedsandDiseases.esp") as Spell)
	endif
EndFunction

Function RemoveThirstSpells()
	GlobalVariable RND_State = Game.GetFormFromFile(0x12c4c, "RealisticNeedsandDiseases.esp") as GlobalVariable

	if RND_State != none && RND_State.GetValue() == 1
		Actor PlayerRef = Game.GetPlayer()
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1da1, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1da3, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x1da5, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x2dfa, "RealisticNeedsandDiseases.esp") as Spell)
		PlayerRef.RemoveSpell(Game.GetFormFromFile(0x2dfc, "RealisticNeedsandDiseases.esp") as Spell)
	endif
EndFunction