Scriptname MilkLactacidScr extends activemagiceffect  

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
;on drink
Event OnEffectStart( Actor akTarget, Actor akCaster )
	if MilkQ.Plugin_SlSW && akTarget == MilkQ.PlayerREF && !MilkQ.DisableSkoomaLactacid
		akTarget.equipitem(Game.GetFormFromFile(0x57A7A, "Skyrim.esm"),false,true)
	endif
	if akTarget.GetActorBase().GetSex() == 1
		if MilkQ.MILKmaid.find(akTarget) != -1
			if akTarget.HasSpell(MilkQ.MilkExhaustion)\
			|| akTarget.HasSpell(MilkQ.MilkMentalExhaustion)
				if akTarget.HasSpell(MilkQ.MilkExhaustion)
					akTarget.RemoveSpell(MilkQ.MilkExhaustion)
				endif
				if akTarget.HasSpell(MilkQ.MilkMentalExhaustion)
					akTarget.RemoveSpell( MilkQ.MilkMentalExhaustion )
				endif
				Debug.Notification( akTarget.GetLeveledActorBase().getname() + " feels revitalised, exhaustion is gone!" )
			endif
			StorageUtil.AdjustFloatValue(akTarget,"MME.MilkMaid.LactacidCount", 1)
		else 
			int ButtonPressed = (MilkQ.MakeMilkMaid).Show()
			if ButtonPressed == 0
				;insert quest here
				MilkQ.AssignSlot(akTarget)
				if MilkQ.MILKmaid.find(akTarget) != -1 
					Utility.Wait( 1.0 )
					StorageUtil.AdjustFloatValue(akTarget,"MME.MilkMaid.LactacidCount", 1)
				EndIf
			EndIf
			if akTarget == MilkQ.PlayerREF
				If MilkQ.MilkStory
					Debug.Messagebox("After you have drank bottle, you are starting to feel strange, your breast warm up, nipples start to tingle and becomes hard rubbing with your clothes. Heat spreads through you body, your mind goes blank, you can hardly stand on your feet. Suddenly you feeling shock-waves going through you body as you collapse.")
				EndIf
				Utility.Wait(1.0)
				Game.DisablePlayerControls(1, 1, 0, 0, 1, 1, 0) ;(True,True,False,False,True,True,True,True,0)
				Game.ForceThirdPerson()
				Game.ShakeCamera(none, Utility.RandomFloat(0.5 , 1), 10)
			endif
			If !StorageUtil.GetIntValue(akTarget,"IsBoundStrict")
				Debug.SendAnimationEvent(akTarget,"ZaZAPCHorFd")
			EndIf
			MilkQ.SexLab.PickVoice(akTarget).Moan(akTarget, Utility.RandomInt (70, 100), false)
			if akTarget == MilkQ.PlayerREF
				SendModEvent("PlayerOrgasmStart")
			endIf
			Utility.Wait( 10.0 )
			if akTarget == MilkQ.PlayerREF
				SendModEvent("PlayerOrgasmEnd")
			endIf
			If MilkQ.MilkStory
				Debug.Messagebox(akTarget.GetLeveledActorBase().GetName() + " just had a breast induced orgasm!")
			EndIf
			Debug.SendAnimationEvent(akTarget,"IdleForceDefaultState")
			if akTarget == MilkQ.PlayerREF
				Game.EnablePlayerControls() ;(True,True,True,True,True,True,True,True,0)
			endif
		endif
	endif
EndEvent