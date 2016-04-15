Scriptname MME_Storage Hidden

; Variables in StorageUtil
; float
;	MME.MilkMaid.BreastBase
;	MME.MilkMaid.BreastBaseMod
;	MME.MilkMaid.BreastCount
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
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.Level", Level)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkCnt)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue", 2)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor", 1)
	; BreastCount, MilkMax.Basevalue and MilkMax.Scalefactor must be set before 'calculateMilkLimit()'
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", calculateMilkLimit(akActor, Level))
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.WeightBase", akActor.GetLeveledActorBase().GetWeight())
endfunction

function deregisterActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered deregisterActor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBase")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastCount")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.Level")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkCount")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkMaximum")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor")
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

float function getLactacidMaximum(actor akActor) global
	return (StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level") + 2) / 2
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
	return updateMilkCurrent(akActor)
endfunction

float function updateMilkCurrent(actor akActor) global
	Debug.Trace("MME_Storage: Triggered updateMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	; intentionally avoiding getMilkCurrent() and fetching value directly
	float MilkCur = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkCount")
	float MilkMax = getMilkMaximum(akActor)

	if MilkCur <= MilkMax
		Debug.Trace("  -> " + MilkCur + " <=  " + MilkMax)
		return MilkCur
	else
		Debug.Trace("  -> " + MilkCur + " >  " + MilkMax)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
		return MilkMax
	endif
endfunction

function setMilkCurrent(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float MilkMax = getMilkMaximum(akActor)
	if Value <= MilkMax
		Debug.Trace("  -> " + Value + " <=  " + MilkMax)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", Value)
	else
		Debug.Trace("  -> " + Value + " >  " + MilkMax)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
	endif
endfunction

function changeMilkCurrent(actor akActor, float Delta) global
	Debug.Trace("MME_Storage: Triggered changeMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float MilkCur = getMilkCurrent(akActor)
	float MilkMax = getMilkMaximum(akActor)

	if (MilkCur + Delta) <= MilkMax
		StorageUtil.AdjustFloatValue(akActor, "MME.MilkMaid.MilkCount", Delta)
	else
		Debug.Trace("MME_Storage.changeMilkCurrent(): " + akActor.GetLeveledActorBase().GetName() + " -> " + (MilkCur + Delta) + ">" + MilkMax)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
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
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue")
endfunction

function setMilkMaxBasevalue(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMilkMaxBasevalue() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue", Value)
	updateMilkMaximum(akActor)
endfunction

float function getMilkMaxScalefactor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMilkMaxScalefactor() for actor " + akActor.GetLeveledActorBase().GetName())
	return StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor")
endfunction

function setMilkMaxScalefactor(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMilkMaxScalefactor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor", Value)
	updateMilkMaximum(akActor)
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
		Debug.Notification("[MilkModEconomy] Unsupported skeleton - unable to find breast nodes for '" + ActorName + "'!")
		Debug.Notification("[MilkModEconomy] (Mod will work but breast growth will have no visible effect.)")

		return 1.0
	endif
endfunction

; original formula to calculate the maximum milk limit was '(Level+2)*2'
float function calculateMilkLimit(actor akActor, float Level) global
	float BreastCount     = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.BreastCount")
	float MilkBasevalue   = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Basevalue")
	float MilkScalefactor = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkMax.Scalefactor")

	return (MilkBasevalue + Level*MilkScalefactor)*BreastCount
endfunction

function updateMilkMaximum(actor akActor) global
	float MilkMax = calculateMilkLimit(akActor, StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level"))
	if MilkMax > 0
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", MilkMax)
	else
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkMaximum", 0)
	endif
	updateMilkCurrent(akActor)
endfunction
