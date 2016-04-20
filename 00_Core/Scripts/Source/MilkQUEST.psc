Scriptname MilkQUEST extends Quest
{Core MME script}

SexLabFramework property SexLab auto

MilkECON Property MilkE Auto 
;MilkStrings Property MilkS Auto 
MilkQUEST_Conditions Property MilkQC Auto
CompanionsHousekeepingScript Property CHScript Auto 
PlayerVampireQuestScript Property PlayerVampireQuest Auto 

MME_ineed property ineed auto
MME_SOS property SOS auto
MME_SLA property SLA auto
MME_DDi property DDi auto
MME_zbf property zbf auto
MME_SLSD property SLSD auto
MME_SLHP property SLHP auto
MME_SLP property SLP auto
MME_PSQ property PSQ auto
MME_SGO property SGO auto
MME_UIE property UIE auto

;Cross-script variables

;Varables set in ESP
Actor Property PlayerREF Auto
Message Property MakeMilkMaid Auto
GlobalVariable Property MME_NPCComments Auto
GlobalVariable Property MME_Status_Global Auto

SPELL Property MilkCritical Auto
SPELL Property MilkExhaustion Auto
SPELL Property MilkMentalExhaustion Auto
SPELL Property MilkModInfo Auto
SPELL Property MilkModToggle Auto
SPELL Property MilkForSpriggan Auto
SPELL Property MilkForSprigganPassive Auto
SPELL Property BeingMilkedPassive Auto
SPELL Property FeedingStage Auto
SPELL Property MilkingStage Auto
SPELL Property FuckMachineStage Auto
SPELL Property MilkFx1 Auto
SPELL Property MilkFx2 Auto
SPELL Property MilkSelf Auto
SPELL Property MilkTarget Auto
SPELL Property MilkLeak Auto

SPELL Property MME_DebugSpell Auto
SPELL Property MME_ResetMaids Auto
SPELL Property MME_ResetMod Auto
SPELL Property MME_Uninstall Auto
SPELL Property MME_AM_ME Auto
SPELL Property MME_AM_BLA Auto
SPELL Property MME_AM_PLA Auto
SPELL Property MME_AM_Purge Auto
SPELL Property MME_MakeMilkmaid_Spell Auto
SPELL Property MME_MakeMilkslave_Spell Auto

Armor Property MilkCuirass auto
Armor Property MilkCuirassFuta auto
Armor Property ZaZMoMSuctionCups auto
Armor Property TITS4 auto
Armor Property TITS6 auto
Armor Property TITS8 auto
Sound Property MilkSound Auto
Sound Property FeedingSound Auto
Sound Property TakeHoldSound Auto

;Varables that doesn't care about ESP
;Arrays
Actor[] Property MilkMaid Auto
Actor[] Property MilkSlave Auto
Spell[] Property UnmilkedArray Auto
Spell[] Property WellMilkedArray Auto
String[] Property MilkMsgHyper Auto
String[] Property MilkMsgStage Auto
String[] Property Story Auto
String[] Property armname Auto
int[] Property armslot Auto
String[] Property MilkingEquipment Auto
String[] Property BasicLivingArmor Auto
String[] Property ParasiteLivingArmor Auto
Alias[] Property AliasRef  Auto  
Package Property MilkPackage  Auto  

;Varables in StorageUtil
;FormListClear(none,"MME.MilkMaid.List")					;not used
;UnsetFloatValue(none,"MME.Progression.Level")
;UnsetFloatValue(none,"MME.Progression.TimesMilked"
;UnsetFloatValue(none,"MME.Progression.TimesMilkedAll")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.LactacidCount")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.MaidMilkGen")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.PainCount")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.BreastRows")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.BoobIncr")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.BoobPerLvl")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.TimesMilked")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.MilkingContainerCumsSUM")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.MilkingContainerMilksSUM")
;UnsetFloatValue(MILKmaid[i],"MME.MilkMaid.MilkingContainerLactacid")
;UnsetIntValue(MILKmaid[i],"MME.MilkMaid.MilkingMode")
;UnsetIntValue(MILKmaid[i],"MME.MilkMaid.IsSlave")

Bool Property DisableSkoomaLactacid = False Auto
Bool Property DialogueForceMilkSlave = False Auto
Bool Property MilkFlag = False Auto
Bool Property EconFlag = False Auto
Bool Property MilkNaked = False Auto
Bool Property MilkMsgs = False Auto
Bool Property MilkCntMsgs = False Auto
Bool Property MilkEMsgs = False Auto
Bool Property ForcedFeeding = False Auto
Bool Property FixedMilkGen = False Auto
Bool Property FixedMilkGen4Followers = False Auto
Bool Property CuirassSellsMilk = False Auto
Bool Property MilkStory = False Auto
Bool Property BreastScaleLimit = False Auto
Bool Property BreastUpScale = False Auto
Bool Property WeightUpScale = False Auto
Bool Property PainKills = False Auto
Bool Property MaidLvlCap = False Auto
Bool Property MilkAsMaidTimesMilked = False Auto
Bool Property MilkLeakTextures = True Auto
Bool Property MilkLeakToggle = True Auto
Bool Property MilkLeakWearArm = False Auto
Bool Property MilkSuccubusTransform = False Auto
Bool Property MilkVampireTransform = False Auto
Bool Property MilkWerewolfTransform = False Auto
Bool Property MilkingDrainsSP = True Auto
Bool Property MilkingDrainsMP = True Auto
Bool Property Feeding = True Auto
Bool Property FuckMachine = True Auto
Bool Property MilkWithZaZMoMSuctionCups = False Auto
Bool Property SexLabOrgasm = True Auto
Bool Property SexLab3jBreastfeeding = True Auto
Bool Property PainSystem = True Auto
Bool Property TradeDialogue = True Auto
Bool Property PlayerCantBeMilkmaid = False Auto
Bool Property ECTrigger = True Auto
Bool Property ECCrowdControl = True Auto
Bool Property ZazPumps = False Auto

Int Property BreastScale = 0 Auto
Int Property TimesMilkedMult Auto
Int Property MilkLvlCap Auto
Int Property MilkPoll Auto
Int Property Milking_Duration Auto
Int Property Feeding_Duration Auto
Int Property Feeding_Sound Auto
Int Property FuckMachine_Duration Auto
Int Property MilkPriceMod Auto
Int Property ExhaustionSleepMod Auto
Int Property ECRange Auto
Int Property GushPct = 10 Auto

Float Property BoobMAX Auto
Float Property MilkProdMod Auto
Float Property MilkGenValue Auto
Float Property BoobIncr Auto
Float Property BoobPerLvl Auto
Float Property BoobBase Auto
Float Property LastTimeMilked Auto
Float Property BreastCurve Auto
Float Property LactacidDecayRate Auto

FormList Property MME_Cums Auto
FormList Property MME_Foods Auto
FormList Property MME_Milks Auto
FormList Property MME_Milk_Altmer Auto
FormList Property MME_Milk_Argonian Auto
FormList Property MME_Milk_Basic Auto
FormList Property MME_Milk_Bosmer Auto
FormList Property MME_Milk_Breton Auto
FormList Property MME_Milk_Dunmer Auto
FormList Property MME_Milk_Exotic Auto
FormList Property MME_Milk_Imperial Auto
FormList Property MME_Milk_Khajiit Auto
FormList Property MME_Milk_Nord Auto
FormList Property MME_Milk_Orc Auto
FormList Property MME_Milk_Redguard Auto
FormList Property MME_Milk_Succubus Auto
FormList Property MME_Milk_Vampire Auto
FormList Property MME_Milk_Werewolf Auto

FormList Property MME_Spells_Unmilked Auto
FormList Property MME_Spells_Wellmilked Auto

LeveledItem Property LItemFoodInnCommon Auto
LeveledItem Property LItemSkooma75 Auto
LeveledItem Property MME_LItemFoodInnCommonMilk Auto
LeveledItem Property MME_LItemSkooma75RaceMilkLactacid Auto

Faction Property MilkMaidFaction Auto
Faction Property MilkSlaveFaction Auto

;NotificationKey
Int Property NotificationKey Auto
Int Property HotKeyMode Auto

;This script only variables
Actor crosshairRef = None

;DLC's
Bool Property Plugin_HearthFires = false auto
Bool Property Plugin_Dragonborn = false auto
Bool Property Plugin_Dawnguard = false auto
Bool Property Plugin_RealisticNeedsandDiseases = false auto
Bool Property Plugin_iNeed = false auto
Bool Property Plugin_SOS = false auto
Bool Property Plugin_SOS_EQUIP = false auto
Bool Property Plugin_SOS_UNP = false auto
Bool Property Plugin_SOS_NSA = false auto
Bool Property Plugin_SOS_PUBES = false auto
Bool Property Plugin_EstrusChaurus = false auto
Bool Property Plugin_EstrusSpider = false auto
Bool Property Plugin_BeeingFemale = false auto
Bool Property Plugin_HentaiPregnancy = false auto
Bool Property Plugin_SexLabProcreation = false auto
Bool Property Plugin_PSQ = false auto
Bool Property Plugin_DDI = false auto
Bool Property Plugin_SLSD = false auto
Bool Property Plugin_SLA = false auto
Bool Property Plugin_SlSW = false auto

;---Contents---
;
;---Timers---
;	Event OnUpdate()														;old MilkPoll loop /RealTime seconds
;	Event OnUpdateGameTime()												;new MilkPoll loop /GameTime hours
;	Function GetCurrentHourOfDay()											;check for time in game
;
;---Notification key management---
;	Event OnKeyDown(int keyCode)											;key pressed
;	Event OnKeyUp(Int KeyCode, Float HoldTime)								;key released, time it was hold
;	Event OnCrosshairRefChange(ObjectReference ref)							;get Actor at Crosshair
;
;---Core---
;	Function ActorCheck(int t)												;Cycle through MilkMaids, run MilkCycle
;	Function MilkCycle(Actor akActor, int t)								;Generate milk/Reduce pain, add/remove effects, SendModEvent( "MME_MilkCycleComplete" ), trigger living armor effects
;	Function AssignSlot(Actor akActor)										;make Actor a MILKmaid
;	Function AssignSlotSlave(Actor akActor, Int Level, Float Milk)			;make Actor a MILKSlave
;	Function AssignSlotSlaveToMaid(Actor akActor)							;convert Actor to a MILKmaid from a MILKSlave
;	Function AssignSlotMaidToSlave(Actor akActor)							;convert Actor to a MILKSlave from a MILKmaid
;	Function CurrentSize(Actor akActor)										;Change breast size
;	Function Milking(Actor akActor, 0, int Mode, int MilkingType)			;Core milking script
;	Function PostMilk(Actor akActor)										;run after milking, add/remove (de)buffs
;	Function LevelCheck()													;Mastery Progression LevelCheck
;	Function MaidLevelCheck(Actor akActor)									;Maid LevelCheck
;
;---Messages---
;	Function MilkCycleMSG(Actor akActor)									;Milk tick messages
;	Function Strings_setup()												;Strings for Milk tick, armor check
;	Function MilkMsgHyper(int t, Actor akActor)								;Level up messages
;
;---Stories---
;	Function StoryDisplay(int StoryState , int StoryMode, bool FirstTime)	;Story selector
;
;---MilkPump Stories---
;	Function StoryS(int i)													;Start Story for milking pump
;	Function StoryE(int i)													;End Story for milking pump
;
;---Spriggan Stories---
;	Function StorySS(int i)													;Start Story for Spriggan
;	Function StorySE(int i)													;End Story for Spriggan
;
;---Hermaeus Mora Stories---
;	Function StoryHMS(int i)												;Start Story for Hermaeus Mora
;	Function StoryHME(int i)												;End Story for Hermaeus Mora
;
;---Living armor Stories---
;	Function StoryLAS(int i)												;Start Story for Living armor
;	Function StoryLAE(int i)												;End Story for Living armor
;
;---Utility---
;	Function DLCcheck()														;Checks and updates plugins
;	int Function Milklvl0fix()												;Milklevel 0 fix since Math.Celling doesn't work, provides 1 maid slot at level 0
;	string Function ReduceFloat(String ReduceFloat)							;reduce floating 0.00000 to 0.00
;	Function MMEfoodlistaddon()												;Fills inn formlists with milk and khajiit caravans with lactacid
;	Function iNeedfoodlistaddon()											;Fills iNeed foods and drinks formlists
;	Function Milkmaidinfo()													;Milk maid info message box
;	Function Modtoggle()													;Milk mod toggle On/Off
;	Function AddMilkFx(Actor akActor, int i)								;Add milk leaking textures
;	Function AddLeak(Actor akActor)											;Add milk leaking effect
;	Function RemoveMilkFx1(Actor akActor)									;Remove leaking textures - full breasts
;	Function RemoveMilkFx2(Actor akActor)									;Remove leaking textures - after milking
;	Function DebuffArraySet()												;Set/Reset DeBuff Array and fill it with spells
;	Function BuffArraySet()													;Set/Reset Buff Array and fill it with spells
;	Function MaidRemove(Actor akActor)										;Removes milkmaid[i]
;	Function MaidReset()													;Maids reset
;	Function SlaveReset()													;Slaves reset
;	Function VarSetup()														;Mod variables reset
;	Function UNINSTALL()													;Mod reset, remove (de)buffs and effects
;
;---Actor status checks---
;	string Function akActorSex(Actor akActor)								;Checks for actor sex, female+schlong=futa
;	bool Function isVampire(Actor akActor)									;Checks if actor Vampire
;	bool Function isWerewolf(Actor akActor)									;Checks if actor Werewolf
;	bool Function isSuccubus(Actor akActor)									;Checks if actor Succubus Race or PSQ Succubus
;	bool Function isPregnant(Actor akActor)									;Checks if actor pregnant (ES+, BF 1.14, SGo, PSQ SGP, SL SGP)
;	int Function PiercingCheck(Actor akActor)								;Checks for nipple piercings, DD keyword + slot 56
;	int Function IsNamedMaid(Actor akActor)									;if actor has "Milkmaid" or "Milkslave" or "Cow" string in their name
;	Function sendVibrationEvent(string str, actor who, int mpas, int MilkingType)	;modevent for Use game controller as Vibrator! V3.0 
;
;---Pain/Exhaustion---
;	string Function NState(Actor akActor)									;Checks and returns nipple status of actor
;	int Function Pain(Actor akActor, int pain) 								;Increase pain during milking
;
;---Devious Devices checks(DDi plugin)---
;	bool Function IsWearingZaZGag (Actor akActor)
;	bool Function IsWearingZaZGag_Open (Actor akActor)
;	bool Function IsWearingGag (Actor akActor)
;	bool Function IsWearingGag_Open (Actor akActor)
;	bool Function IsWearingBelt (Actor akActor)
;	bool Function IsWearingBelt_Open (Actor akActor)
;	bool Function IsWearingDDMilker (Actor akActor)							;allows milking with DD bra/harness containing "Milk" in name
;	bool Function IsMilkingBlocked_Bra (Actor akActor)
;	bool Function IsMilkingBlocked_Armbinder (Actor akActor)
;	bool Function IsMilkingBlocked_Yoke (Actor akActor)
;	bool Function IsMilkingBlocked_PiercingsNipple (Actor akActor)
;	bool Function IsMilkingBlocked_Suit (Actor akActor)
;	bool Function IsWearingHarness (Actor akActor)
;	bool Function IsMilkingBlocked_Bra_SLSD (Actor akActor) 				;if true allows solo milking
;
;---SLA check(SLA plugin)---															;if SLA installed passes info to SLA, if not, returns 0
;	int Function GetActorArousal(Actor akActor)
;	float Function GetActorExposure(Actor akActor)
;	float Function GetActorExposureRate(Actor akActor)
;	Function UpdateActorExposure(Actor akActor, Int value)
;	Function UpdateActorExposureRate(Actor akActor, Float value)
;	Function UpdateActorOrgasmDate(Actor akActor)

;----------------------------------------------------------------------------
;Timers
;----------------------------------------------------------------------------

Event OnUpdate()
	if MilkPoll > 24
		RegisterForSingleUpdate(MilkPoll)
		ActorCheck(1)
	else
		RegisterForSingleUpdateGameTime (MilkPoll)
		GetCurrentHourOfDay()
	endif
EndEvent

Event OnUpdateGameTime()
	if MilkPoll <= 24
		RegisterForSingleUpdateGameTime (MilkPoll)
		Utility.Wait( 5.0 )
		GetCurrentHourOfDay()
	else
		RegisterForSingleUpdate(MilkPoll)
		ActorCheck(1)
	endif
EndEvent

Function GetCurrentHourOfDay()
	float Time = Utility.GetCurrentGameTime() 	; skyrim days spend in game
;	Time *= 24 									; skyrim hours spend in game
;	Time *= 60 									; skyrim minutes spend in game

	if LastTimeMilked != 0
		int scriptupdatetimes = ((Math.Floor(Time*24)) - (Math.Floor(LastTimeMilked*24)))
		if scriptupdatetimes >= 1 
			ActorCheck(scriptupdatetimes)
			LastTimeMilked = Time
		endif
	else
		LastTimeMilked = Time
		GetCurrentHourOfDay()
	endif
EndFunction

;----------------------------------------------------------------------------
;Key management
;----------------------------------------------------------------------------

Event OnKeyDown(int keyCode)
	Actor Target = crosshairRef
	If !Utility.IsInMenuMode() && NotificationKey == keyCode
		If HotkeyMode == 1
			;create uie
		Else
			If Target != None
				If MILKmaid.find(Target) == -1 && MILKslave.find(Target) == -1
					Debug.Notification("Target is not a milk maid/slave.")
					Return
				EndIf
			Else
				if MILKmaid.find(PlayerRef) != -1
					Target = PlayerRef
					;Alias[0].AddScriptPackage MilkPackage
				Else
					Debug.Notification("Player is not a milk maid.")
					Return
				EndIf
			EndIf
			If Target != None && (MILKmaid.find(Target) != -1 || MILKslave.find(Target) != -1)
				Float MilkCnt = MME_Storage.getMilkCurrent(Target)
				Float PainCnt = StorageUtil.GetFloatValue(Target,"MME.MilkMaid.PainCount")
				Float PainMax = MME_Storage.getPainMaximum(Target)
				Debug.Notification("Maid: " + Target.GetLeveledActorBase().GetName()\
								+ " Milk: " + ReduceFloat(MilkCnt)\
								+ " Nipples: " + NState(Target) + " [" + (PainCnt/PainMax*100) as int + "%]"\
								+ " Lactacid: " + ReduceFloat(StorageUtil.GetFloatValue(Target,"MME.MilkMaid.LactacidCount")))
			EndIf
		EndIf
	EndIf
EndEvent

Event OnKeyUp(Int KeyCode, Float HoldTime)
	If (!Utility.IsInMenuMode() && NotificationKey == keyCode)
		If HotkeyMode == 1
			;create uie
		Else
			If crosshairRef ==  none
				crosshairRef = PlayerRef
			EndIf
			If (Input.IsKeyPressed(42) && Input.IsKeyPressed(54))
				If crosshairRef.HasSpell( BeingMilkedPassive )
					crosshairRef.RemoveSpell( BeingMilkedPassive )
				EndIf
			ElseIf (Input.IsKeyPressed(42) || Input.IsKeyPressed(54)) || (HoldTime > 2.0)
				If crosshairRef.HasSpell( BeingMilkedPassive ) && !StorageUtil.GetIntValue(crosshairRef,"IsBoundStrict")
					If crosshairRef == PlayerRef
						Game.EnablePlayerControls() ;(True,True,True,True,True,True,True,True,0)
					EndIf
					Debug.SendAnimationEvent(crosshairRef,"IdleForceDefaultState")
				ElseIf crosshairRef.HasSpell( MilkForSprigganPassive )
					Debug.notification(crosshairRef.GetLeveledActorBase().GetName() + " is a host for living armor and can not be milked.")
				ElseIf StorageUtil.GetIntValue(crosshairRef,"MME.MilkMaid.IsSlave" ) == 1 && StorageUtil.GetIntValue(crosshairRef,"MME.MilkMaid.MilkingMode") != 0
					Debug.notification(crosshairRef.GetLeveledActorBase().GetName() + " is a slave and not allowed to be milked.")
				ElseIf crosshairRef.GetLeveledActorBase().GetSex() == 1
					MilkSelf.cast(crosshairRef)
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

Event OnCrosshairRefChange(ObjectReference ref)
	crosshairRef = none
	If ref != none
		crosshairRef = ref as Actor
	EndIf
EndEvent

;----------------------------------------------------------------------------
;Core
;----------------------------------------------------------------------------

Function ActorCheck(int t)
	debug.Trace("MilkModEconomy ActorCheck cycle")
	int i = 0
	If MilkMaid[i] != PlayerRef && PlayerRef.GetLeveledActorBase().GetSex() == 1 && isPregnant(PlayerRef) && !PlayerCantBeMilkmaid
		debug.Trace("MilkModEconomy Player is not milkmaid, but pregnant and female, making player milkmaid")
		AssignSlot(PlayerRef)
	EndIf
	While i < MilkMaid.Length
		if MilkMaid[i] != None
			if MilkMaid[i].IsDead()
				debug.Trace("MilkModEconomy Actor is dead, removing form MME:" + MilkMaid[i].GetLeveledActorBase().getname())
				SingleMaidReset(MilkMaid[i])
			elseif MilkMaid[i].GetLeveledActorBase().GetSex() == 1
				debug.Trace("MilkModEconomy MilkCycle for milkmaid:" + MilkMaid[i].GetLeveledActorBase().getname())
				MilkCycle(MilkMaid[i] , t)
			endif
		endif
		;(GetNthAlias(Alias[0])).ForceRefTo(PlayerRef)
		i = i + 1
	EndWhile
	i = 0
	While i < MilkSlave.Length
		if MilkSlave[i] != None
			if MilkSlave[i].IsDead()
				debug.Trace("MilkModEconomy Actor is dead, removing form MME:" + MilkSlave[i].GetLeveledActorBase().getname())
				SingleMaidReset(MilkSlave[i])
			elseif MilkSlave[i].GetLeveledActorBase().GetSex() == 1
				debug.Trace("MilkModEconomy MilkCycle for MilkSlave:" + MilkSlave[i].GetLeveledActorBase().getname())
				MilkCycle(MilkSlave[i] , t)
			endif
		endif
		i = i + 1
	EndWhile
	SendModEvent( "MME_MilkCycleComplete" )
EndFunction

Function UpdateActors()
	int idx1 = 0
	While idx1 < MilkMaid.Length
		MME_Storage.updateMilkCurrent(MilkMaid[idx1])
		CurrentSize(MilkMaid[idx1])
		idx1 = idx1 + 1
	EndWhile
	int idx2 = 0
	While idx2 < MilkSlave.Length
		MME_Storage.updateMilkCurrent(MilkSlave[idx2])
		CurrentSize(MilkSlave[idx2])
		idx2 = idx2 + 1
	EndWhile
EndFunction

Function MilkCycle(Actor akActor, int t)
	Float MilkTick
	Float MilkTickCycle
	Float PainTick
	Float BoobTick
	
	Float LactacidCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.LactacidCount")
	Float MaidMilkGen = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkGen")
	Float BreastBase = MME_Storage.getBreastsBasevalue(akActor)
	Float BreastBaseMod = MME_Storage.getBreastsBaseadjust(akActor)
	Float BreastRows = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1)
	Float MilkCnt = MME_Storage.getMilkCurrent(akActor)
	Float MilkMax = MME_Storage.getMilkMaximum(akActor)
	Float PainCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.PainCount")
	Float MaidLevel = MME_Storage.getMaidLevel(akActor)
	Float MaidTimesMilked = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.TimesMilked")

	Form maidArmor = akActor.GetWornForm(Armor.GetMaskForSlot(32));

	if t > MilkMax && BreastScaleLimit
		t = MilkMax as int
	endif
		
	if !BreastUpScale
		BoobTick = BreastBase
	elseif BreastBaseMod != 1
		BoobTick = BreastBase + BreastBaseMod
	else
		BoobTick = BreastBaseMod
	endif
	
	if BoobTick == 0
		BoobTick = 0.01
	endif

	float LevelBoobSize
	int tmod = t
	while tmod != 0
		LevelBoobSize = ( MaidLevel + ( MaidTimesMilked / (( MaidLevel + 1 ) * TimesMilkedMult ))) * StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BoobPerLvl", missing = BoobPerLvl)
		if LactacidCnt > 0 || ((MilkCnt + MilkTick <= BreastRows * (BoobTick + LevelBoobSize + (MilkCnt + MilkTick) * StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BoobIncr", missing = BoobIncr)) * (1 + akActor.GetLeveledActorBase().GetWeight()/100)) && (MaidMilkGen > 0 || isPregnant(akActor)))
			MaidMilkGen = MaidMilkGen + MilkGenValue
		else
			MaidMilkGen = MaidMilkGen - MilkGenValue/2
			if MaidMilkGen < 0
				MaidMilkGen = 0
			endif
		endif
		if LactacidCnt > 0 || (FixedMilkGen || (akActor != PlayerREF && FixedMilkGen4Followers ))
			MilkTickCycle = (BoobTick + LevelBoobSize + MaidMilkGen)/3 
		else
			MilkTickCycle = (LevelBoobSize + MaidMilkGen)/3/10
		endif
		if MaidMilkGen > 0 || (FixedMilkGen || (akActor != PlayerREF && FixedMilkGen4Followers ))
			MilkTick = MilkTick + MilkTickCycle * (1 + SLA.GetActorArousal(akActor)/100) * MilkProdMod/100 * BreastRows
		endif
		;if  WeightUpScale && akActor.GetLeveledActorBase().GetWeight() + 1 < 100 && LactacidCnt > 0
		;	Float NeckDelta = (akActor.GetLeveledActorBase().GetWeight() / 100) - ((akActor.GetLeveledActorBase().GetWeight() + 1) / 100)
		;	akActor.GetLeveledActorBase().SetWeight(akActor.GetLeveledActorBase().GetWeight() + 1)
		;	akActor.UpdateWeight(NeckDelta)
		;endif
		if LactacidDecayRate > 0
			LactacidCnt = LactacidCnt - LactacidDecayRate
		elseif LactacidDecayRate == 0
			LactacidCnt = LactacidCnt - MaidMilkGen
		endif
		tmod = tmod - 1
	endwhile

	If MilkAsMaidTimesMilked
		StorageUtil.AdjustFloatValue(akActor,"MME.MilkMaid.TimesMilked", MilkTick)
		MaidLevelCheck(akActor)
		MilkMax = MME_Storage.getMilkMaximum(akActor)
	EndIf

	Paintick = MilkTick + MilkMax/10
	MilkTick = MilkTick + MilkCnt
	PainCnt = PainCnt - paintick
	
	if LactacidCnt < 0
		LactacidCnt = 0
	endif
	
	if PainCnt < 0
		PainCnt = 0
	endif

	RemoveMilkFx1(akActor)
	RemoveMilkFx2(akActor)
	SLA.UpdateActorExposure(akActor, t)

	if MilkTick > MilkMax && PiercingCheck(akActor) != 2
		if BreastScaleLimit 
			MilkCnt = MilkMax
		else
			MilkCnt = MilkTick - (MilkTick * GushPct/100) - MilkTick / MilkMax 
		endif
		AddMilkFx(akActor, 1)
		AddLeak(akActor)
	endif
	
	StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.LactacidCount", LactacidCnt)
	StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.MilkGen", MaidMilkGen)
	StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.PainCount", PainCnt)
	MME_Storage.setMilkCurrent(akActor, MilkCnt, BreastScaleLimit)

	CurrentSize(akActor)
	PostMilk(akActor)
	
	if MilkMsgs
		MilkCycleMSG(akActor)
	endif
	
	if maidArmor != None  ;&& StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) == 1
		if (MilkingEquipment.Find(maidArmor.getname()) != -1 || maidArmor == MilkCuirass || maidArmor == MilkCuirassFuta || StringUtil.Find(maidArmor.getname(), "Milk" ) >= 0 || StringUtil.Find(maidArmor.getname(), "Cow" ) >=0)\
		&& StorageUtil.GetIntValue(akActor,"MME.MilkMaid.MilkingMode") == 2
			if StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerLactacid") > 0
				StorageUtil.AdjustFloatValue(akActor,"MME.MilkMaid.LactacidCount", 1)
				StorageUtil.AdjustFloatValue(akActor,"MME.MilkMaid.MilkingContainerLactacid", -1)
				if Plugin_SlSW && akActor == PlayerREF && !DisableSkoomaLactacid
					akActor.equipitem(Game.GetFormFromFile(0x57A7A, "Skyrim.esm"),false,true)	;skooma
				endif
			endif
			if MilkCnt >= 1
				MilkSelf.cast(akActor)
			endif
		elseif StringUtil.Find(maidArmor.getname(), "Spriggan" ) >= 0\
		|| StringUtil.Find(maidArmor.getname(), "Living Arm" ) >= 0\
		|| StringUtil.Find(maidArmor.getname(), "Hermaeus Mora" ) >= 0\
		|| StringUtil.Find(maidArmor.getname(), "HM Priestess" ) >= 0\
		|| StringUtil.Find(maidArmor.getname(), "Tentacle Armor" ) >= 0\
		|| StringUtil.Find(maidArmor.getname(), "Tentacle Parasite" ) >= 0\
		|| BasicLivingArmor.find(maidArmor.getname()) >= 0\
		|| ParasiteLivingArmor.find(maidArmor.getname()) >= 0
			StorageUtil.AdjustFloatValue(akActor,"MME.MilkMaid.LactacidCount", 1 * t)
			if Plugin_SlSW && akActor == PlayerREF && !DisableSkoomaLactacid
				akActor.equipitem(Game.GetFormFromFile(0x57A7A, "Skyrim.esm"),false,true)	;skooma
			endif
			int rnd = Utility.RandomInt((0-MilkCnt) as int, (MilkMax-MilkCnt) as int)
			if (rnd == MilkMax || rnd < 0) && akActor.GetLeveledActorBase().GetSex() == 1
				;Estrus Chaurus+  
				if (StringUtil.Find(maidArmor.getname(), "Tentacle Armor" ) >= 0 || StringUtil.Find(maidArmor.getname(), "Tentacle Parasite" ) >= 0 || ParasiteLivingArmor.find(maidArmor.getname()) >= 0)\
				&& Plugin_EstrusChaurus && ECTrigger
					int ECTrap = ModEvent.Create("ECStartAnimation")  					; Int  Does not have to be named "ECTrap" any name would do
					if (ECTrap) && !akActor.IsInCombat() && !akActor.IsOnMount()
						ModEvent.PushForm(ECTrap, akActor)								; Form (Some SendModEvent scripting "black magic" - required)
						ModEvent.PushForm(ECTrap, akActor)								; Form The animation target
						ModEvent.PushInt(ECTrap, 0)										; Int  The animation required    0 = Tentacles, 1 = Machine
						ModEvent.PushBool(ECTrap, true)									; Bool Apply the linked EC effect (Ovipostion for Tentacles, Exhaustion for Machine) 
						ModEvent.Pushint(ECTrap, ECRange)								; Int  Alarm radius in units (0 to disable) 
						ModEvent.PushBool(ECTrap, ECCrowdControl)						; Bool Use EC (basic) crowd control on hostiles 
						ModEvent.Send(ECtrap)
					else
						;EC is not installed
					endIf
					Milking(akActor, 0, 4, 0)
				else
					MilkForSpriggan.cast(akActor)
				endif
			endif
		endif
	endif
	
	If MILKSlave.Find(akActor) != -1
		StorageUtil.AdjustFloatValue(akActor,"MME.MilkMaid.LactacidCount", 1 * t)
		MilkMax = MME_Storage.getMilkMaximum(akActor)
		if MilkCnt > MilkMax
			MilkSelf.cast(akActor)
		endif
	endIf
EndFunction

Function AssignSlot(Actor akActor)
	If akActor == PlayerREF
		MILKmaid[0] = akActor
	Else
		int i = 1
		int count = 0
		While i < MilkMaid.Length && Milklvl0fix() > count
			If MilkMaid[i] == None
				count = count + 1
			EndIf
			i = i + 1
		EndWhile
		i = MILKmaid.Find(none,1)
		If i != -1 && count >= 1
			MILKmaid[i] = akActor
		Else
			Debug.notification("No more Milk Maid slots")
			return
		Endif
	EndIf
	MME_Storage.initializeActor(akActor)
	Debug.Notification(akActor.GetLeveledActorBase().GetName() + " becomes a Milk Maid")
	akActor.AddToFaction(MilkMaidFaction)
EndFunction

Function AssignSlotSlave(Actor akActor, Int Level, Float Milk)
	If akActor == PlayerREF
		Debug.notification("Actor is Player and cannot be milkslave")
		return
	EndIf
	int i = MILKSlave.Find(none)
	If i != -1
		MILKSlave[i] = akActor
		MME_Storage.initializeActor(akActor, Level, Milk)
		StorageUtil.SetIntValue(akActor,"MME.MilkMaid.IsSlave", 1)
		akActor.AddToFaction(MilkSlaveFaction)
	Else
		Debug.notification("No more Milk Slave slots")
		return
	Endif
EndFunction

Function AssignSlotSlaveToMaid(Actor akActor)
	int i = MILKSlave.Find(akActor)
	If i != -1
		MILKSlave[i] = none
		i = 1
		int count = 0
		While i < MilkMaid.Length && Milklvl0fix() > count
			If MilkMaid[i] == None
				count = count + 1
			EndIf
			i = i + 1
		EndWhile
		i = MILKmaid.Find(none,1)
		If i != -1 && count >= 1
			MILKmaid[i] = akActor
		Else
			Debug.notification("No more Milk Maid slots")
			return
		Endif
		StorageUtil.SetIntValue(akActor,"MME.MilkMaid.IsSlave", 0)
		akActor.RemoveFromFaction(MilkSlaveFaction)
		akActor.AddToFaction(MilkMaidFaction)
	Else
		Debug.notification("Actor is not a Milk Slave, something wrong in calling Function AssignSlotSlaveToMaid")
		return
	Endif
EndFunction

Function AssignSlotMaidToSlave(Actor akActor)
	int i = MilkMaid.Find(akActor)
	If i != -1
		MilkMaid[i] = none
		i = 1
		i = MILKSlave.Find(none,1)
		If i != -1
			MILKSlave[i] = akActor
		Else
			Debug.notification("No more Milk Slave slots")
			return
		Endif
		StorageUtil.SetIntValue(akActor,"MME.MilkMaid.IsSlave", 1)
		akActor.AddToFaction(MilkSlaveFaction)
		akActor.RemoveFromFaction(MilkMaidFaction)
	Else
		Debug.notification("Actor is not a Milk maid, something wrong in calling Function AssignSlotMaidToSlave")
		return
	Endif
EndFunction

Function CurrentSize(Actor akActor)
	Float BreastBase = MME_Storage.getBreastsBasevalue(akActor)
	Float MaidBoobIncr = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BoobIncr", missing = BoobIncr)
	Float MaidBoobPerLvl = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BoobPerLvl", missing = BoobPerLvl)
	Float BreastBaseMod = MME_Storage.getBreastsBaseadjust(akActor)
	Float MilkCnt = MME_Storage.getMilkCurrent(akActor)
	Float MaidLevel = MME_Storage.getMaidLevel(akActor)
	Float MaidTimesMilked = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.TimesMilked")
	Float CurrentSize
	Float CurveFix
	
	if BreastUpScale
		if BreastBase + BreastBaseMod < 1
			BreastBaseMod = BreastBaseMod + 0.1
			MME_Storage.setBreastsBaseadjust(akActor, BreastBaseMod)
		endif
		BreastBase = BreastBase + BreastBaseMod
	endif

	;MilkCnt = BreastBase - MilkCnt * MaidBoobIncr
	;if MilkCnt <= BreastBase
	;	MilkCnt = 0
	;endif

	CurrentSize = BreastBase + ( MilkCnt * MaidBoobIncr ) + ( MaidLevel + ( MaidTimesMilked / (( MaidLevel + 1 ) * TimesMilkedMult ))) * MaidBoobPerLvl

	if CurrentSize > BoobMAX && BoobMAX != 0
		CurrentSize = BoobMAX
	endif
	
	If(CurrentSize <= 1)
		CurveFix = 1.0
	Else
		CurveFix = 1.0 - (CurrentSize * BreastCurve)
		If CurveFix < BoobMAX / 10
			CurveFix = BoobMAX / 10
		EndIf
	EndIf

	if CurrentSize > 0	&& BreastScale != 3 && akActor.GetLeveledActorBase().GetSex() == 1 && akActor.IsInLocation(PlayerREF.getCurrentLocation())
		;HDT Female / Vampire Lord
			self.SetNodeScale(akActor, "NPC L Breast", CurrentSize)
			self.SetNodeScale(akActor, "NPC R Breast", CurrentSize)
			
		;Curve fix
		;HDT Female / Vampire Lord
			self.SetNodeScale(akActor, "NPC L Breast01", CurveFix)
			self.SetNodeScale(akActor, "NPC R Breast01", CurveFix)

		;HDT Werewolf
			self.SetNodeScale(akActor, "NPC L Breast P1", CurrentSize)
			self.SetNodeScale(akActor, "NPC R Breast P1", CurrentSize)
			self.SetNodeScale(akActor, "NPC L Breast P2", CurrentSize)
			self.SetNodeScale(akActor, "NPC R Breast P2", CurrentSize)
			self.SetNodeScale(akActor, "NPC L Breast P3", CurrentSize)
			self.SetNodeScale(akActor, "NPC R Breast P3", CurrentSize)
		
		
		;Schlong
		;NetImmerse.SetNodeScale(akActor, "NPC L GenitalsScrotum [LGenScrot]", CurrentSize, false)
		;NetImmerse.SetNodeScale(akActor, "NPC R GenitalsScrotum [RGenScrot]", CurrentSize, false)
		;FPS
		;NetImmerse.SetNodeScale(akActor, "NPC L GenitalsScrotum [LGenScrot]", CurrentSize, true)
		;NetImmerse.SetNodeScale(akActor, "NPC R GenitalsScrotum [RGenScrot]", CurrentSize, true)
	endif
EndFunction

;----------------------------------------------------------------------------
;functions called by milking scripts
;----------------------------------------------------------------------------

Function Milking(Actor akActor, int i, int Mode, int MilkingType)
	;Mode == 0 - Pump Milking
	;Mode == 1 - Other Milking
	;Mode == 2 - Equipment Milking
	;Mode == 3 - Forced Armor Milking(Spriggan/HM/LA)
	;Mode == 4 - Called by other mods, 
	;MilkingType == 0 normal/none milkpump
	;MilkingType == 1 bound/ disable player control
	
	Int soundInstance01
	Int soundInstance03
	Int pain = 1
	Int bottles = 0			;times milked
	Int MlikExpression
	Int armorcheckloop = 0
	Int boobgasmcount = 0
	Int cumcount = 0
	Int mpas = 1
	Bool IsMilkMaid = true
	Bool IsMilkingBlocked = false
	Bool armf = false
	Bool FirstTimeStory = false
	Bool FeedOnce = true
	Form maidArmor
	Form cuirass = akActor.GetWornForm(Armor.GetMaskForSlot(32))

	;Devious Devices management
	Bool DDArmbinder = DDi.IsMilkingBlocked_Armbinder(akActor)
	Bool DDYoke = DDi.IsMilkingBlocked_Yoke(akActor)
	Bool DDSuit = DDi.IsMilkingBlocked_Suit(akActor)
	Bool DDBelt = DDi.IsWearingBelt(akActor)
	Bool DDBeltOpen = DDi.IsWearingBelt_Open(akActor)
	Bool DDGag = DDi.IsWearingGag(akActor)
	Bool DDGagOpen = DDi.IsWearingGag_Open(akActor)
	Bool DDBra = DDi.IsMilkingBlocked_Bra(akActor)
	Bool SLSDBra = SLSD.IsMilkingBlocked_Bra_SLSD(akActor)
	Bool hasInventoryMilkCuirass = false
	Bool hasInventoryMilkCuirassFuta = false
	Bool bControlsDisabled = false

	Bool ZaZGag = zbf.IsWearingZaZGag(akActor)
	Bool ZaZGagOpen = zbf.IsWearingZaZGag_Open(akActor)
	
	String akActorGender = akActorSex(akActor)
	
	String anivar = ""
	if DDBeltOpen == true					;--vaginal probe
		anivar = anivar + "_02"
	elseif DDBelt == true					;-anal plug -vaginal probe
		anivar = anivar + "_01"
	endif
	
	Float LactacidCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.LactacidCount")
	Float LactacidMax = MME_Storage.getLactacidMaximum(akActor)
	Float MilkCnt = MME_Storage.getMilkCurrent(akActor)
	Float MilkMax = MME_Storage.getMilkMaximum(akActor)
	Float MaidLevel = MME_Storage.getMaidLevel(akActor)
	Float PainCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.PainCount")
	Float PainMax = MME_Storage.getPainMaximum(akActor)
	Float MaidTimesMilked = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.TimesMilked")
	Float TimesMilked = StorageUtil.GetFloatValue(none,"MME.Progression.TimesMilked")
	Float TimesMilkedAll = StorageUtil.GetFloatValue(none,"MME.Progression.TimesMilkedAll")

	if akActor.HasSpell( BeingMilkedPassive )
		if MilkingType != 1						;prevents msg spam from aidrivenplayer bound milkpump, since its activates script endlessly,
			Debug.notification(akActor.GetLeveledActorBase().GetName() + " already being milked, if something went wrong, remove Milking passive spell from Milk Maid debug menu")
		endif
		return									; prevents multiple scripts running
	endif

	if MILKmaid.find(akActor) != -1 || MILKSlave.find(akActor) != -1
		akActor.AddSpell( BeingMilkedPassive, false )
	else
		IsMilkMaid = false
		;Debug.notification("No milkmaid mode")
	endif

;-----------------------Milking block check
	
	if PiercingCheck(akActor) == 2 && IsMilkingBlocked == false
		Debug.Notification("Nipple Plugs prevents milking")
		if mode > 0
			akActor.RemoveSpell( BeingMilkedPassive )
			return
		else
			IsMilkingBlocked = true
		endif
	endif
	
	if Plugin_DDI && IsMilkingBlocked == false
		if DDi.IsWearingDDMilker(akActor) == false
			if DDBra == true && SLSDBra == false
				Debug.Notification("Chastity Bra prevents milking")
				if mode > 0 && SLSDBra == false
					akActor.RemoveSpell( BeingMilkedPassive )
					return
				else
					IsMilkingBlocked = true
				endif
			endif
		endif
	endif

;-----------------------Milking mode selection
	
	if MaidTimesMilked == 0 && MaidLevel == 0
		FirstTimeStory = true
	endif

	if Mode == 0
		if Plugin_DDI
			if DDArmbinder == true
				Debug.Messagebox("Armbinder prevents using of the device")
				akActor.RemoveSpell( BeingMilkedPassive )
				return
			elseif DDYoke == true
				Debug.Messagebox("Yoke prevents using of the device")
				akActor.RemoveSpell( BeingMilkedPassive )
				return
			elseif DDSuit == true
				Debug.Messagebox("Bondage suit prevents using of the device")
				akActor.RemoveSpell( BeingMilkedPassive )
				return
			endif
			if Feeding && ((ZaZGag == true && ZaZGagOpen == false) || (DDGag == true && DDGagOpen == false))
				Debug.Messagebox("Gag prevents feeding")
			endif
		endif
		
		if MilkingType == 1 && PlayerREF == akActor
			;Game.DisablePlayerControls(1, 1, 0, 0, 1, 1, 0) ;(True,True,False,False,True,True,True,True,0)
			Game.SetPlayerAIDriven(true)
			Game.DisablePlayerControls()
			bControlsDisabled = true
			if MilkMsgs
				debug.Notification("You feel Milk Pump secure your body, removing your ability to move.")
			endif
		endif
		
		while armorcheckloop < armname.Length && !armf && IsMilkingBlocked == false
			int armloop = 0
			while armloop <= 4 && !armf
				maidArmor = akActor.GetWornForm(Armor.GetMaskForSlot(armslot[armloop]))
				if maidArmor != None
					if StringUtil.Find(maidArmor.getname(), armname[armorcheckloop] ) >= 0
						Debug.Notification( maidArmor.getname() + " prevents milking")
						armf = true
						if mode > 0 
							akActor.RemoveSpell( BeingMilkedPassive )
							return
						else
							IsMilkingBlocked = true
						endif
					endif
				endif
				armloop = armloop + 1
			endwhile
			armorcheckloop = armorcheckloop + 1
		endwhile

		Utility.Wait( 5.0 )															;wait for actor to "sit"
		If IsMilkingBlocked == false && SLSDBra == false
			If MilkStory && akActor == PlayerREF && akActorGender != "Male"
				StoryDisplay(0,1,FirstTimeStory)
			EndIf
			
			if StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) != 1
				;do nothing
			elseif cuirass != None
				if !(cuirass == MilkCuirass || cuirass == MilkCuirassFuta) && !((StringUtil.Find(cuirass.getname(), "Milk" ) >= 0) || (MilkingEquipment.find(cuirass.getname()) >= 0))
					akActor.UnequipItem(cuirass, false, true)
				endif
				if MilkNaked == false
					if MilkWithZaZMoMSuctionCups == true
						akActor.additem(ZaZMoMSuctionCups, 1, true)
						akActor.equipitem(ZaZMoMSuctionCups, true, true)
					elseif !akActor.IsEquipped(cuirass)
						if akActorGender == "Futa"
							akActor.additem(MilkCuirassFuta, 1, true)
							akActor.equipitem(MilkCuirassFuta, true, true)
						else
							akActor.additem(MilkCuirass, 1, true)
							akActor.equipitem(MilkCuirass, true, true)
						endif
					endif
				endif
			elseif MilkNaked == false
				if MilkWithZaZMoMSuctionCups == true
					akActor.additem(ZaZMoMSuctionCups, 1, true)
					akActor.equipitem(ZaZMoMSuctionCups, true, true)
				else
					if akActorGender == "Futa"
						akActor.additem(MilkCuirassFuta, 1, true)
						akActor.equipitem(MilkCuirassFuta, true, true)
					else
						akActor.additem(MilkCuirass, 1, true)
						akActor.equipitem(MilkCuirass, true, true)
					endif
				endif
			endif
		EndIf
	elseif mode == 4
		;do nothing
	elseIf MilkCnt >= 1
		if cuirass != None
			if StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) != 1
				Mode = 1
			ElseIf StringUtil.Find(cuirass.getname(), "Milk" ) >= 0 \
			|| StringUtil.Find(cuirass.getname(), "Cow" ) >= 0 \
			|| MilkingEquipment.find(cuirass.getname()) >= 0\
			|| SLSDBra == true
				Mode = 2
			ElseIf akActor.GetItemCount(MilkCuirassFuta) > 0 && akActorGender == "Futa"
				akActor.equipitem(MilkCuirassFuta, true, true)
				hasInventoryMilkCuirassFuta = true
				Mode = 2
			ElseIf akActor.GetItemCount(MilkCuirass) > 0 && akActorGender != "Futa"
				akActor.equipitem(MilkCuirass, true, true)
				hasInventoryMilkCuirass = true
				Mode = 2
			ElseIf StringUtil.Find(cuirass.getname(), "Spriggan" ) >= 0 \
				|| StringUtil.Find(cuirass.getname(), "Living Arm" ) >= 0 \
				|| StringUtil.Find(cuirass.getname(), "HM Priestess" ) >= 0 \
				|| StringUtil.Find(cuirass.getname(), "Hermaeus Mora" ) >= 0 \
				|| BasicLivingArmor.find(cuirass.getname()) >= 0 \
				|| ParasiteLivingArmor.find(cuirass.getname()) >= 0
				Mode = 3
				int soundInstance02 = TakeHoldSound.Play(akActor)
				Utility.Wait( 5.0 )													;wait for possession sound to play
				If MilkStory && akActor == PlayerREF && akActorGender != "Male"
					if StringUtil.Find(cuirass.getname(), "Hermaeus Mora" ) >= 0 || StringUtil.Find(cuirass.getname(), "HM Priestess" ) >= 0
						StoryDisplay(0,3,FirstTimeStory)
					elseif StringUtil.Find(cuirass.getname(), "Living Arm" ) >= 0
						StoryDisplay(0,4,FirstTimeStory)
					else
						StoryDisplay(0,2,FirstTimeStory)
					endif
				Endif
				Sound.StopInstance( soundInstance02 )
			Else
				akActor.UnequipItem(cuirass, false, true)
			EndIf
		ElseIf akActor.GetItemCount(MilkCuirassFuta) > 0 && akActorGender == "Futa"
			akActor.equipitem(MilkCuirassFuta, true, true)
			hasInventoryMilkCuirassFuta = true
			Mode = 2
		ElseIf akActor.GetItemCount(MilkCuirass) > 0 && akActorGender != "Futa"
			akActor.equipitem(MilkCuirass, true, true)
			hasInventoryMilkCuirass = true
			Mode = 2
		Endif
		If (Mode == 2 || Mode == 1) && (DDArmbinder == true || DDYoke == true)
			If akActor == PlayerRef
				Debug.Notification("With your hands bound there is no way you can be milked without somebody's help")
			Else
				Debug.Notification("With hands bound there is no way " + akActor.GetLeveledActorBase().GetName() + " can be milked without somebody's help")
			EndIf
			IsMilkingBlocked = true
			akActor.RemoveSpell( BeingMilkedPassive )
			return
		ElseIf !(DDArmbinder == true || DDYoke == true)
			If IsMilkingBlocked == false
				If PlayerREF == akActor && !akActor.IsInCombat()
					Game.ForceThirdPerson()
					Game.DisablePlayerControls(1, 1, 0, 0, 1, 1, 0) ;(True,True,False,False,True,True,True,True,0)
					Utility.Wait( 5.0 )												;wait for actor to stop moving (and player to release movement keys)
				EndIf
				If !StorageUtil.GetIntValue(akActor,"IsBoundStrict") && !akActor.IsInCombat()
					mpas = Utility.RandomInt (1, 3)
					if mpas == 1
						Debug.SendAnimationEvent(akActor,"ZaZAPCHorFA")
					elseif mpas == 2
						Debug.SendAnimationEvent(akActor,"ZaZAPCHorFB")
					elseif mpas == 3
						Debug.SendAnimationEvent(akActor,"ZaZAPCHorFC")
					endif
				EndIf
			EndIf
		EndIf
	ElseIf MilkCnt < 1
		Debug.Notification(akActor.GetLeveledActorBase().getname() + " have no milk!")
		akActor.RemoveSpell( BeingMilkedPassive )
		return
	endif
	
	sendVibrationEvent("StartMilkingMachine", akActor, mpas, MilkingType)

;-----------------------Feeding/Milking/Fuck machine

	if IsMilkMaid == false && PlayerREF.GetDistance(akActor) < 500		;add npc/recheck player with milkcuirass(since its forced by checkforspriggan)
		if MILKmaid.find(akActor) != -1
			int ButtonPressed = (MakeMilkMaid).Show()
			if ButtonPressed == 0
				AssignSlot(akActor)
				if MILKmaid.find(akActor) != -1
					akActor.AddSpell( BeingMilkedPassive, false )
					IsMilkMaid = true
				endif
			endif
		else
			akActor.AddSpell( BeingMilkedPassive, false )
			IsMilkMaid = true
		endif
	endif
	
	while (((akActor.GetSitState() <= 3 && akActor.GetSitState() > 0) || !akActor.IsInLocation(PlayerREF.getCurrentLocation()))\
			|| (MilkCnt >= 1 && Mode > 0 && ((PainCnt <= PainMax*0.9) || PainKills)))\
			&& (akActor.HasSpell(BeingMilkedPassive) || !IsMilkMaid)

		;debug.Notification("cycle start")
		float duration = 0
		if SLA.GetActorArousal(akActor) > 75
			mpas = 2
		else 
			mpas = 1
		endif

		Utility.Wait(1.0)

		;FEEDING STAGE
		If Feeding == true && Mode == 0 && akActor.GetLeveledActorBase().GetSex() == 1 && (LactacidCnt < LactacidMax || (FeedOnce && ForcedFeeding))\
		&& ((akActor.GetSitState() <= 3 && akActor.GetSitState() > 0) || akActor.IsInLocation(PlayerREF.getCurrentLocation()))\
		&& (DDGag == false || DDGagOpen == true) && (ZaZGag == false || ZaZGagOpen == true)
	
			;debug.Notification("feeding cycle")
			akActor.AddSpell(FeedingStage, false)
			
			if Feeding_Sound == 0 || (Feeding_Sound == 1 && akActor == PlayerRef)
				soundInstance03 = FeedingSound.Play(akActor)
				Sound.SetInstanceVolume(soundInstance03, 1.0)
			endif
			
			if IsMilkMaid && MilkMsgs && PlayerREF.GetDistance(akActor) < 500
				debug.Notification(akActor.GetLeveledActorBase().GetName() + " is being fed Lactacid" )
			endif
			if MilkingType == 0
				Debug.SendAnimationEvent(akActor,("ZaZMOMFreeFurn_05"+anivar))
			elseif MilkingType == 1
				Debug.SendAnimationEvent(akActor,("ZaZMOMBoundFurn_05"+anivar))
			endif
			sendVibrationEvent("FeedingStage", akActor, mpas, MilkingType)

			if Plugin_SlSW && akActor == PlayerREF && IsMilkMaid == true && !DisableSkoomaLactacid
				akActor.equipitem(Game.GetFormFromFile(0x57A7A, "Skyrim.esm"),false,true)
			endif
			while duration < Feeding_Duration && (((akActor.GetSitState() <= 3 && akActor.GetSitState()) || akActor.IsInLocation(PlayerREF.getCurrentLocation()))|| Mode != 0) && (akActor.HasSpell(BeingMilkedPassive) || !IsMilkMaid)
				LactacidCnt = LactacidCnt + (MaidLevel+2)/Feeding_Duration
				Utility.Wait(1.0)
				duration = duration + 1
			endwhile

			if IsMilkMaid
				StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.LactacidCount", LactacidCnt)
			endif
			duration = 0
			Sound.StopInstance(soundInstance03)
			FeedOnce = false
		Endif

		if akActor.HasSpell(FeedingStage)
			akActor.RemoveSpell( FeedingStage )
		endif
		
		;MILKING STAGE
		if (((MilkCnt >= 1 || ((FuckMachine == false || DDBelt == true) && Mode == 0)) || !IsMilkMaid) && (((akActor.GetSitState() <= 3 && akActor.GetSitState() > 0) || akActor.IsInLocation(PlayerREF.getCurrentLocation())) || Mode > 0))\
		&& IsMilkingBlocked == false && akActor.GetLeveledActorBase().GetSex() == 1\
		&& ((PainCnt <= PainMax*0.9) || PainKills)

			;debug.Notification("milking cycle")
			akActor.AddSpell(MilkingStage, false)
			soundInstance01 = MilkSound.Play(akActor)
			Sound.SetInstanceVolume(soundInstance01, 1.0)
			
			;milkpump animation selector
			If Mode == 0 && (akActor.GetSitState() <= 3 && akActor.GetSitState() > 0)
				if MilkingType == 0
					if mpas == 1
						Debug.SendAnimationEvent(akActor,("ZaZMOMFreeFurn_11"+anivar))
					elseif mpas == 2
						Debug.SendAnimationEvent(akActor,("ZaZMOMFreeFurn_12"+anivar))
					endif
				elseif MilkingType == 1
					if mpas == 1
						Debug.SendAnimationEvent(akActor,("ZaZMOMBoundFurn_11"+anivar))
					elseif mpas == 2
						Debug.SendAnimationEvent(akActor,("ZaZMOMBoundFurn_12"+anivar))
					endif
				endif
			Endif
			sendVibrationEvent("MilkingStage", akActor, mpas, MilkingType)
			
			while duration < Milking_Duration && ((akActor.GetSitState() <= 3 && akActor.GetSitState() > 0) || Mode != 0) && (akActor.HasSpell(BeingMilkedPassive) || !IsMilkMaid)
				;if DDGag == false || ZaZGag == false
					if 	PainCnt >= PainMax
						MlikExpression = 4
						SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (70, 100), true)
					elseif 	PainCnt >= (PainMax/3*2) || ( Mode == 1 )
						MlikExpression = Utility.RandomInt(2, 4)
						SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (30, 100), true)
					else
						MlikExpression = Utility.RandomInt(1, 3)
						SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (30, 100), false)
					endif
				;else
				;	zbf.Main.PlayGagSound(akActor)
				;endif
				
				if DDGag == false || ZaZGagOpen == false
					if MlikExpression == 1
						SexLab.GetExpressionByName("Happy").ApplyTo(akActor, Utility.RandomInt(30, 50))
					elseif MlikExpression == 2
						SexLab.GetExpressionByName("Pleasure").ApplyTo(akActor, Utility.RandomInt(30, 100))
					elseif MlikExpression == 3
						SexLab.GetExpressionByName("Joy").ApplyTo(akActor, Utility.RandomInt(30, 100))
					elseif MlikExpression == 4
						SexLab.GetExpressionByName("Pained").ApplyTo(akActor, Utility.RandomInt(50, 70))
					endif
				endif

				if MilkingDrainsSP
					akActor.DamageActorValue("Stamina", 0.25 * akActor.GetBaseActorValue("Stamina"))
				endif
				if MilkingDrainsMP
					akActor.DamageActorValue("Magicka", 0.25 * akActor.GetBaseActorValue("Magicka"))
				endif
				Utility.Wait(1.0)
				duration = duration + 1
			endwhile
			
			if MilkCnt >= 1
				bottles = bottles + 1
				if !IsMilkMaid
					MilkCnt = MilkCnt - 1
				endif
			endif

			if IsMilkMaid
				int gush = (MilkCnt * GushPct/100) as int
				if gush < 1
					gush = 1
				endif
				if gush > 1
					bottles = bottles + gush
				endif
				if StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkGen") == 0 
					if Utility.RandomInt(0, 100) < 15
						debug.Notification(akActor.GetLeveledActorBase().GetName() + "'s breasts has started lactating.")
						StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkGen", MilkGenValue/3/10 * gush)
					endif
				else
					StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkGen", MilkGenValue/3/10 * gush)
				endif

				if MilkCnt >= 1
					MilkCnt = MilkCnt - 1 * gush
					StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.TimesMilked", 1 * gush)
					MaidLevelCheck(akActor)
					MME_Storage.setMilkCurrent(akActor, MilkCnt, BreastScaleLimit)
					; refetch to make sure we have the correct value (with applied max-limit)
					; (just to be sure to avoid any chance that there is MilkCnt>MilkMax because the maid
					;  generates more milk during a milking cycle then is being drained by milking)
					MilkCnt = MME_Storage.getMilkCurrent(akActor)
					CurrentSize(akActor)
					if PlayerREF.GetDistance(akActor) < 500 && MilkMsgs && MilkCntMsgs
						debug.Notification(akActor.GetLeveledActorBase().GetName() + "'s remaining capacity: " + MilkCnt + ", Milked capacity: " + bottles)
					endif
					if mode == 1
						AddMilkFx(akActor, 1)
						AddLeak(akActor)
					endif
				endif
				
				if mode > 0 && PainSystem
					Pain = Pain(akActor, pain) * 2
				elseif PainSystem
					Pain = Pain(akActor, pain)
				endif
				PainCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.PainCount")

				;if PainCnt >= PainMax && PainSystem && PainKills && MilkQC.Buffs											;change to apply stacking 1h debuff spell hp/sp/mp -5% or smthing like that
					;akActor.equipitem(MilkE.OverMilkingEff, true, true) 
					;akActor.DamageActorValue("Health", 0.5 * (akActor.GetBaseActorValue("Health") / pain))
				;endif
			Endif

		;FUCK MACHINE STAGE 
		elseif FuckMachine == true && Mode == 0 && ((akActor.GetSitState() <= 3 && akActor.GetSitState() > 0) || akActor.IsInLocation(PlayerREF.getCurrentLocation())) && DDBelt == false && (akActor.HasSpell(BeingMilkedPassive) || !IsMilkMaid)

			;debug.Notification("FuckMachine cycle")
			akActor.AddSpell(FuckMachineStage, false)
			soundInstance01 = MilkSound.Play(akActor)
			Sound.SetInstanceVolume(soundInstance01, 1.0)
			
			;milkpump animation selector
			If Mode == 0 && (akActor.GetSitState() <= 3 && akActor.GetSitState() > 0)
				if MilkingType == 0
					if mpas == 1
						Debug.SendAnimationEvent(akActor,("ZaZMOMFreeFurn_07"+anivar))
					elseif mpas == 2
						Debug.SendAnimationEvent(akActor,("ZaZMOMFreeFurn_08"+anivar))
					endif
				elseif MilkingType == 1
					if mpas == 1
						Debug.SendAnimationEvent(akActor,("ZaZMOMBoundFurn_07"+anivar))
					elseif mpas == 2
						Debug.SendAnimationEvent(akActor,("ZaZMOMBoundFurn_08"+anivar))
					endif
				endif
			endif
			sendVibrationEvent("FuckMachineStage", akActor, mpas, MilkingType)
				
			while duration < FuckMachine_Duration && ((akActor.GetSitState() <= 3 && akActor.GetSitState() > 0) || Mode != 0) && (akActor.HasSpell(BeingMilkedPassive) || !IsMilkMaid)
				;if DDGag == false || ZaZGag == false
					if 	PainCnt >= PainMax
						MlikExpression = 4
						SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (70, 100), true)
					elseif 	PainCnt >= (PainMax/3*2) || ( Mode == 1 )
						MlikExpression = Utility.RandomInt(2, 4)
						SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (30, 100), true)
					else
						MlikExpression = Utility.RandomInt(1, 3)
						SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (30, 100), false)
					endif
				;else
				;	zbf.Main.PlayGagSound(akActor)
				;endif
				if DDGag == false || ZaZGag == false
					if MlikExpression == 1
						SexLab.GetExpressionByName("Happy").ApplyTo(akActor, Utility.RandomInt(30, 50))
					elseif MlikExpression == 2
						SexLab.GetExpressionByName("Pleasure").ApplyTo(akActor, Utility.RandomInt(30, 100))
					elseif MlikExpression == 3
						SexLab.GetExpressionByName("Joy").ApplyTo(akActor, Utility.RandomInt(30, 100))
					elseif MlikExpression == 4
						SexLab.GetExpressionByName("Pained").ApplyTo(akActor, Utility.RandomInt(50, 70))
					endif
				endif

				if MilkingDrainsSP
					akActor.DamageActorValue("Stamina", 0.25 * akActor.GetBaseActorValue("Stamina"))
				endif
				if MilkingDrainsMP
					akActor.DamageActorValue("Magicka", 0.25 * akActor.GetBaseActorValue("Magicka"))
				endif
				Utility.Wait(1.0)
				duration = duration + 1
			endwhile
		endif

		;Cycle wrap-up
		
		SLA.UpdateActorExposure(akActor, mpas)

		if SLA.GetActorArousal(akActor) > 98 && (akActor.HasSpell(MilkingStage) || akActor.HasSpell(FuckMachineStage))
			Int exposureValue = ((((bottles + 1) / (MilkCnt + bottles + 1)) * 3 * -20.0)/(1+SLA.GetActorExposureRate(akActor)/3)) as Int
			if PlayerREF.GetDistance(akActor) < 500 && MilkMsgs 
				if akActor.HasSpell(MilkingStage)
					debug.Notification(akActor.GetLeveledActorBase().GetName() + " is having a boobgasm" )
				elseif akActor.HasSpell(FuckMachineStage)
					debug.Notification(akActor.GetLeveledActorBase().GetName() + " is having a orgasm" )
				endif
			endif
			if akActor == PlayerREF && Game.GetCameraState() != 3
				Game.ShakeCamera(none, Utility.RandomFloat(0.5 , 1), 5)
			endIf
			SexLab.PickVoice(akActor).Moan(akActor, Utility.RandomInt (70, 100), false)
			if akActor == PlayerREF
				SendModEvent("PlayerOrgasmStart")
				Utility.Wait(5.0)
				SendModEvent("PlayerOrgasmEnd")
			endIf
			SLA.UpdateActorOrgasmDate(akActor)
			SLA.UpdateActorExposure(akActor, exposureValue)
			cumcount = cumcount + 1

			if akActor.HasSpell(MilkingStage)
				PainCnt = (PainCnt * 0.80)
				if IsMilkMaid == true
					AddLeak(akActor)
					StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.LactacidCount", LactacidCnt)
					if LactacidCnt > 1
						StorageUtil.AdjustFloatValue(akActor,"MME.MilkMaid.LactacidCount", - 1)
					else
						StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.LactacidCount", 0)
					endif
					StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.PainCount", PainCnt)
				endif
				boobgasmcount = boobgasmcount +1
			elseif akActor.HasSpell(FuckMachineStage)
				PainCnt = (PainCnt * 0.95)
				if IsMilkMaid == true
					StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.PainCount", PainCnt)
				endif
			endif
		endif

		if akActor.HasSpell(MilkingStage)
			akActor.RemoveSpell( MilkingStage )
		endif
		if akActor.HasSpell(FuckMachineStage)
			akActor.RemoveSpell( FuckMachineStage )
		endif
		duration = 0
		Sound.StopInstance(soundInstance01)	
		SexLab.ClearMFG(akActor)
		
		if IsMilkMaid == true
			MilkCnt = MME_Storage.getMilkCurrent(akActor)
			LactacidCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.LactacidCount")
			MaidLevel = MME_Storage.getMaidLevel(akActor)
		endif
		
		if mode == 0 && MilkingType == 1\
		&& (MilkCnt < 1 || (PainCnt >= PainMax*0.9 && !PainKills))\
		&& PlayerREF == akActor && IsMilkingBlocked == false && bControlsDisabled == true
			Game.EnablePlayerControls() ;(True,True,True,True,True,True,True,True,0)
			Game.SetPlayerAIDriven(false)
			bControlsDisabled = false
			if MilkMsgs 
				debug.Notification("Milk Pump had milked everything it could from you, and releases its bounds, you are free to leave.")
			endif
		endif
		
	endwhile

	;debug.Notification("milking done." +akActorGender+ " "+isPregnant(akActor))
	sendVibrationEvent("StopMilkingMachine", akActor, mpas, MilkingType)

;-----------------------Milking done
	If PlayerREF == akActor
		Game.EnablePlayerControls() ;(True,True,True,True,True,True,True,True,0)
	Endif
	Utility.Wait(1.0)
	if IsMilkingBlocked == false
		If Mode > 0 && Mode != 4
			If !StorageUtil.GetIntValue(akActor,"IsBoundStrict")
				Debug.SendAnimationEvent(akActor,"IdleForceDefaultState")
			EndIf
		endif

		if Mode == 0
			if StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) == 1
				if akActor.IsEquipped(ZaZMoMSuctionCups)
					akActor.UnequipItem(ZaZMoMSuctionCups, false, true)
					akActor.RemoveItem(ZaZMoMSuctionCups, 1, true)
				elseif akActor.IsEquipped(MilkCuirass) && MilkCuirass != cuirass
					akActor.UnequipItem(MilkCuirass, false, true)
					akActor.RemoveItem(MilkCuirass, 1, true)
				elseif akActor.IsEquipped(MilkCuirassFuta) && MilkCuirassFuta != cuirass
					akActor.UnequipItem(MilkCuirassFuta, false, true)
					akActor.RemoveItem(MilkCuirassFuta, 1, true)
				endif
			endif
			If MilkStory && akActor == PlayerREF && akActorGender != "Male"
				Utility.Wait(5.0)											;wait for actor to get off milking pump
				StoryDisplay(1,1,FirstTimeStory)
			EndIf
			Debug.SendAnimationEvent(akActor,"IdleForceDefaultState")
		elseif Mode == 3
			If MilkStory && akActor == PlayerREF && akActorGender != "Male"
				if StringUtil.Find(cuirass.getname(), "Hermaeus Mora" ) >= 0 || StringUtil.Find(cuirass.getname(), "HM Priestess" ) >= 0
					StoryDisplay(1,3,FirstTimeStory)
				elseif StringUtil.Find(cuirass.getname(), "Living Arm" ) >= 0
					StoryDisplay(1,4,FirstTimeStory)
				else
					StoryDisplay(1,2,FirstTimeStory)
				endif
			EndIf
		endif
		If cuirass != None && StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) == 1
			If cuirass != None && SLSDBra == false
				if !akActor.IsEquipped(cuirass)
					akActor.EquipItem(cuirass, false, true)
				endif
			EndIf
			if hasInventoryMilkCuirass == true
				akActor.UnequipItem(MilkCuirass, false, true)
				if cuirass != none
					akActor.equipitem(cuirass, true, true)
				endif
			endif
			if hasInventoryMilkCuirassFuta == true
				akActor.UnequipItem(MilkCuirassFuta, false, true)
				if cuirass != none
					akActor.equipitem(cuirass, true, true)
				endif
			endif
		endif
		if IsMilkMaid == true
			if bottles > 0
				LevelCheck()
				PostMilk(akActor)
				AddMilkFx(akActor, 2)
				AddLeak(akActor)
				if MILKSlave.find(akActor) == -1
					StorageUtil.AdjustFloatValue(none, "MME.Progression.TimesMilked", bottles)
					StorageUtil.AdjustFloatValue(none, "MME.Progression.TimesMilkedAll", bottles)
				endif

				if Mode == 0 || Mode == 2
					if MILKSlave.find(akActor) != -1
						StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkingContainerMilksSUM", bottles)
					elseif StorageUtil.GetIntValue(akActor, "MME.MilkMaid.IsSlave") == 1
						StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkingContainerMilksSUM", bottles)
						debug.Notification(bottles + " Milk added to container.")
					elseif (Mode == 0 || CuirassSellsMilk == true) 
					;&& !(isVampire(akActor) || isWerewolf(akActor) || isSuccubus(akActor)) 							;remove later
						MilkE.InitiateTrade(bottles + StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerMilksSUM") as int, boobgasmcount, akActor, false)
						StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkingContainerMilksSUM", 0)
					elseif Mode == 2 
					;|| (Mode == 0 && (isVampire(akActor) || isWerewolf(akActor) || isSuccubus(akActor))) 				;remove later
						MilkE.InitiateTrade(bottles, boobgasmcount, akActor, true)
					endif
				endif
			endif
			
			if cumcount > 0 
				if Mode == 0 || Mode == 2
					if StorageUtil.GetIntValue(akActor, "MME.MilkMaid.IsSlave") == 1 || MILKSlave.find(akActor) != -1
						StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkingContainerCumsSUM", cumcount)
					elseif Mode == 0 || Mode == 2
						if akActorGender == "Male" 
							PlayerREF.AddItem(MME_Cums.GetAt(1), cumcount + StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerCumsSUM") as int)
						elseif akActorGender == "Female" 
							PlayerREF.AddItem(MME_Cums.GetAt(0), cumcount + StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerCumsSUM") as int)
						elseif akActorGender == "Futa"
							int futamilk = Utility.RandomInt(0, cumcount + StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerCumsSUM") as int)
							PlayerREF.AddItem(MME_Cums.GetAt(3), futamilk)
							PlayerREF.AddItem(MME_Cums.GetAt(2), cumcount + StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerCumsSUM") as int - futamilk)
						endif
						PlayerREF.RemoveItem(MilkE.Gold, (cumcount + StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.MilkingContainerCumsSUM") as int)*2, true)
						StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkingContainerCumsSUM", 0)
					endif
				endif
			endif
		endif
	endif
	
	;justincase
	Game.EnablePlayerControls() ;(True,True,True,True,True,True,True,True,0)
	Game.SetPlayerAIDriven(false)
	
	if Mode == 3 && MilkQC.Buffs && IsMilkMaid == true
		akActor.AddSpell( MilkExhaustion, false )
		akActor.AddSpell( MilkMentalExhaustion, false )
	endif

	if akActor.HasSpell( BeingMilkedPassive )
		akActor.RemoveSpell( BeingMilkedPassive )
	endif
EndFunction

Function PostMilk(Actor akActor)
	Float MilkCnt = MME_Storage.getMilkCurrent(akActor)
	Float MilkMax = MME_Storage.getMilkMaximum(akActor)
	Float MaidLevel = MME_Storage.getMaidLevel(akActor)

	if MilkQC.Buffs != true 
		if akActor.HasSpell(MilkExhaustion)
			akActor.RemoveSpell(MilkExhaustion)
		endif
		if akActor.HasSpell(MilkMentalExhaustion)
			akActor.RemoveSpell(MilkMentalExhaustion)
		endif
	endif
	
	int b = 0
	while b < 25
		if akActor.HasSpell(UnmilkedArray[b])
			akActor.RemoveSpell(UnmilkedArray[b])
		endif
		if MilkCnt / MilkMax > 0.4 && akActor.HasSpell(WellMilkedArray[b])
			akActor.RemoveSpell(WellMilkedArray[b])
		Endif
		b = b + 1
	endwhile

	if MilkQC.Buffs
		if MilkCnt / MilkMax <= 0.4
			if MaidLevel > 24
				MaidLevel = 24
			endif
			akActor.AddSpell(WellMilkedArray[MaidLevel as int], false)
		elseif MilkCnt / MilkMax >= 0.6
			int min = Math.Ceiling(MilkMax*0.6)												;ie lv10 cei(14.4) = 14 lv1 cei(3.6) = 4
			int diff = (MilkCnt - min) as int 													;if its = 0 it means its first tick above 0.6
			if diff > 24
				diff = 24
			endif
			akActor.AddSpell(UnmilkedArray[diff], false)
			if akActor == PlayerRef && MilkMsgs
				debug.Notification("Your breasts are getting heavy from all the milk sloshing inside.")
			endif	
		endif	
	endif	
EndFunction

Function LevelCheck()
	Float Level = StorageUtil.GetFloatValue(none, "MME.Progression.Level")
	Float TimesMilked = StorageUtil.GetFloatValue(none, "MME.Progression.TimesMilked")
	If Level < MilkLvlCap
		If TimesMilked >= (Level + 1) * TimesMilkedMult
			StorageUtil.AdjustFloatValue(none,"MME.Progression.Level", 1)
			StorageUtil.SetFloatValue(none,"MME.Progression.TimesMilked", 0)
			if MilkMsgs
				debug.Notification("Maid mastery Level up!")
				;MilkMsgHyper(Level as int)   ; progression levelup messages, add here something later
			endif
		EndIf
	EndIf
EndFunction

Function MaidLevelCheck(Actor akActor)
	Float MaidTimesMilked = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.TimesMilked")
	Float MaidLevel = MME_Storage.getMaidLevel(akActor)
	if MaidLevel < MilkLvlCap || !MaidLvlCap
		if MaidTimesMilked >= (MaidLevel + 1) * TimesMilkedMult
			MME_Storage.setMaidLevel(akActor, MaidLevel + 1)
			StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.TimesMilked", 0)
			if MilkMsgs && MaidLevel + 1 <= MilkLvlCap
				debug.Notification(akActor.GetLeveledActorBase().getname() + " has gained a Milk maid level!")
				MilkMsgHyper((MaidLevel + 1) as int, akActor)
			endif
		endif
	endif
EndFunction

;----------------------------------------------------------------------------
;Messages breast size /level up
;----------------------------------------------------------------------------

Function MilkCycleMSG(Actor akActor)
	Float MilkCnt = MME_Storage.getMilkCurrent(akActor)
	Float MilkMax = MME_Storage.getMilkMaximum(akActor)

	If PlayerREF.GetDistance(akActor) < 500 && (MilkCnt as int) >= 1
		if MilkCnt >= MilkMax && PiercingCheck(akActor) != 2
			debug.Notification(akActor.GetLeveledActorBase().GetName() + "'s milk is leaking from swollen nipples.")
		elseif MilkCnt as int == (MilkMax - 1)
			debug.Notification(akActor.GetLeveledActorBase().GetName() + "'s swollen nipples become moistened.")
		elseif MilkCnt as int == (MilkMax - 2)
			debug.Notification(akActor.GetLeveledActorBase().GetName() + "'s nipples swell and tingle.")
		else
			debug.Notification(akActor.GetLeveledActorBase().GetName() + "'s" + MilkMsgStage[MilkCnt as int])
		endif
	EndIf
EndFunction

Function Strings_setup()
	debug.Trace("MilkModEconomy breast strings array resetting")

	MilkMsgStage = new String[23]
	MilkMsgStage[1] = " breasts feel a bit warm as they tingle."
	MilkMsgStage[2] = " breasts feel quite warm."
	MilkMsgStage[3] = " breasts feel very warm and a bit uncomfortable."
	MilkMsgStage[4] = " breasts are starting to perk up."
	MilkMsgStage[5] = " breasts have become a bit more firm and perky."
	MilkMsgStage[6] = " breasts have become quite firm, the nipples feel very tender."
	MilkMsgStage[7] = " breasts have become very firm, the nipples feel very sensitive."
	MilkMsgStage[8] = " breasts feel slightly heavy."
	MilkMsgStage[9] = " breasts have become heavier, the trend is quite alarming."
	MilkMsgStage[10] = " breasts have become noticeably heavier."
	MilkMsgStage[11] = " breasts feel heavy and full, perhaps it is time to seek release."
	MilkMsgStage[12] = " breasts are demanding release! They're beginning to feel painful."
	MilkMsgStage[13] = " breasts have reached their natural limit, and scream for release."
	MilkMsgStage[14] = " breasts have begun to expand to accommodate the additional milk"
	MilkMsgStage[15] = " breasts have expanded beyond their natural limit."
	MilkMsgStage[16] = " breasts have now become even larger."
	MilkMsgStage[17] = " breasts continue to expand, with no end in sight."
	MilkMsgStage[18] = " breasts are starting to block the view of the lower body."
	MilkMsgStage[19] = " breasts have obscured the lower body, but continue to expand."
	MilkMsgStage[20] = " breasts are swollen with milk."
	MilkMsgStage[21] = " breasts are starting to impair movement."
	MilkMsgStage[22] = " breasts have expanded to their absolute limit."
	
	debug.Trace("MilkModEconomy armor strings array resetting")
	armname = new string[10]
	armname[0] = "Chastity Bra"
	armname[1] = "Spriggan Armor"
	armname[2] = "Spriggan Host"
	armname[3] = "Dwemer milking device"
	armname[4] = "Cow Harness"
	armname[5] = "Living Arm"
	armname[6] = "Hermaeus Mora"
	armname[7] = "HM Priestess"
	armname[8] = "Tentacle Parasite"
	armname[9] = "Tentacle Armor"
		
;slots check // DD items locked through scripts/keywords
	debug.Trace("MilkModEconomy armorslots array resetting")
	armslot = new int[6]
	armslot[0] = 32	;32 - body
	armslot[1] = 45	;45 - harness
	armslot[2] = 49	;49 - harness
	armslot[3] = 56	;56 - bra
	armslot[4] = 58	;58 - collar?,- locked milk cuirass slstorries
	
;Economy
	MilkE.MilkEconMaintenance()
EndFunction

Function MilkMsgHyper(int t, Actor akActor)
	MilkMsgHyper = new String[11]
		MilkMsgHyper[1] = "As a result of a series of repeated vigorous milkings, " + akActor.GetLeveledActorBase().GetName() + "'s breasts have grown accustomed to the great demand for their precious nectar and have grown bigger in size increasing their capacity! \n [Milk Maid Level: 1]"
		MilkMsgHyper[2] = "Due to repeated vigorous milkings, " + akActor.GetLeveledActorBase().GetName() + "'s beautiful boobs are adjusting to the great demand for their precious nectar and have grown bigger in size increasing their capacity even further! \n [Milk Maid Level: 2]"
		MilkMsgHyper[3] = "The repeated vigorous milkings are conditioning " + akActor.GetLeveledActorBase().GetName() + "'s glorious globes to meet the great demand for their precious nectar. They have grown bigger in size increasing their already impressive capacity even further! \n [Milk Maid Level: 3]"
		MilkMsgHyper[4] = "Repeated vigorous milkings have trained " + akActor.GetLeveledActorBase().GetName() + "'s marvellous milk melons to meet the great demand for their precious nectar. They have grown bigger in size increasing their already amazing capacity even further! \n [Milk Maid Level: 4]"
		MilkMsgHyper[5] = akActor.GetLeveledActorBase().GetName() + "'s looking forward to these vigorous milkings. Her breasts have grown accustomed to the great demand for their luscious lactation and have grown bigger in size increasing their inhuman capacity even further! \n [Milk Maid Level: 5]"
		MilkMsgHyper[6] = akActor.GetLeveledActorBase().GetName() + "'s already ample breasts are adjusting to the demand for their precious nectar due to the repeated vigorous milkings. They have grown in size and capacity again! " + akActor.GetLeveledActorBase().GetName() + " enjoys being milked! \n [Milk Maid Level: 6]"
		MilkMsgHyper[7] = "Due to the regular, vigorous milkings, " + akActor.GetLeveledActorBase().GetName() + "'s breasts have grown even larger and their capacity has increased. Their now bountiful breasts will work to meet the demand for their tasty milk. \n [Milk Maid Level: 7]"
		MilkMsgHyper[8] = akActor.GetLeveledActorBase().GetName() + " enjoys the repeated and vigorous milking. her breasts continue to grow to meet the demand for their rich nectar. Her now Gigantic Jugs can supply more milk and she enjoys it when people notice her breast size! \n [Milk Maid Level: 8]"
		MilkMsgHyper[9] = "These regular, vigorous milking sessions turn your milkmaid's on! They now have Tremendous Tits with increased size and capacity. Their delicious milk is in demand and they feel sexy when they hear comments about their boobs. \n [Milk Maid Level: 9]"
		MilkMsgHyper[10] = akActor.GetLeveledActorBase().GetName() + " is now a Master of the Milkmaids with MASSIVE Mammaries! She can supply more milk than an entire herd of cows. And those tits of theirs are the talk of Tamriel. \n [Master Milk Maid]"
	debug.messagebox(MilkMsgHyper[t])
EndFunction

;----------------------------------------------------------------------------
;Stories
;----------------------------------------------------------------------------

Function StoryDisplay(int StoryState , int StoryMode, bool FirstTimeStory)
;StoryState == 0 - start, 1 - end
int i

if FirstTimeStory
	i = 0
else
	i = 1
endif

if StoryMode == 1					;Milkpump milking
	i = Utility.RandomInt(1, 5) * i
	If StoryState == 0
		StoryMPS(i)
	Elseif StoryState == 1
		StoryMPE(i)
	EndIf
	
Elseif StoryMode == 2 				;Spriggan milking
	i = Utility.RandomInt(1, 3)
	If StoryState == 0
		StorySS(i)
	Elseif StoryState == 1
		StorySE(i)
	EndIf
	
Elseif StoryMode == 3				;Hermaeus Mora milking
	i = Utility.RandomInt(1, 2)
	If StoryState == 0
		StoryHMS(i)
	Elseif StoryState == 1
		StoryHME(i)
	EndIf
	
Elseif StoryMode == 4				;Living armor milking
	i = Utility.RandomInt(1, 3)
	If StoryState == 0
		StoryLAS(i)
	Elseif StoryState == 1
		StoryLAE(i)
	EndIf
endif

debug.messagebox(Story[i])
EndFunction

Function StoryMPS(int i)
	Story = new String[6]
	Story[0] = "Out of curiosity you jump into strange device, nothing bad can happen, right? Suddenly, you start to feel tingles over your skin, scared you try to get out of the device but you can move a finger. Desperate, you see tube appear, moving towards your mouth and forcing itself in, few moments later you feel same happens with your intimate parts. Paralyzed you see some fluids flowing through tubes."
	Story[1] = "As you approach the strange device, your milky nipples grow hard and ready of their own volition, eagerly anticipating the opportunity to get milked. You easily fit yourself into the apparatus, hearing the machinery activate automatically as if sensing your breast's full capacity. The cups twitch and move heavily as they raise to your bountiful chest, ready to milk you."
	Story[2] = "As you take a seat on the strange device, your aching nipples grow hard and ready of their own volition, eagerly anticipating the opportunity to release their milky load. You easily fit yourself into the apparatus, hearing the machinery activate automatically. The cups twitch and move as they raise to your full chest, ready to relieve you of your delicious milky burden."
	Story[3] = "You begin holding the breast-milking cups against your forward jutting nipples and with a sudden lurch the suction pulls against you, pressing the cups tightly against your chest, stretching your nubs to nearly twice their normal length. You feel a building pressure as the machine sucks you relentlessly, drawing your milk to the surface. Your body lets down its milk, flooding the tubes with creamy goodness. "
	Story[4] = "You eagerly grab onto the suction cups, pulling them up to your tight and full chest. They latch on, slapping tight against you as the vacuum pressure seals them tightly against your body. You can feel your milk-slicked nipples pulling tight, nearly doubling in size from the intense pressure. The sensitive flesh of your motherly tits fill with a burgeoning pressure that centers around the tubes connected to your nips. Your lactating nubs twitch and pulse for but a moment, then unleash a torrent of milk, totally filling the tubes."
	Story[5] = "You approach the strange device and take a seat. The suckers immediately seal themselves against your breasts and activate, assaulting your nipples with a strong, rhythmic sucking sensation. It's uncomfortable - almost painful, in fact, but the sensation of being milked, brings about a strange, tingling feeling of arousal that washes over your whole being. As you look down to your breasts, you find yourself fantasizing your breasts as heaving boulders of supple flesh, filled with creamy, nutritive milk and maternal purpose. The daydream is oddly erotic, and your thighs begin rubbing against each other of their own accord."
EndFunction

Function StoryMPE(int i)
	Story = new String[6]
	Story[0] = "After minutes of torment, tubes retract into the unknown, as you feel strange magic fades, you try to escape horrible device as fast as you can, though it's not easy for your abused body, filled with unknown liquid."
	Story[1] = "The cups pulse with a strong consistency, milking you HARD and draining you of your reservoir of milk. Your nipples ache with the strange pleasure of it, leaving you moaning and wriggling against your restraints, desperate for release, but you just can't get the stimulation you need. Time stretches on as you're teased like that, pumped of your milk until the machinery shuts off and you wobbly raise to your feet, your milky residue still running down your breasts."
	Story[2] = "The machinery lurches, struggling to keep up as you flood the tubes with your creamy bounty. A motherly sense of pride wells within you as you hear the apparatus wind down and indicate it's fullness with a ding; the people of Skyrim will be getting their fill tonight. Even more, you can't wait to continue to satisfy their thirst when it's time to be milked again."
	Story[3] = "You feel woozy and light-headed from the intense milking, and have difficulty focusing on anything but the residue of fluids coating your milky tits. Feeling sore and exhausted, you make yourself decent and stagger away from the machinery with a satisfied smile on your face."
	Story[4] = "You practically cream yourself from the cup's actions as the milking continues, so hot and horny that you try and wriggle in your harness to press against them. After what seems like hours of non-stop sucking and spurting, your milking is over, and the cups release themselves from your drained breasts. You rise and steady yourself on wobbly knees, eager to experience being milked again."
	Story[5] = "Eventually, the milker's action becomes too much for your reddened nipples, and with a slight grimace you deactivate the milker. As you alleviate your tender bosom, you find that the odd tingling sensation is still lingering in your bosom, along with the vision of your breasts swelling with milk."
EndFunction

Function StorySS(int i)
	Story = new String[4]
	Story[0] = "Here could be your story"
	Story[1] = "The spriggan's root-like tendrils stretch across your swollen breasts, forming tight knots where milk is starting to seep from your nipples. The rough bark of its fingers digs into your flesh, as it starts to massage your breasts, coaxing your milk to the surface."
	Story[2] = "The spriggan's tendrils knot around your milky nipples, then take hold almost painfully hard. You gasp in a mixture of pain and relief, as your milk lets down."
	Story[3] = "The spriggan stirs and suddenly you feel its tendrils rhythmically squeezing your breasts and pulling at your nipples. Pain and pleasure mix as you are forced to meet its demand for your milk."
EndFunction

Function StorySE(int i)
	Story = new String[4]
	Story[0] = "Here could be your story"
	Story[1] = "Your whole body throbs in time with the pulse of milk from your nipples, and a strange euphoria courses through you. But your breasts are nearly drained, and the milking comes to an end. The spriggan seems to be satisfied, for now."
	Story[2] = "You squirm within the spriggan's tight embrace, as it wrings the last few drops from your drained breasts. The spriggan seems to want more, but there is none to be had."
	Story[3] = "The spriggan's tendrils pull harder and faster briefly, and then they begin to relax as every drop of milk is absorbed. You know that it will need to feed again, but when?"
EndFunction

Function StoryHMS(int i)
	Story = new String[3]
	Story[0] = "Here could be your story"
	Story[1] = "The tentacles are reaching for your breasts. The suckers melt with your body. You nearly faint in Hermaeus' presence, feeling his caress, becoming one with his parasite. You feel milk gushing out, ravenous imbibed by the tentacles."
	Story[2] = "A dark voice pounds in your head: '" + PlayerRef.GetLeveledActorBase().GetName() + ", my favourite mind milker. Let me see what knowledge you acquired for me.' The tentacles caress your breast, dig deep into them, you feel them inside your trembling body, reaching your head, your mind..."
EndFunction

Function StoryHME(int i)
	Story = new String[3]
	Story[0] = "Here could be your story"
	Story[1] = "The tentacles relax as the penetration on your tits suddenly stops. You can not say if you feel dizzy, relieved or euphoric. But you are happy you have given Hermaeus this sacrifice. And you're eagerly awaiting his next demand."
	Story[2] = "'Well done my pet.' are his last words before he releases your spirit from its prison and gives you control over your body again. You feel ice cold sweat on your skin. Your legs are shaking. 'Thank you master.' whisper from your lips"
EndFunction

Function StoryLAS(int i)
	Story = new String[4]
	Story[0] = "Here could be your story"
	Story[1] = "The tentacles are reaching for your breasts. The suckers latch on to your body. You nearly faint in anticipation, feeling their caress, and you know what is coming. You feel your milk gushing out, ravenously imbibed by the tentacles."
	Story[2] = "The armor's tentacles coil around your milky nipples, then the suckers take hold almost painfully hard. You gasp in a mixture of pain and relief, as your milk lets down. The tentacles pulse and pull as they milk you."
	Story[3] = "Your armor suddenly tightens around you. Tentacles wrap around your swollen breasts as suckers find the nipples and latch on. Your knees nearly buckle as the writhing mass squeezes and massages your breasts. Your milk begins to flow as the suckers do their work."
EndFunction

Function StoryLAE(int i)
	Story = new String[4]
	Story[0] = "Here could be your story"
	Story[1] = "The tentacles relax as the suction on your tits suddenly stops. You can not say if you feel dizzy, relieved or euphoric. But you are happy you have given the armor what it needs. And you're eagerly awaiting its next feeding."
	Story[2] = "You squirm within the tentacles' tight embrace, as they wring the last few drops from your breasts. The armor seems to want more, but it relaxes its hold... for now."
	Story[3] = "The tentacles squeeze harder and faster as the suckers pull every drop of milk they can get and then as suddenly as it began, the armor relaxes its grip. You've been relieved of your milky burden for now. And you know you'll need to satisfy its hunger again.... but when?"
EndFunction

;----------------------------------------------------------------------------
;Utility
;----------------------------------------------------------------------------

Function DLCcheck()
	debug.Trace("MilkModEconomy DLC check")
	If Game.GetModbyName("HearthFires.esm") != 255
		debug.Trace("MilkModEconomy HearthFires.esm found")
		Plugin_HearthFires = true
		MilkE.locHeljarchenHall = Game.GetFormFromFile(0x520a, "HearthFires.esm") as Location
		MilkE.locWindstadManor = Game.GetFormFromFile(0x5209, "HearthFires.esm") as Location
		MilkE.locLakeviewManor = Game.GetFormFromFile(0x308a, "HearthFires.esm") as Location
	else
		debug.Trace("MilkModEconomy HearthFires.esm not found")
		Plugin_HearthFires = false
		MilkE.locHeljarchenHall = MilkE.locMMEEmpty
		MilkE.locWindstadManor = MilkE.locMMEEmpty
		MilkE.locLakeviewManor = MilkE.locMMEEmpty
	endif
	
	If Game.GetModbyName("Dawnguard.esm") != 255
		debug.Trace("MilkModEconomy Dawnguard.esm found")
		Plugin_Dawnguard = true
		MilkE.locFortDawnguard = Game.GetFormFromFile(0x128fe, "Dawnguard.esm") as Location
		MilkE.locDayspringCanyon = Game.GetFormFromFile(0x4c1f, "Dawnguard.esm") as Location
	else
		debug.Trace("MilkModEconomy Dawnguard.esm not found")
		Plugin_Dawnguard = false
		MilkE.locFortDawnguard = MilkE.locMMEEmpty
		MilkE.locDayspringCanyon = MilkE.locMMEEmpty
	endif

	If Game.GetModbyName("Dragonborn.esm") != 255
		debug.Trace("MilkModEconomy Dragonborn.esm found")
		Plugin_Dragonborn = true
		MilkE.locRavenRock = Game.GetFormFromFile(0x143b9, "Dragonborn.esm") as Location
		MilkE.locSkaalVillage = Game.GetFormFromFile(0x143bb, "Dragonborn.esm") as Location
		MilkE.locTelMithryn = Game.GetFormFromFile(0x143bc, "Dragonborn.esm") as Location
	else
		debug.Trace("MilkModEconomy Dragonborn.esm not found")
		Plugin_Dragonborn = false
		MilkE.locRavenRock = MilkE.locMMEEmpty
		MilkE.locSkaalVillage = MilkE.locMMEEmpty
		MilkE.locTelMithryn = MilkE.locMMEEmpty
	endif

	If Game.GetModbyName("RealisticNeedsandDiseases.esp") != 255
		debug.Trace("MilkModEconomy RealisticNeedsandDiseases.esp found")
		Plugin_RealisticNeedsandDiseases = true
	else
		debug.Trace("MilkModEconomy RealisticNeedsandDiseases.esp not found")
		Plugin_RealisticNeedsandDiseases = false
	endif

	If Game.GetModbyName("iNeed.esp") != 255
		debug.Trace("MilkModEconomy iNeed.esp found")
		Plugin_iNeed = true
	else
		debug.Trace("MilkModEconomy iNeed.esp not found")
		Plugin_iNeed = false
	endif
	
	If Game.GetModbyName("SexLabSkoomaWhore.esp") != 255
		debug.Trace("MilkModEconomy SexLabSkoomaWhore.esp found")
		Plugin_SlSW = true
	else
		debug.Trace("MilkModEconomy SexLabSkoomaWhore.esp not found")
		Plugin_SlSW = false
	endif
	
	If Game.GetModbyName("Schlongs of Skyrim.esp") != 255
		debug.Trace("MilkModEconomy Schlongs of Skyrim.esp found")
		Plugin_SOS = true
	else
		debug.Trace("MilkModEconomy Schlongs of Skyrim.esp not found")
		Plugin_SOS = false
	endif
	
	If Game.GetModbyName("SOS Equipable Schlong.esp") != 255
		debug.Trace("MilkModEconomy SOS Equipable Schlong.esp found")
		Plugin_SOS_EQUIP = true
	else
		debug.Trace("MilkModEconomy Schlongs of Skyrim.esp not found")
		Plugin_SOS_EQUIP = false
	endif
	
	If Game.GetModbyName("SOS - B3lisario UNP Addon.esp") != 255
		debug.Trace("MilkModEconomy SOS - B3lisario UNP Addon.esp found")
		Plugin_SOS_UNP = true
	else
		debug.Trace("MilkModEconomy SOS - B3lisario UNP Addon.esp not found")
		Plugin_SOS_UNP = false
	endif
	
	If Game.GetModbyName("SOS Female Schlongifier (No Schlong Addon by Erundil).esp") != 255
		debug.Trace("MilkModEconomy SOS - SOS Female Schlongifier (No Schlong Addon by Erundil).esp found")
		Plugin_SOS_NSA = true
	else
		debug.Trace("MilkModEconomy SOS - SOS Female Schlongifier (No Schlong Addon by Erundil).esp not found")
		Plugin_SOS_NSA = false
	endif
	
	If Game.GetModbyName("SOS - Pubic Hair for Females Addon.esp") != 255
		debug.Trace("MilkModEconomy SOS - SOS - Pubic Hair for Females Addon.esp found")
		Plugin_SOS_PUBES = true
	else
		debug.Trace("MilkModEconomy SOS - SOS Female Schlongifier (No Schlong Addon by Erundil).esp not found")
		Plugin_SOS_PUBES = false
	endif

	If Game.GetModbyName("EstrusChaurus.esp") != 255
		debug.Trace("MilkModEconomy EstrusChaurus.esp found")
		Plugin_EstrusChaurus = true
	else
		debug.Trace("MilkModEconomy EstrusChaurus.esp not found")
		Plugin_EstrusChaurus = false
	endif
	
	If Game.GetModbyName("EstrusSpider.esp") != 255
		debug.Trace("MilkModEconomy EstrusSpider.esp found")
		Plugin_EstrusSpider = true
	else
		debug.Trace("MilkModEconomy EstrusSpider.esp not found")
		Plugin_EstrusSpider = false
	endif
	
	If Game.GetModbyName("BeeingFemale.esm") != 255
		debug.Trace("MilkModEconomy BeeingFemale.esm found")
		Plugin_BeeingFemale = true
	else
		debug.Trace("MilkModEconomy BeeingFemale.esm not found")
		Plugin_BeeingFemale = false
	endif
	
	If Game.GetModbyName("HentaiPregnancy.esm") != 255
		debug.Trace("MilkModEconomy HentaiPregnancy.esm found")
		Plugin_HentaiPregnancy = true
	else
		debug.Trace("MilkModEconomy HentaiPregnancy.esm not found")
		Plugin_HentaiPregnancy = false
	endif
	
	If Game.GetModbyName("SexLabProcreation.esp") != 255
		debug.Trace("MilkModEconomy SexLabProcreation.esp found")
		Plugin_SexLabProcreation = true
	else
		debug.Trace("MilkModEconomy SexLabProcreation.esp not found")
		Plugin_SexLabProcreation = false
	endif
	
	If Game.GetModbyName("PSQ PlayerSuccubusQuest.esm") != 255
		debug.Trace("MilkModEconomy PlayerSuccubusQuest.esm found")
		Plugin_PSQ = true
	else
		debug.Trace("MilkModEconomy PlayerSuccubusQuest.esm not found")
		Plugin_PSQ = false
	endif
	
	If Game.GetModbyName("Devious Devices - Integration.esm") != 255
		debug.Trace("MilkModEconomy Devious Devices - Integration.esm found")
		Plugin_DDI = true
	else
		debug.Trace("MilkModEconomy Devious Devices - Integration.esm not found")
		Plugin_DDI = false
	endif
	
	If Game.GetModbyName("SexLab-StoriesDevious.esp") != 255
		debug.Trace("MilkModEconomy SexLab-StoriesDevious.esp found")
		Plugin_SLSD = true
	else
		debug.Trace("MilkModEconomy SexLab-StoriesDevious.esp not found")
		Plugin_SLSD = false
	endif
	
	If Game.GetModbyName("SexLabAroused.esm") != 255
		debug.Trace("MilkModEconomy SexLabAroused.esm found")
		Plugin_SLA = true
	else
		debug.Trace("MilkModEconomy SexLabAroused.esm not found")
		Plugin_SLA = false
	endif
	
	debug.Trace("MilkModEconomy DCL check done")
	MMEfoodlistaddon()
	SlSWfoodlistaddon()
	iNeedfoodlistaddon()
EndFunction

int Function Milklvl0fix()
	int milklvl = ((StorageUtil.GetFloatValue(none,"MME.Progression.Level") + 1) / 2) as int
	If milklvl < 1
		return 1
	Else
		return milklvl
	EndIf
EndFunction

string Function ReduceFloat(String ReduceFloat)
	string temp = ""
	int t = 0
	while t < StringUtil.Find(ReduceFloat, ".") + 3 
		temp = temp + StringUtil.getNthChar(ReduceFloat, t)
		t = t + 1
	endwhile
	return temp
EndFunction

Function MMEfoodlistaddon()
	debug.Trace("MilkModEconomy adding MME Leveled lists to base Leveled lists")
	int i
	
	i = 0
	while i < LItemSkooma75.GetNumForms() && LItemSkooma75.GetNthForm(i) != MME_LItemSkooma75RaceMilkLactacid
		i = i + 1
	endwhile
	
	if LItemSkooma75.GetNthForm(i) != MME_LItemSkooma75RaceMilkLactacid
		MME_LItemSkooma75RaceMilkLactacid.Revert()

		int t = 0
		MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milks.GetAt(t), 1, 1)
		MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milks.GetAt(t), 1, 1)
		MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milks.GetAt(t), 1, 1)
		MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milks.GetAt(t), 1, 1)
		MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milks.GetAt(t), 1, 1)

		t = 1
		while t < MME_Milk_Altmer.GetSize()
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Altmer.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Argonian.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Bosmer.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Breton.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Dunmer.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Imperial.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Khajiit.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Nord.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Orc.GetAt(t), 1, 1)
			MME_LItemSkooma75RaceMilkLactacid.AddForm(MME_Milk_Redguard.GetAt(t), 1, 1)
			t = t + 1
		endwhile
		
		LItemSkooma75.AddForm(MME_LItemSkooma75RaceMilkLactacid, 1, 1)
		debug.Trace("MilkModEconomy adding MME_LItemSkooma75RaceMilkLactacid list to LItemSkooma75")
	endif
	
	i = 0
	while i < LItemFoodInnCommon.GetNumForms() && LItemFoodInnCommon.GetNthForm(i) != MME_LItemFoodInnCommonMilk
		i = i + 1
	endwhile
	
	if LItemFoodInnCommon.GetNthForm(i) != MME_LItemFoodInnCommonMilk
		MME_LItemFoodInnCommonMilk.Revert()

		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Basic.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Basic.GetAt(1), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Basic.GetAt(2), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Basic.GetAt(3), 1, 1)

		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Altmer.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Argonian.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Bosmer.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Breton.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Dunmer.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Imperial.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Khajiit.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Nord.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Orc.GetAt(0), 1, 1)
		MME_LItemFoodInnCommonMilk.AddForm(MME_Milk_Redguard.GetAt(0), 1, 1)

		LItemFoodInnCommon.AddForm(MME_LItemFoodInnCommonMilk, 1, 1)
		debug.Trace("MilkModEconomy adding MME_LItemFoodInnCommonMilk list to LItemFoodInnCommon")
	EndIf
EndFunction

Function SlSWfoodlistaddon()
	if Plugin_SlSW
		LeveledItem SLSW_DrugsWOcure10 = Game.GetFormFromFile(0x1B0A9, "SexLabSkoomaWhore.esp") as LeveledItem
		LeveledItem SLSW_DrugsAll = Game.GetFormFromFile(0x1AB46, "SexLabSkoomaWhore.esp") as LeveledItem
		FormList SLSW_DrugsWOcure = Game.GetFormFromFile(0x20c71, "SexLabSkoomaWhore.esp") as FormList

		int i = 0
		debug.Trace("MilkModEconomy adding MME Leveled lists to SexLabSkoomaWhore Leveled lists")
		while i < SLSW_DrugsWOcure10.GetNumForms() && SLSW_DrugsWOcure10.GetNthForm(i) != MME_LItemSkooma75RaceMilkLactacid
			i = i + 1
		endwhile
		
		if SLSW_DrugsWOcure10.GetNthForm(i) != MME_LItemSkooma75RaceMilkLactacid
			SLSW_DrugsWOcure10.AddForm(MME_LItemSkooma75RaceMilkLactacid, 1, 1)
			debug.Trace("MilkModEconomy adding MME_LItemSkooma75RaceMilkLactacid list to SLSW_DrugsWOcure10")
		endif
		
		i = 0
		while i < SLSW_DrugsAll.GetNumForms() && SLSW_DrugsAll.GetNthForm(i) != MME_LItemSkooma75RaceMilkLactacid
			i = i + 1
		endwhile
		
		if SLSW_DrugsAll.GetNthForm(i) != MME_LItemSkooma75RaceMilkLactacid
			SLSW_DrugsAll.AddForm(MME_LItemSkooma75RaceMilkLactacid, 1, 1)
			debug.Trace("MilkModEconomy adding MME_LItemSkooma75RaceMilkLactacid list to SLSW_DrugsAll")
		endif
		
		if SLSW_DrugsWOcure.Find(MME_Milks.GetAt(0)) < 0
			SLSW_DrugsWOcure.AddForm(MME_Milks.GetAt(0))
			debug.Trace("MilkModEconomy adding Lactacid to SLSW_DrugsWOcure formlist")
		endif
	EndIf
EndFunction

Function iNeedfoodlistaddon()
	if Plugin_iNeed
		FormList _SNFood_DrinkNoAlcList = Game.GetFormFromFile(0xBA28, "iNeed.esp") as FormList
		FormList _SNFood_LightList = Game.GetFormFromFile(0xD6B, "iNeed.esp") as FormList
		FormList _SNFood_SkoomaList = Game.GetFormFromFile(0x21366, "iNeed.esp") as FormList

		int i = 0
		debug.Trace("MilkModEconomy adding drinks to iNeed.esp _SNFood_DrinkNoAlcList")
		While i < MME_Milks.GetSize()
			_SNFood_DrinkNoAlcList.AddForm(MME_Milks.GetAt(i))
			i = i + 1
		EndWhile

		i = 0
		While i < MME_Cums.GetSize()
			_SNFood_DrinkNoAlcList.AddForm(MME_Cums.GetAt(i))
			i = i + 1
		EndWhile

		debug.Trace("MilkModEconomy adding food to iNeed.esp _SNFood_LightList")
		i = 0
		While i < MME_Foods.GetSize()
			_SNFood_LightList.AddForm(MME_Foods.GetAt(i))
			i = i + 1
		EndWhile

		debug.Trace("MilkModEconomy adding food to iNeed.esp _SNFood_LightList")
		i = 0
		While i < MME_Foods.GetSize()
			_SNFood_LightList.AddForm(MME_Foods.GetAt(i))
			i = i + 1
		EndWhile
		
		debug.Trace("MilkModEconomy adding Lactacid to iNeed.esp _SNFood_SkoomaList")
		if _SNFood_SkoomaList.Find(MME_Milks.GetAt(0)) < 0
			_SNFood_SkoomaList.AddForm(MME_Milks.GetAt(0))
		endif
	EndIf
EndFunction

Function Milkmaidinfo()
	String msg = ""
	int i = 0
	msg = " Milkmaids info:\n"
	while i < MilkMaid.Length
		if MilkMaid[i] != None
			float MilkCnt = MME_Storage.getMilkCurrent(MILKmaid[i])
			float PainCnt = StorageUtil.GetFloatValue(MILKmaid[i], "MME.MilkMaid.PainCount")
			float PainMax = MME_Storage.getPainMaximum(MILKmaid[i])
			msg = msg + ("Maid name: " + MilkMaid[i].GetLeveledActorBase().GetName()\
							+ " Milk: " + ReduceFloat(MilkCnt)\
							+ " Pain: " + (PainCnt/PainMax*100) as int + "%")
		endif
		i = i + 1
	endwhile
	while i < MilkSlave.Length
		if MilkSlave[i] != None
			float MilkCnt = MME_Storage.getMilkCurrent(MilkSlave[i])
			float PainCnt = StorageUtil.GetFloatValue(MilkSlave[i], "MME.MilkMaid.PainCount")
			float PainMax = MME_Storage.getPainMaximum(MilkSlave[i])
			msg = msg + ("Slave name: " + MilkSlave[i].GetLeveledActorBase().GetName()\
							+ " Milk: " + ReduceFloat(MilkCnt)\
							+ " Pain: " + (PainCnt/PainMax*100) as int + "%")
		endif
		i = i + 1
	endwhile
	Debug.MessageBox(msg)
EndFunction

Function Modtoggle()
	if !MilkFlag
		MilkFlag = true
		EconFlag = true
		if MilkPoll > 24
			RegisterForSingleUpdate(MilkPoll)
		else
			RegisterForSingleUpdateGameTime (MilkPoll)
		endif
		MilkE.RegisterForSingleUpdateGameTime (1)
		debug.Notification("Milk Mod Enabled")
	else
		MilkFlag = false
		EconFlag = false
		UnregisterForUpdate()
		UnregisterForUpdateGameTime()
		MilkE.UnregisterForUpdateGameTime()
		LastTimeMilked = 0
		debug.Notification("Milk Mod Disabled")
	endif
EndFunction

Function AddMilkFx(Actor akActor, int i)
	If MilkLeakTextures
		If i == 1
			akActor.AddSpell(MilkFx1,False)
		else
			akActor.AddSpell(MilkFx2,False)
		EndIf
	EndIf
EndFunction

Function AddLeak(Actor akActor)
	if MilkLeakToggle == true && DDi.IsMilkingBlocked_Bra(akActor) == false && PiercingCheck(akActor) != 2
		If (akActor.GetWornForm(Armor.GetMaskForSlot(32)) == None || MilkLeakWearArm == true)
			MilkLeak.cast(akActor)
		ElseIf StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) != 1
			MilkLeak.cast(akActor)
		EndIf
	EndIf
EndFunction

Function RemoveMilkFx1(Actor akActor)
	If akActor.HasSpell(MilkFx1)
		akActor.RemoveSpell(MilkFx1)
	EndIf
EndFunction

Function RemoveMilkFx2(Actor akActor)
	If akActor.HasSpell(MilkFx2)
		akActor.RemoveSpell(MilkFx2)
	EndIf
EndFunction

Function DebuffArraySet()
	debug.Trace("MilkModEconomy debuffs array resetting")
	UnmilkedArray = new Spell[25]
	UnmilkedArray[0] = MME_Spells_Unmilked.GetAt(0) as Spell
	UnmilkedArray[1] = MME_Spells_Unmilked.GetAt(1) as Spell
	UnmilkedArray[2] = MME_Spells_Unmilked.GetAt(2) as Spell
	UnmilkedArray[3] = MME_Spells_Unmilked.GetAt(3) as Spell
	UnmilkedArray[4] = MME_Spells_Unmilked.GetAt(4) as Spell
	UnmilkedArray[5] = MME_Spells_Unmilked.GetAt(5) as Spell
	UnmilkedArray[6] = MME_Spells_Unmilked.GetAt(6) as Spell
	UnmilkedArray[7] = MME_Spells_Unmilked.GetAt(7) as Spell
	UnmilkedArray[8] = MME_Spells_Unmilked.GetAt(8) as Spell
	UnmilkedArray[9] = MME_Spells_Unmilked.GetAt(9) as Spell
	UnmilkedArray[10] = MME_Spells_Unmilked.GetAt(10) as Spell
	UnmilkedArray[11] = MME_Spells_Unmilked.GetAt(11) as Spell
	UnmilkedArray[12] = MME_Spells_Unmilked.GetAt(12) as Spell
	UnmilkedArray[13] = MME_Spells_Unmilked.GetAt(13) as Spell
	UnmilkedArray[14] = MME_Spells_Unmilked.GetAt(14) as Spell
	UnmilkedArray[15] = MME_Spells_Unmilked.GetAt(15) as Spell
	UnmilkedArray[16] = MME_Spells_Unmilked.GetAt(16) as Spell
	UnmilkedArray[17] = MME_Spells_Unmilked.GetAt(17) as Spell
	UnmilkedArray[18] = MME_Spells_Unmilked.GetAt(18) as Spell
	UnmilkedArray[19] = MME_Spells_Unmilked.GetAt(19) as Spell
	UnmilkedArray[20] = MME_Spells_Unmilked.GetAt(20) as Spell
	UnmilkedArray[21] = MME_Spells_Unmilked.GetAt(21) as Spell
	UnmilkedArray[22] = MME_Spells_Unmilked.GetAt(22) as Spell
	UnmilkedArray[23] = MME_Spells_Unmilked.GetAt(23) as Spell
	UnmilkedArray[24] = MME_Spells_Unmilked.GetAt(24) as Spell
EndFunction

Function BuffArraySet()
	debug.Trace("MilkModEconomy buffs array resetting")
	WellMilkedArray = new Spell[25]
	WellMilkedArray[0] = MME_Spells_Wellmilked.GetAt(0) as Spell
	WellMilkedArray[1] = MME_Spells_Wellmilked.GetAt(1) as Spell
	WellMilkedArray[2] = MME_Spells_Wellmilked.GetAt(2) as Spell
	WellMilkedArray[3] = MME_Spells_Wellmilked.GetAt(3) as Spell
	WellMilkedArray[4] = MME_Spells_Wellmilked.GetAt(4) as Spell
	WellMilkedArray[5] = MME_Spells_Wellmilked.GetAt(5) as Spell
	WellMilkedArray[6] = MME_Spells_Wellmilked.GetAt(6) as Spell
	WellMilkedArray[7] = MME_Spells_Wellmilked.GetAt(7) as Spell
	WellMilkedArray[8] = MME_Spells_Wellmilked.GetAt(8) as Spell
	WellMilkedArray[9] = MME_Spells_Wellmilked.GetAt(9) as Spell
	WellMilkedArray[10] = MME_Spells_Wellmilked.GetAt(10) as Spell
	WellMilkedArray[11] = MME_Spells_Wellmilked.GetAt(11) as Spell
	WellMilkedArray[12] = MME_Spells_Wellmilked.GetAt(12) as Spell
	WellMilkedArray[13] = MME_Spells_Wellmilked.GetAt(13) as Spell
	WellMilkedArray[14] = MME_Spells_Wellmilked.GetAt(14) as Spell
	WellMilkedArray[15] = MME_Spells_Wellmilked.GetAt(15) as Spell
	WellMilkedArray[16] = MME_Spells_Wellmilked.GetAt(16) as Spell
	WellMilkedArray[17] = MME_Spells_Wellmilked.GetAt(17) as Spell
	WellMilkedArray[18] = MME_Spells_Wellmilked.GetAt(18) as Spell
	WellMilkedArray[19] = MME_Spells_Wellmilked.GetAt(19) as Spell
	WellMilkedArray[20] = MME_Spells_Wellmilked.GetAt(20) as Spell
	WellMilkedArray[21] = MME_Spells_Wellmilked.GetAt(21) as Spell
	WellMilkedArray[22] = MME_Spells_Wellmilked.GetAt(22) as Spell
	WellMilkedArray[23] = MME_Spells_Wellmilked.GetAt(23) as Spell
	WellMilkedArray[24] = MME_Spells_Wellmilked.GetAt(24) as Spell
EndFunction

Function MaidRemove(Actor akActor)
		debug.notification("MilkModEconomy existing maid/slave " + akActor.GetLeveledActorBase().GetName() + "resetting")
	If akActor != None
		debug.Trace("MilkModEconomy existing maid/slave " + akActor.GetLeveledActorBase().GetName() + "resetting")
		;Reset Breast/Weight
		;HDT Female / Vampire Lord
			self.SetNodeScale(akActor, "NPC L Breast", 1)
			self.SetNodeScale(akActor, "NPC R Breast", 1)
		;Curve fix
			self.SetNodeScale(akActor, "NPC L Breast01", 1)
			self.SetNodeScale(akActor, "NPC R Breast01", 1)
		;HDT Werewolf
			self.SetNodeScale(akActor, "NPC L Breast P1", 1)
			self.SetNodeScale(akActor, "NPC R Breast P1", 1)
			self.SetNodeScale(akActor, "NPC L Breast P2", 1)
			self.SetNodeScale(akActor, "NPC R Breast P2", 1)
			self.SetNodeScale(akActor, "NPC L Breast P3", 1)
			self.SetNodeScale(akActor, "NPC R Breast P3", 1)
	
		; <modified to match updated code in MilkMCM.psc:850-853>
		;float MaidWeightBase = MME_Storage.getWeightBasevalue(MilkQ.MILKmaid[i])
		;Float NeckDelta = (akActor.GetLeveledActorBase().GetWeight() / 100) - (MaidWeightBase/100)
		;akActor.GetLeveledActorBase().SetWeight(MaidWeightBase)
		;akActor.UpdateWeight(NeckDelta)
			
		;remove de/buffs, effects
		int b = 0
		While b < 25
			If akActor.HasSpell(UnmilkedArray[b])
				akActor.RemoveSpell(UnmilkedArray[b])
			EndIf
			If akActor.HasSpell(WellMilkedArray[b])
				akActor.RemoveSpell(WellMilkedArray[b])
			EndIf
			b = b + 1
		EndWhile
		
		If akActor.HasSpell(MilkExhaustion)
			akActor.RemoveSpell(MilkExhaustion)
		EndIf
		
		If akActor.HasSpell(MilkMentalExhaustion)
			akActor.RemoveSpell(MilkMentalExhaustion)
		EndIf

		If akActor.HasSpell(MilkCritical)
			akActor.RemoveSpell(MilkCritical)
		EndIf

		If akActor.HasSpell(MilkLeak)
			akActor.RemoveSpell(MilkLeak)
		EndIf
		
		If akActor.HasSpell(MilkFx1)
			akActor.RemoveSpell(MilkFx1)
		EndIf
		
		If akActor.HasSpell(MilkFx2)
			akActor.RemoveSpell(MilkFx2)
		EndIf
		
		If akActor.HasSpell(BeingMilkedPassive)
			akActor.RemoveSpell(BeingMilkedPassive)
		EndIf
		
		;remove variables from StorageUtil
		StorageUtil.UnsetStringValue(akActor,"MME.MilkMaid.Name")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.LactacidCount")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.MaidMilkGen")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.PainCount")
		MME_Storage.deregisterActor(akActor)
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.BoobIncr")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.BoobPerLvl")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.TimesMilked")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.MilkingContainerCumsSUM")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.MilkingContainerMilksSUM")
		StorageUtil.UnsetIntValue(akActor,"MME.MilkMaid.MilkingMode")
		StorageUtil.UnsetIntValue(akActor,"MME.MilkMaid.IsSlave")
		StorageUtil.UnsetFloatValue(akActor,"MME.MilkMaid.MilkingContainerLactacid")
		StorageUtil.UnsetIntValue(akActor,"MME.MilkMaid.IsSuccubus")
		StorageUtil.UnsetIntValue(akActor,"MME.MilkMaid.IsVampire")
		StorageUtil.UnsetIntValue(akActor,"MME.MilkMaid.IsWerewolf")
		akActor.RemoveFromFaction(MilkMaidFaction)
		akActor.RemoveFromFaction(MilkSlaveFaction)
	EndIf
EndFunction

Function MCMMaidReset(int t, int i)
	if t == 0
		MaidRemove(MilkMaid[i])
		MilkMaid[i] = None
	else
		MaidRemove(MilkSlave[i])
		MilkSlave[i] = None
	endif
EndFunction

Function SingleMaidReset(Actor akActor)
	if MilkMaid.find(akActor) > -1
		MilkMaid[MilkMaid.find(akActor)] = None
	endif
	if MilkSlave.find(akActor) > -1
		MilkSlave[MilkSlave.find(akActor)] = None
	endif
	MaidRemove(akActor)
EndFunction

Function MaidReset()
	debug.Trace("MilkModEconomy maid reset cycle")
	int i = 0
	while ( i < MilkMaid.Length )
		debug.Trace("MilkModEconomy maid array reset " + i + " of " + MilkMaid.Length)
		MaidRemove(MilkMaid[i])
		i = i + 1
	endWhile
	
	MilkMaid = new Actor[20]
	StorageUtil.FormListClear(none,"MME.MilkMaid.List")
EndFunction

Function SlaveReset()
	debug.Trace("MilkModEconomy slave reset cycle")
	int i = 0
	while ( i < MilkSlave.Length )
		debug.Trace("MilkModEconomy Slave array reset " + i + " of " + MilkSlave.Length)
		MaidRemove(MilkSlave[i])
		i = i + 1
	endWhile

	MilkSlave = new Actor[20]
EndFunction

Function Armor_Purge()
	int i = 0
	MilkingEquipment = new string[10]
	BasicLivingArmor = new string[10]
	ParasiteLivingArmor = new string[10]
	while ( i < MilkingEquipment.Length )
		MilkingEquipment[i] = "Empty"
		BasicLivingArmor[i] = "Empty"
		ParasiteLivingArmor[i] = "Empty"
		i = i + 1
	endWhile
EndFunction

Function VarSetup()
	UnregisterForAllKeys()
	debug.Trace("MilkModEconomy variable setup/reset")
	MilkLvlCap = 10
	;reset progression
	StorageUtil.SetIntValue(none,"MME.Progression.Level", 0)
	StorageUtil.SetIntValue(none,"MME.Progression.TimesMilked", 0)
	StorageUtil.SetIntValue(none,"MME.Progression.TimesMilkedAll", 0)
	
	;UnsetIntValue(none,"MME.Settings.BreastScale")
	
	;reset mcm values
	BoobIncr = 0.05
	BoobPerLvl = 0.07
	BoobMAX = 3
	BreastCurve = 0.1
	Feeding = True
	Feeding_Duration = 30
	Feeding_Sound = 1
	FuckMachine = True
	FuckMachine_Duration = 5
	MilkGenValue = 0.06
	MilkPoll = 1
	Milking_Duration = 5
	TimesMilkedMult = 50
	GushPct = 10

	DisableSkoomaLactacid = False
	DialogueForceMilkSlave = False
	BreastScale = 0							;scaling is enabled
	BreastScaleLimit = False				;limit to BoobMAX
	BreastUpScale = False	;scale to 1
	MilkQC.Buffs = True
	MilkQC.ExhaustionMode = 0
	MME_NPCComments.SetValue(0)
	MilkQC.MME_DialogueMilking = True
	MilkQC.MME_SimpleMilkPotions = False
	ForcedFeeding = False
	FixedMilkGen = False
	FixedMilkGen4Followers = False
	CuirassSellsMilk = False
	MaidLvlCap = False
	MilkAsMaidTimesMilked = False
	MilkProdMod = 100
	MilkPriceMod = 1
	LactacidDecayRate = 0
	ExhaustionSleepMod = 0
	MilkFlag = False 						;polling disabled
	EconFlag = False 						;8h polling disabled
	MilkNaked = False
	MilkMsgs = True
	MilkCntMsgs = True
	MilkEMsgs = True
	MilkStory = True
	MilkLeakTextures = True
	MilkLeakToggle = True
	MilkLeakWearArm = False
	MilkSuccubusTransform = False
	MilkVampireTransform = False
	MilkWerewolfTransform = False
	MilkWithZaZMoMSuctionCups = False
	MilkingDrainsSP = True
	MilkingDrainsMP = True
	SexLabOrgasm = True
	SexLab3jBreastfeeding = True
	PainSystem = True
	PainKills = False
	WeightUpScale = False					;scale to 100
	PlayerCantBeMilkmaid = False
	ZazPumps = False
	
	ECTrigger = True
	ECCrowdControl = True
	ECRange = 500

	NotificationKey = 10
	HotkeyMode = 0
	RegisterForKey(NotificationKey)
	crosshairRef = None

	MilkE.divnull = 10
	MilkE.InitializeMilkProperties()
	Strings_setup()
	Armor_Purge()
	MMEfoodlistaddon()
EndFunction

Function UNINSTALL()
	debug.Trace("MilkModEconomy Uninstalling")
	;reset variables
	VarSetup()
	
	;disable mod
	if MilkFlag
		Modtoggle()
	else
		Modtoggle()
		Modtoggle()
	endif
	
	UnregisterForCrosshairRef()
	
	;reset maids stats
	MaidReset()
	SlaveReset()
	Debug.Notification("Milk Mod reset")
EndFunction

Function SetNodeScale(Actor akActor, string nodeName, float value)
	string modName = "MilkModEconomy"
	bool isFemale = false
	if akActor.GetLeveledActorBase().GetSex() == 1
		isFemale = true
	else
		isFemale = false
	endif
	if NetImmerse.HasNode(akActor, nodeName, false)
		If SKSE.GetPluginVersion("NiOverride") >= 3 && NiOverride.GetScriptVersion() >= 2 && BreastScale == 0
			if akActor == Game.GetPlayer()
				If value != 1.0
					NiOverride.AddNodeTransformScale(akActor, false, isFemale, nodeName, modName, value)
					NiOverride.AddNodeTransformScale(akActor, true, isFemale, nodeName, modName, value)
				Else
					NiOverride.RemoveNodeTransformScale(akActor, false, isFemale, nodeName, modName)
					NiOverride.RemoveNodeTransformScale(akActor, true, isFemale, nodeName, modName)
				Endif
				NiOverride.UpdateNodeTransform(akActor, true, isFemale, nodeName)
			else
				If value != 1.0
					NiOverride.AddNodeTransformScale(akActor, false, isFemale, nodeName, modName, value)
				Else
					NiOverride.RemoveNodeTransformScale(akActor, false, isFemale, nodeName, modName)
				Endif
			Endif
			NiOverride.UpdateNodeTransform(akActor, false, isFemale, nodeName)
		Else
			if akActor == Game.GetPlayer()
				NetImmerse.SetNodeScale(akActor, nodeName, value, true)
			Endif
			NetImmerse.SetNodeScale(akActor, nodeName, value, false)
		Endif
	Endif
EndFunction

float Function GetNodeScale(Actor akActor, string nodeName)
	string modName = "MilkModEconomy"
	bool isFemale = false
	if akActor.GetLeveledActorBase().GetSex() == 1
		isFemale = true
	else
		isFemale = false
	endif
	return NiOverride.GetNodeTransformScale(akActor, false, isFemale, nodeName, modName)
EndFunction
;----------------------------------------------------------------------------
;Actor status checks
;----------------------------------------------------------------------------

string Function akActorSex(Actor akActor)
bool hasSchlong = False

	if Plugin_SOS
		hasSchlong = SOS.GetSOS(akActor)
	endif
	
	if Plugin_SOS_EQUIP && hasSchlong != True
		hasSchlong = akActor.IsEquipped(Game.GetFormFromFile(0xD62, "SOS Equipable Schlong.esp"))
	endif
	
	if akActor.GetLeveledActorBase().GetSex() == 1 && SexLab.GetGender(akActor) == 1 && hasSchlong != True
		Return "Female"
	elseif akActor.GetLeveledActorBase().GetSex() == 0 && SexLab.GetGender(akActor) == 0
		Return "Male"
	elseif akActor.GetLeveledActorBase().GetSex() > 1 || SexLab.GetGender(akActor) > 1
		Return "Beast"
	else
		Return "Futa"
	endif
EndFunction

bool Function isVampire(Actor akActor)
	If StringUtil.Find(akActor.GetRace().getname(), "Vampire") >= 0 || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsVampire") == 1
		Return True
	elseif akActor.HasSpell(Game.GetFormFromFile(0xed0a8, "Skyrim.esm") as Spell) || akActor.HasSpell(Game.GetFormFromFile(0x10fb30, "Skyrim.esm") as Spell) ; VampireVampirism || VampirePoisonResist
		Return True
	elseif PlayerVampireQuest.VampireStatus != 0 && akActor == PlayerRef
		Return True
	endif
	Return False
EndFunction

bool Function isWerewolf(Actor akActor)
	If StringUtil.Find(akActor.GetRace().getname(), "Werewolf") >= 0 || StringUtil.Find(akActor.GetRace().getname(), "Werebeast") >= 0 || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsWerewolf") == 1
		Return True
	elseif akActor.HasSpell(Game.GetFormFromFile(0x92c48, "Skyrim.esm") as Spell) || akActor.HasSpell(Game.GetFormFromFile(0xf5ba0, "Skyrim.esm") as Spell) ; WerewolfChange || WerewolfImmunity
		Return True
	elseif CHScript.PlayerHasBeastBlood == 1 && akActor == PlayerRef
		Return True
	endif
	Return False
EndFunction

bool Function isSuccubus(Actor akActor)
	If StringUtil.Find(akActor.GetRace().getname(), "Succubus") >= 0 || StorageUtil.GetIntValue( akActor, "Angrim_iSuccubusCurse") > 0 || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsSuccubus") == 1
		Return True
	elseif Plugin_PSQ && akActor == PlayerRef
		if (Game.GetFormFromFile(0xDAF, "PSQ PlayerSuccubusQuest.esm") as GlobalVariable).GetValue() == 1 		;PlayerIsSuccubus
			Return True
		endif
	endif
	Return False
EndFunction

bool Function isPregnant(Actor akActor)

	;SL Procreation
	if SLP.IsPregnant(akActor) == true
		debug.Trace("MilkModEconomy SLP Pregnancy: " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif
	
	;SL Hentai pregnancy
	if SLHP.IsPregnant(akActor) == true
		debug.Trace("MilkModEconomy SLHP Pregnancy: " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif

	;SoulGem Oven 2
	if StorageUtil.GetFloatValue(akActor, "SGO.Gem.Weight") > 0
		debug.Trace("MilkModEconomy SGO2 Pregnancy: " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif
	
	;SoulGem Oven 3
	if SGO.IsPregnant(akActor) == true
		debug.Trace("MilkModEconomy SGO3 Pregnancy: " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif
	
	;PSQ SoulGem Pregnancy 2.15 || PSQ SoulGem Pregnancy 2.16 / SexLab SoulGem Pregnancy
	if StorageUtil.GetIntValue(akActor, "PSQ_SoulGemPregnancyON", 0) != 0 || StorageUtil.GetIntValue(akActor, "PRG_IsPregnant") != 0
		debug.Trace("MilkModEconomy SGP/PSQ Pregnancy: " + akActor.GetLeveledActorBase().GetName())
		Return True
	endif

	;Estrus Chaurus+
	if Plugin_EstrusChaurus
		if akActor.HasSpell( Game.GetFormFromFile(0x19121, "EstrusChaurus.esp") as Spell ) ;ChaurusBreeder spell
			debug.Trace("MilkModEconomy EC Pregnancy: " + akActor.GetLeveledActorBase().GetName())
			Return True
		endif
	endif
	
	;Estrus Spider+
	if Plugin_EstrusSpider
		if akActor.HasSpell( Game.GetFormFromFile(0x4e255, "EstrusSpider.esp") as Spell ) ;SpiderBreeder spell
			debug.Trace("MilkModEconomy ES Pregnancy: " + akActor.GetLeveledActorBase().GetName())
			Return True
		endif
	endif
	
	;BF 1.14
	if Plugin_BeeingFemale
		if akActor.HasSpell( Game.GetFormFromFile(0x28a0, "BeeingFemale.esm") as Spell ) ;_BFStatePregnant spell
			debug.Trace("MilkModEconomy BF Pregnancy: " + akActor.GetLeveledActorBase().GetName())
			Return True
		endif
	endif

	Return False
EndFunction

int Function PiercingCheck(Actor akActor)
	int t = 0
	if DDi.IsMilkingBlocked_PiercingsNipple(akActor) == true
		t = 1
	endif
	Form maidArmor = akActor.GetWornForm(Armor.GetMaskForSlot(56))
	if maidArmor != None
		if StringUtil.Find(maidArmor.getname(), "Plug" ) >= 0 
			t = 2
		elseif StringUtil.Find(maidArmor.getname(), "Piercing" ) >= 0 
			t = 1
		endif
	endif
	return t
EndFunction

int Function IsNamedMaid(Actor akActor)
	if StringUtil.Find(akActor.GetLeveledActorBase().getname(), "Milkmaid" ) >= 0
		return 1
	elseif StringUtil.Find(akActor.GetLeveledActorBase().getname(), "Milkslave" ) >= 0
		return 2
	elseif StringUtil.Find(akActor.GetLeveledActorBase().getname(), "Cow" ) >= 0
		return 3
	else
		return 0
	endif
EndFunction

Function sendVibrationEvent(string str, actor who, int mpas, int MilkingType)
	Int e = ModEvent.Create("MilkQuest."+str)
	If(!e)
		Return
	EndIf

	ModEvent.PushForm(e,Who)
	ModEvent.PushInt(e,mpas)
	ModEvent.PushInt(e,MilkingType)
	ModEvent.Send(e)
endfunction

;----------------------------------------------------------------------------
;Exhaustion/Pain Functions (Called if actor is milkmaid/slave)
;----------------------------------------------------------------------------

string Function NState(Actor akActor)
	String NState
	Float PainCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.PainCount")
	Float PainMax = MME_Storage.getPainMaximum(akActor)

	if PainCnt >= (PainMax*0.9) as int
		NState = "Sore"
	elseif PainCnt >= (PainMax/3*2) as int
		NState = "Irritated"
	elseif PainCnt >= (PainMax/3) as int
		NState = "Sensitive"
	elseif PainCnt < (PainMax/3) as int
		NState = "Normal"
	endif
return NState
EndFunction

int Function Pain(Actor akActor, int pain)
	Float PainCnt = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.PainCount")
	Float MaidLevel = MME_Storage.getMaidLevel(akActor)
	Float PainMax = MME_Storage.getPainMaximum(akActor)
		string who
		string how

	if akActor == PlayerRef
		who = "My"
		how = "feels"
	else 
		who = akActor.GetLeveledActorBase().GetName() + "'s"
		how = "looks"
	endif

	if PainCnt < (PainMax/3) as int && NState(akActor) == "Normal"
	elseif PainCnt >= (PainMax/3) as int && NState(akActor) == "Sensitive"
		pain = pain + 1
		debug.Notification(who + " nipples " + how + " very sensitive.")
	elseif PainCnt >= (PainMax/3*2) as int && NState(akActor) == "Irritated"
		pain = pain + 1
		debug.Notification(who + " nipples " + how + " irritated and stretched.")
	elseif PainCnt >= (PainMax*0.9) as int && NState(akActor) == "Sore"
		pain = pain + 1
		debug.Notification(who + " nipples jut out in pain demanding release!")
		if MilkQC.Buffs && !akActor.HasSpell(MilkExhaustion)
			akActor.AddSpell( MilkExhaustion, false )
		endif
	endif

	if PiercingCheck(akActor) == 1
		PainCnt = PainCnt + (pain - MaidLevel * 0.025) * (1 - SLA.GetActorArousal(akActor) / 100 * 0.25) * 2 
	else
		PainCnt = PainCnt + (pain - MaidLevel * 0.025) * (1 - SLA.GetActorArousal(akActor) / 100 * 0.25)
	endif

	if PainCnt > PainMax
		PainCnt = PainMax
	endif
	StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.PainCount", PainCnt)
	return pain
EndFunction