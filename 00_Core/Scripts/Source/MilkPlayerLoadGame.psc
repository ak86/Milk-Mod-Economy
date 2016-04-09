Scriptname MilkPlayerLoadGame extends ReferenceAlias  

MilkQUEST Property MilkQ Auto
GlobalVariable Property MME_Status_Global Auto

;----------------------------------------------------------------------------
;Events
;----------------------------------------------------------------------------
Event OnInit()
	Debug.Trace("MilkModEconomy 1st run, initializing")
	MilkQ.VarSetup()
	MilkQ.MaidReset()
	MilkQ.SlaveReset()
	if !MilkQ.MilkFlag
		MilkQ.MilkFlag = true
		MilkQ.EconFlag = true
		MilkQ.RegisterForSingleUpdateGameTime (MilkQ.MilkPoll)
		MilkQ.MilkE.RegisterForSingleUpdateGameTime (MilkQ.MilkPoll)
		Debug.Notification("Milk Mod Enabled. Event intervals set to: Milk production - " + MilkQ.MilkPoll + " hour, Economy update every morning at 9 o'clock")
	endif
	Maintenance()
EndEvent

Event OnPlayerLoadGame()
	Maintenance()
EndEvent

;----------------------------------------------------------------------------
;Self hooks
;----------------------------------------------------------------------------

Event onMME_AddMilkSlave(Form Sender, Int Level, Float Milk)
	actor akActor = Sender as Actor
	if MilkQ.MILKmaid.find(akActor, 0) == -1 && MilkQ.MILKslave.find(akActor, 0) == -1
		if !Level
			Level = 0
		endif
		if !Milk
			Milk = 0
		endif
		MilkQ.AssignSlotSlave(akActor, Level, Milk)
	elseif MilkQ.MILKmaid.find(akActor) != -1
		Debug.Notification( "Target is already milkmaid" )
	else 
		Debug.Notification( "Target is already milkslave" )
	endif
EndEvent

Event onMME_AddMilkMaid(Form Sender)
	actor akActor = Sender as Actor
	if MilkQ.MILKmaid.find(akActor, 0) == -1 && MilkQ.MILKslave.find(akActor, 0) == -1
		MilkQ.AssignSlot(akActor)
	elseif MilkQ.MILKmaid.find(akActor) != -1
		Debug.Notification( "Target is already milkmaid" )
	else 
		Debug.Notification( "Target is already milkslave" )
	endif
EndEvent

Event onMME_Milking(Form Sender, Int Mode, Int PumpType)
	actor akActor = Sender as Actor
	if akActor.GetActorBase().GetSex() == 1
		if MilkQ.MILKmaid.find(akActor) != -1
			MilkQ.Milking(akActor, 0, Mode, PumpType)
		else 
			Debug.Notification( "Target is not a milkmaid" )
		endif
	else
		Debug.Notification("Only works on females")
	endif
EndEvent

Event OnSlaveToggle(Form Sender)
	actor akActor = Sender as Actor
	if MilkQ.MILKmaid.find(akActor) == -1 && MilkQ.MILKmaid.find(akActor) == -1
		Debug.Notification( "Target is not milkmaid/slave" )
	elseif StorageUtil.GetIntValue(akActor,"MME.MilkMaid.IsSlave", missing = 0) == 0
		StorageUtil.SetIntValue(akActor,"MME.MilkMaid.IsSlave", 1)
		akActor.AddToFaction(MilkQ.MilkSlaveFaction)
	elseif StorageUtil.GetIntValue(akActor,"MME.MilkMaid.IsSlave") == 1
		StorageUtil.SetIntValue(akActor,"MME.MilkMaid.IsSlave", 0)
		akActor.RemoveFromFaction(MilkQ.MilkSlaveFaction)
	endif
EndEvent

;----------------------------------------------------------------------------
;DDI hooks
;----------------------------------------------------------------------------

Event OnVibrateStart(string eventName, string argString, float argNum, form sender)
	If argString == MilkQ.PlayerREF.GetActorBase().GetName() && MilkQ.DDI.IsMilkingBlocked_PiercingsNipple(MilkQ.PlayerREF) && MilkQ.MILKmaid.find(MilkQ.PlayerREF) != -1
		If StorageUtil.GetFloatValue(MilkQ.PlayerREF,"MME.MilkMaid.MilkCount", missing = 0) >= 1
			int gush = (StorageUtil.GetFloatValue(MilkQ.PlayerREF,"MME.MilkMaid.MilkCount", missing = 0) * MilkQ.GushPct/100) as int
			if gush < 1
				gush = 1
			endif
			if StorageUtil.GetFloatValue(MilkQ.PlayerREF, "MME.MilkMaid.MilkGen") == 0 
				if Utility.RandomInt(0, 100) < 25
					Debug.Notification(MilkQ.PlayerREF.GetLeveledActorBase().GetName() + "'s breasts has started lactating.")
					StorageUtil.AdjustFloatValue(MilkQ.PlayerREF, "MME.MilkMaid.MilkGen", MilkQ.MilkGenValue/3/10 * gush)
				endif
			else
				StorageUtil.AdjustFloatValue(MilkQ.PlayerREF, "MME.MilkMaid.MilkGen", MilkQ.MilkGenValue/3/10 * gush)
			endif
			StorageUtil.AdjustFloatValue(MilkQ.PlayerREF,"MME.MilkMaid.MilkCount", -1*gush) 
			Debug.Notification("Nipple piercing vibrations forces milk from your breasts.")
			MilkQ.PostMilk(MilkQ.PlayerREF)
			MilkQ.AddMilkFx(MilkQ.PlayerREF, 2)
			MilkQ.AddLeak(MilkQ.PlayerREF)
		EndIf
	EndIf
EndEvent

;----------------------------------------------------------------------------
;SexLab hooks
;----------------------------------------------------------------------------

Event OnSexLabStart(String _eventName, String _args, Float _argc, Form _sender)
	Actor[] actors = MilkQ.SexLab.HookActors(_args)								;0 - actor being sucked, 1 - actor sucking
	String  animName = getAnimName(_args)

	if (animName == "3J Straight Breastfeeding"\
	|| animName == "3J Lesbian Breastfeeding"\
	|| animName == "3Jiou Breastfeeding Lesbian"\
	|| animName == "3Jiou Breastfeeding Straight")\
	&& MilkQ.SexLab3jBreastfeeding
		if MilkQ.MILKmaid.Find(actors[0]) != -1\
		&& !actors[0].HasSpell( MilkQ.BeingMilkedPassive )\
		&& actors[0].GetActorBase().GetSex() == 1
			MilkQ.Milking(actors[0], 0, 4, 0)
			actors[1].equipitem(MilkQ.MME_Milk_Basic.GetAt(0), true, true)
		endif
	endif
EndEvent

Event OnSexLabEnd(String _eventName, String _args, Float _argc, Form _sender)
	Actor[] actors = MilkQ.SexLab.HookActors(_args)
	int idx

	While idx < actors.Length
		if actors[idx].HasSpell( MilkQ.BeingMilkedPassive )
			actors[idx].RemoveSpell( MilkQ.BeingMilkedPassive )
		endif
	idx += 1
	EndWhile
EndEvent

Event OnSexLabOrgasm(String _eventName, String _args, Float _argc, Form _sender)
	Actor[] actors = MilkQ.SexLab.HookActors(_args)
	int idx
	sslBaseAnimation animation = MilkQ.SexLab.HookAnimation(_args)

	While idx < actors.Length && MilkQ.SexLabOrgasm
		if MilkQ.MILKmaid.Find(actors[idx]) != -1\
		&& actors[idx].GetActorBase().GetSex() == 1
			if StorageUtil.GetFloatValue(actors[idx],"MME.MilkMaid.MilkCount", missing = 0) >= 1
				if ((animation.HasTag("Anal")\
					|| animation.HasTag("Vaginal")\
					|| animation.HasTag("Masturbation")\
					|| animation.HasTag("Fisting"))\
					&& !MilkQ.DDI.IsWearingBelt(actors[idx]))\
				|| (animation.HasTag("Breast")\
					&& ((!MilkQ.DDi.IsMilkingBlocked_Bra(actors[idx]) && !MilkQ.SLSD.IsMilkingBlocked_Bra_SLSD(actors[idx]))\
					|| (MilkQ.DDi.IsMilkingBlocked_Bra(actors[idx]) && MilkQ.SLSD.IsMilkingBlocked_Bra_SLSD(actors[idx]))))
					
					StorageUtil.AdjustFloatValue(actors[idx],"MME.MilkMaid.MilkCount", -1)
					MilkQ.PostMilk(actors[idx])
					MilkQ.AddMilkFx(actors[idx], 2)
					
					If ((!MilkQ.DDi.IsMilkingBlocked_Bra(actors[idx]) && !MilkQ.SLSD.IsMilkingBlocked_Bra_SLSD(actors[idx]))\
					|| (MilkQ.DDi.IsMilkingBlocked_Bra(actors[idx]) && MilkQ.SLSD.IsMilkingBlocked_Bra_SLSD(actors[idx])))
						MilkQ.AddLeak(actors[idx])
					EndIf
					If MilkQ.MilkMsgs == true
						Debug.Notification("Orgasm forces milk from " + StorageUtil.GetStringValue(actors[idx],"MME.MilkMaid.Name") + " breasts.")
					EndIf
				EndIf
			endif
		endif
		if MilkQ.MILKmaid.Find(actors[idx]) != -1 || actors[idx] == MilkQ.PlayerREF
			if animation.HasTag("Masturbation")\
			&& !(MilkQ.DDi.IsWearingBelt(actors[idx])\
				|| MilkQ.DDi.IsMilkingBlocked_Armbinder(actors[idx])\
				|| MilkQ.DDi.IsMilkingBlocked_Yoke(actors[idx]))
				if MilkQ.akActorSex(actors[idx]) == "Male" 
					MilkQ.PlayerREF.AddItem(MilkQ.MME_Cums.GetAt(1), 1)
				elseif MilkQ.akActorSex(actors[idx]) == "Female" 
					MilkQ.PlayerREF.AddItem(MilkQ.MME_Cums.GetAt(0), 1)
				elseif MilkQ.akActorSex(actors[idx]) == "Futa"
					int futamilk = Utility.RandomInt(0, 1)
					MilkQ.PlayerREF.AddItem(MilkQ.MME_Cums.GetAt(3), futamilk)
					MilkQ.PlayerREF.AddItem(MilkQ.MME_Cums.GetAt(2), 1-futamilk)
				endif
				MilkQ.PlayerREF.RemoveItem(MilkQ.MilkE.Gold, 2, true)
			endif
		endif
		idx += 1
	EndWhile
EndEvent

String Function getAnimName(String _argString)
	sslBaseAnimation animation = MilkQ.SexLab.HookAnimation(_argString)
	If animation
		Return animation.Name
	EndIf
	return ""
EndFunction

;----------------------------------------------------------------------------
;change breast size on game load/location change
;----------------------------------------------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	UpdateSize()
EndEvent

Function Maintenance()
	Debug.Trace("MilkModEconomy OnPlayerLoadGame")
	if PapyrusUtil.GetVersion() < 28
		Debug.MessageBox( "Your PapyrusUtil is too old" )
		Debug.Trace("MilkModEconomy PapyrusUtil is " + PapyrusUtil.GetVersion())
	endif
	if SexLabUtil.GetVersion() < 15903
		Debug.MessageBox( "Your SexLab is too old"  )
		Debug.Trace("MilkModEconomy SexLab is " + SexLabUtil.GetVersion())
	endif
	if zbfUtil.GetVersion() < 600
		Debug.MessageBox( "Your Zaz Animation Pack is too old" )
		Debug.Trace("MilkModEconomy Zaz Animation Pack is " + zbfUtil.GetVersion())
	endif
	
	Debug.Trace("MilkModEconomy Registering events")
	self.RegisterForModEvent("DeviceVibrateEffectStart", "OnVibrateStart")
	self.RegisterForModEvent("MME_AddMilkMaid", "onMME_AddMilkMaid")
	self.RegisterForModEvent("MME_AddMilkSlave", "onMME_AddMilkSlave")
	self.RegisterForModEvent("MME_Milking", "onMME_Milking")
	self.RegisterForModEvent("OrgasmStart", "OnSexLabOrgasm")
	self.RegisterForModEvent("StageStart", "OnSexLabStart")
	self.RegisterForModEvent("AnimationStart", "OnSexLabStart")
	self.RegisterForModEvent("AnimationEnd", "OnSexLabEnd")
	self.RegisterForModEvent("SlaveToggle", "OnSlaveToggle")
	
	Debug.Trace("MilkModEconomy maintenance")
	MilkQ.MME_Milks.revert()
	MilkQ.MME_Foods.revert()

	MilkQ.DLCcheck()
	MilkQ.Strings_setup()
	MilkQ.DebuffArraySet()
	MilkQ.BuffArraySet()
	self.UpdateSize()

	if 	MilkQ.SexLab.AnimSlots.GetbyRegistrar("zjBreastFeedingVar") && MilkQ.SexLab.AnimSlots.GetbyRegistrar("zjBreastFeeding")
		MilkQ.MilkQC.MME_BreasfeedingAnimationsCheck = True
		Debug.Trace("MilkModEconomy 3J Breastfeeding animations found")
	else
		MilkQ.MilkQC.MME_BreasfeedingAnimationsCheck = False
		Debug.Trace("MilkModEconomy 3J Breastfeeding animations NOT found")
	endif
	MME_Status_Global.SetValue(1)
	Debug.Trace("MilkModEconomy maintenance done")
EndFunction

Function UpdateSize()
	if MilkQ.MILKmaid as Bool && MilkQ.MilkFlag && MilkQ.BreastScale == 2
		Int i = 0
		while i < MilkQ.MILKmaid.length
			if MilkQ.MILKmaid[i] != none && MilkQ.MILKmaid[i].GetActorBase().GetSex() == 1 && MilkQ.MILKmaid[i].IsInLocation(MilkQ.PlayerREF.getCurrentLocation())
				Debug.Trace("MilkModEconomy, BreastScale = NiE, LocationChange/GameLoad updating breast size", 0)
				MilkQ.CurrentSize(MilkQ.MILKmaid[i])
			endIf
			i += 1
		endWhile
	endIf
EndFunction