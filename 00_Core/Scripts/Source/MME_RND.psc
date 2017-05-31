Scriptname MME_RND extends Quest

bool Function IsIntegraged ()
	Return True
EndFunction

Function Hunger(Int mod = 0)
	GlobalVariable RND_State = JsonUtil.GetFormValue("/MME/RND", "rnd_state") as GlobalVariable

	if RND_State.GetValue() == 1
		Actor PlayerRef = Game.GetPlayer()
		
		GlobalVariable RND_HungerPoints = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerpoints") as GlobalVariable
		GlobalVariable RND_HungerPointsPerHour = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerpointsperhour") as GlobalVariable
		GlobalVariable RND_HungerLastUpdateTimeStamp = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlastupdatetimestamp") as GlobalVariable
		GlobalVariable RND_FoodPoints = JsonUtil.GetFormValue("/MME/RND", "rnd_foodpoints") as GlobalVariable
		GlobalVariable RND_1stPersonMsg = JsonUtil.GetFormValue("/MME/RND", "rnd_1stpersonmsg") as GlobalVariable
		GlobalVariable RND_ForceSatiation = JsonUtil.GetFormValue("/MME/RND", "rnd_forcesatiation") as GlobalVariable

		GlobalVariable RND_HungerLevel00 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel00") as GlobalVariable
		GlobalVariable RND_HungerLevel01 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel01") as GlobalVariable
		GlobalVariable RND_HungerLevel02 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel02") as GlobalVariable
		GlobalVariable RND_HungerLevel03 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel03") as GlobalVariable
		GlobalVariable RND_HungerLevel04 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel04") as GlobalVariable
		GlobalVariable RND_HungerLevel05 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel05") as GlobalVariable

		Spell RND_HungerSpell00 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell00") as Spell
		Spell RND_HungerSpell01 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell01") as Spell
		Spell RND_HungerSpell02 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell02") as Spell
		Spell RND_HungerSpell03 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell03") as Spell
		Spell RND_HungerSpell04 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell04") as Spell
		Spell RND_HungerSpell05 = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell05") as Spell

		Message RND_HungerLevel00ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel00consumemessage") as Message
		Message RND_HungerLevel01ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel01consumemessage") as Message
		Message RND_HungerLevel02ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel02consumemessage") as Message
		Message RND_HungerLevel03ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel03consumemessage") as Message
		Message RND_HungerLevel04ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel04consumemessage") as Message
		Message RND_HungerLevel05ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel05consumemessage") as Message

		Message RND_HungerLevel00ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel00consumemessageb") as Message
		Message RND_HungerLevel01ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel01consumemessageb") as Message
		Message RND_HungerLevel02ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel02consumemessageb") as Message
		Message RND_HungerLevel03ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel03consumemessageb") as Message
		Message RND_HungerLevel04ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel04consumemessageb") as Message
		Message RND_HungerLevel05ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_hungerlevel05consumemessageb") as Message
		
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
	GlobalVariable RND_State = JsonUtil.GetFormValue("/MME/RND", "rnd_state") as GlobalVariable

		if RND_State.GetValue() == 1
			Actor PlayerRef = Game.GetPlayer()

			Idle idleDrink = JsonUtil.GetFormValue("/MME/RND", "idledrink") as Idle
			Idle ChairDrinkingStart = JsonUtil.GetFormValue("/MME/RND", "chairdrinkingstart") as Idle
			Idle idleStop_Loose = JsonUtil.GetFormValue("/MME/RND", "idlestop_loose") as Idle

			Potion RND_EmptyBottle03 = JsonUtil.GetFormValue("/MME/RND", "RND_EmptyBottle03") as Potion
			
			GlobalVariable RND_ThirstPoints = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstpoints") as GlobalVariable
			GlobalVariable RND_ThirstPointsPerHour = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstpointsperhour") as GlobalVariable
			GlobalVariable RND_ThirstLastUpdateTimeStamp = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlastupdatetimestamp") as GlobalVariable
			GlobalVariable RND_WaterPoints = JsonUtil.GetFormValue("/MME/RND", "rnd_waterpoints") as GlobalVariable
			GlobalVariable RND_1stPersonMsg = JsonUtil.GetFormValue("/MME/RND", "rnd_1stpersonmsg") as GlobalVariable
			GlobalVariable RND_AnimDrink = JsonUtil.GetFormValue("/MME/RND", "rnd_animdrink") as GlobalVariable

			GlobalVariable RND_ThirstLevel00 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel00") as GlobalVariable
			GlobalVariable RND_ThirstLevel01 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel01") as GlobalVariable
			GlobalVariable RND_ThirstLevel02 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel02") as GlobalVariable
			GlobalVariable RND_ThirstLevel03 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel03") as GlobalVariable
			GlobalVariable RND_ThirstLevel04 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel04") as GlobalVariable

			Spell RND_ThirstSpell00 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell00") as Spell
			Spell RND_ThirstSpell01 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell01") as Spell
			Spell RND_ThirstSpell02 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell02") as Spell
			Spell RND_ThirstSpell03 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell03") as Spell
			Spell RND_ThirstSpell04 = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell04") as Spell

			Message RND_ThirstLevel00ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel00consumemessage") as Message
			Message RND_ThirstLevel01ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel01consumemessage") as Message
			Message RND_ThirstLevel02ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel02consumemessage") as Message
			Message RND_ThirstLevel03ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel03consumemessage") as Message
			Message RND_ThirstLevel04ConsumeMessage = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel04consumemessage") as Message

			Message RND_ThirstLevel00ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel00consumemessageb") as Message
			Message RND_ThirstLevel01ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel01consumemessageb") as Message
			Message RND_ThirstLevel02ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel02consumemessageb") as Message
			Message RND_ThirstLevel03ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel03consumemessageb") as Message
			Message RND_ThirstLevel04ConsumeMessageB = JsonUtil.GetFormValue("/MME/RND", "rnd_thirstlevel04consumemessageb") as Message

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
	Actor PlayerRef = Game.GetPlayer()
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell00") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell01") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell02") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell03") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_hungerspell04") as Spell)
EndFunction

Function RemoveThirstSpells()
	Actor PlayerRef = Game.GetPlayer()
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell00") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell00") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell00") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell00") as Spell)
	PlayerRef.RemoveSpell(JsonUtil.GetFormValue("/MME/RND", "rnd_thirstspell00") as Spell)
EndFunction