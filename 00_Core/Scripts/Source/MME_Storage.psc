Scriptname MME_Storage Hidden

; Variables in StorageUtil
; float
;	MME.MilkMaid.BreastBase
;	MME.MilkMaid.BreastBaseMod
;	MME.MilkMaid.BreastCount
;	MME.MilkMaid.LactacidCount
;	MME.MilkMaid.Level
;	MME.MilkMaid.MilkCount
;	MME.MilkMaid.MilkMaximum
;	MME.MilkMaid.MilkMax.Basevalue
;	MME.MilkMaid.MilkMax.Scalefactor
;	MME.MilkMaid.WeightBase

; (get|set|change)MilkCurrent() automatically restricts the 'current' value to the allowed maximum
; [this makes sure that these functions never return/store an invalid value where 'current > maximum']
; however some care must be taken:
;  -> set the MaidLevel before setting or changing MilkCurrent
;  -> refetch MilkCurrent after setting/changing it (value may have been truncated to upper limit)
;  -> refetch MilkMaximum after milking             (level may have increased and new limit applies)

function initializeActor(actor akActor, float Level = 0.0, float MilkCnt = 0.0) global
	Debug.Trace("MME_Storage: Triggered initializeActor() for actor " + akActor.GetLeveledActorBase().GetName())

	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBase", getBreastNodeScale(akActor))
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod", 0)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastCount", 2)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.LactacidCount", 0)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.Level", Level)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkCnt)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue", 2)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor", 1)
	; BreastCount, MilkMax.Basevalue and MilkMax.Scalefactor must be set before 'calculateMilkLimit()'
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", calculateMilkLimit(akActor, Level))
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.PainCount", 0)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.WeightBase", akActor.GetLeveledActorBase().GetWeight())
endfunction

function deregisterActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered deregisterActor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBase")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastCount")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.LactacidCount")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.Level")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkCount")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkMaximum")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.PainCount")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.WeightBase")
endfunction

float function getBreastsBaseadjust(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getBreastsBaseadjust() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod")
endfunction

function setBreastsBaseadjust(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setBreastsBaseadjust() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod", Value)
endfunction

float function getBreastsBasevalue(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getBreastsBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	if StorageUtil.HasFloatValue(akActor, "MME.MilkMaid.BreastBase")
		return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.BreastBase")
	else
		; value was not known yet for whatever reason - properly initialise it
		Debug.Notification("MME_Storage: Called getBreastsBasevalue() but value is not known yet!")
		float nodescale = NetImmerse.GetNodeScale(akActor, "NPC L Breast", false)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBase", nodescale)
		return nodescale
	endif
endfunction

function setBreastsBasevalue(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setBreastsBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBase", Value)
endfunction

float function getLactacidCurrent(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getLactacidCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.LactacidCount")
endfunction

; verifies whether the provided value is inside the allowed range
;
; provided value   resulting 'LactacidCurrent'   return value
;        x < 0              0                       false
;   0 <= x <= Max           x                       true
;        x > Max           Max                      false
bool function setLactacidCurrent(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setLactacidCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float LactacidMax = getLactacidMaximum(akActor)
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	
	if Value < 0
		Debug.Trace("MME_Storage: Provided values would result in LactacidCurrent = " + Value)
		Debug.Trace("MME_Storage: Clamping LactacidCurrent to 0 instead.")
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.LactacidCount", 0)
		return false
	elseif Value > LactacidMax && MilkQ.BreastScaleLimit
		Debug.Trace("MME_Storage: Provided values would result in LactacidCurrent = " + Value)
		Debug.Trace("MME_Storage: BreastScaleLimit is " + MilkQ.BreastScaleLimit)
		Debug.Trace("MME_Storage: Clamping LactacidCurrent to " + LactacidMax + " instead.")
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.LactacidCount", LactacidMax)
		return false
	else
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.LactacidCount", Value)
		return true
	endif
endfunction

bool function changeLactacidCurrent(actor akActor, float Delta) global
	Debug.Trace("MME_Storage: Triggered changeLactacidCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float Value = getLactacidCurrent(akActor)
	return setLactacidCurrent(akActor, Value + Delta)
endfunction

float function getLactacidMaximum(actor akActor) global
	return (StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level") + 2) / 2 + 4
endfunction

float function getMaidLevel(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMaidLevel() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level")
endfunction

float function setMaidLevel(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMaidLevel() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.Level", Value)
	updateMilkMaximum(akActor)
endfunction

float function getMilkCurrent(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkCount")
endfunction

float function updateMilkCurrent(actor akActor) global
	Debug.Trace("MME_Storage: Triggered updateMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float MilkCur = getMilkCurrent(akActor)
	float MilkMax = getMilkMaximum(akActor)
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST

	if MilkCur <= MilkMax
		Debug.Trace("  -> " + MilkCur + " <=  " + MilkMax)
		return MilkCur
	elseif MilkQ.BreastScaleLimit
		Debug.Trace("  -> " + MilkCur + " >  " + MilkMax)
		Debug.Trace("MME_Storage: BreastScaleLimit is " + MilkQ.BreastScaleLimit)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
		return MilkMax
	else 
		Debug.Trace("  -> " + MilkCur + " >  " + MilkMax)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
		return MilkCur
	endif
endfunction

function setMilkCurrent(actor akActor, float Value, bool enforceMaxValue) global
	Debug.Trace("MME_Storage: Triggered setMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST

	if enforceMaxValue && MilkQ.PiercingCheck(akActor) != 2
		float MilkMax = getMilkMaximum(akActor)
		if Value <= MilkMax
			Debug.Trace("  -> " + Value + " <=  " + MilkMax)
			StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", Value)
		else
			Debug.Trace("  -> " + Value + " >  " + MilkMax)
			StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
		endif
	else
		Debug.Trace("  -> " + Value + " (no limit enforced)")
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", Value)
	endif
endfunction

function changeMilkCurrent(actor akActor, float Delta, bool enforceMaxValue) global
	Debug.Trace("MME_Storage: Triggered changeMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float MilkCur = getMilkCurrent(akActor)
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST

	if enforceMaxValue && MilkQ.PiercingCheck(akActor) != 2
		float MilkMax = getMilkMaximum(akActor)
		if (MilkCur + Delta) <= MilkMax
			StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkCount", Delta)
		else
			Debug.Trace("MME_Storage.changeMilkCurrent(): " + akActor.GetLeveledActorBase().GetName() + " -> " + (MilkCur + Delta) + ">" + MilkMax)
			StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
		endif
	else
		StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkCount", Delta)
	endif
endfunction

float function getMilkMaximum(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMilkMaximum() for actor " + akActor.GetLeveledActorBase().GetName())

	; intentionally not using 'missing = ...' in order to avoid computing
	; a default value that's immediately thrown away in almost every case
	if StorageUtil.HasFloatValue(akActor, "MME.MilkMaid.MilkMaximum")
		return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMaximum")
	else
		; should only trigger when upgrading an existing savegame
		Debug.Trace("MME_Storage.getMilkMaximum(): Reinitializing default value for actor " + akActor.GetLeveledActorBase().GetName())
		float MaidLevel = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level")
		float MilkMax   = calculateMilkLimit(akActor, MaidLevel)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", MilkMax)
		return MilkMax
	endif
endfunction

float function getMilkMaxBasevalue(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMilkMaxBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue", missing = 2)
endfunction

function setMilkMaxBasevalue(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMilkMaxBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue", Value)
	updateMilkMaximum(akActor)
endfunction

float function getMilkMaxScalefactor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMilkMaxScalefactor() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor", missing = 1)
endfunction

function setMilkMaxScalefactor(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMilkMaxScalefactor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor", Value)
	updateMilkMaximum(akActor)
endfunction

float function getPainCurrent(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getPainCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.PainCount")
endfunction

; verifies whether the provided value is inside the allowed range
;
; provided value   resulting 'PainCurrent'   return value
;        x < 0              0                   false
;   0 <= x <= Max           x                   true
;        x > Max           Max                  false
bool function setPainCurrent(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setPainCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float PainMax = getPainMaximum(akActor)

	if Value < 0
		Debug.Trace("MME_Storage: Provided values would result in PainCurrent = " + Value)
		Debug.Trace("MME_Storage: Clamping PainCurrent to 0 instead.")
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.PainCount", 0)
		return false
	elseif Value > PainMax
		Debug.Trace("MME_Storage: Provided values would result in PainCurrent = " + Value)
		Debug.Trace("MME_Storage: Clamping PainCurrent to " + PainMax + " instead.")
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.PainCount", PainMax)
		return false
	else
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.PainCount", Value)
		return true
	endif
endfunction

float function getPainMaximum(actor akActor) global
	return (StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level") + 2) * 2
endfunction

float function getWeightBasevalue(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getWeightBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.WeightBase")
endfunction

function setWeightBasevalue(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setWeightBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.WeightBase", Value)
endfunction

float function getBreastNodeScale(actor akActor) global
	string ActorName = akActor.GetLeveledActorBase().GetName()

	bool isFirstPerson = false
	if NetImmerse.HasNode(akActor, "NPC L Breast", isFirstPerson) && NetImmerse.HasNode(akActor, "NPC R Breast", isFirstPerson)
		float BreastL = NetImmerse.GetNodeScale(akActor, "NPC L Breast", isFirstPerson)
		float BreastR = NetImmerse.GetNodeScale(akActor, "NPC R Breast", isFirstPerson)

		; <sanity check>
		if (BreastL != BreastR)
			Debug.Notification("[MilkModEconomy] " + ActorName + " has differently sized left and right breast!")
			Debug.Notification("[MilkModEconomy] Asymetric breasts are not supported!")
		endif
		; </sanity check>

		return BreastL
	else
		Debug.Notification("[MilkModEconomy] Unsupported skeleton or armor - unable to find breast nodes for '" + ActorName + "'!")
		Debug.Notification("[MilkModEconomy] (Mod will work but breast growth will have no visible effect.)")

		return 1.0
	endif
endfunction

; original formula to calculate the maximum milk limit was '(Level+2)*2'
float function calculateMilkLimit(actor akActor, float Level) global
	float BreastCount     = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.BreastCount", missing = 2)
	float MilkBasevalue   = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue", missing = 2)
	float MilkScalefactor = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor", missing = 1)

	return (MilkBasevalue + Level*MilkScalefactor)*BreastCount
endfunction

function updateMilkMaximum(actor akActor) global
	float MilkMax = calculateMilkLimit(akActor, StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level"))

	; MilkMax must be >=1 to enable milking
	float MinValue = 1
	if MilkMax >= MinValue
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", MilkMax)
	else
		Debug.Trace("MME_Storage: User provided values would result in MilkMax = " + MilkMax)
		Debug.Trace("MME_Storage: Clamping MilkMax to " + MinValue + " instead.")
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", MinValue)
	endif
	updateMilkCurrent(akActor)
endfunction
