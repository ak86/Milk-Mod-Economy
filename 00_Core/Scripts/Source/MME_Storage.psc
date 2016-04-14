Scriptname MME_Storage Hidden

; Variables in StorageUtil
; float
;	MME.MilkMaid.BreastBase
;	MME.MilkMaid.BreastBaseMod
;	MME.MilkMaid.MilkCount
;	MME.MilkMaid.WeightBase

; (get|set|change)MilkCurrent() automatically restricts the 'current' value to the allowed maximum
; [this makes sure that these functions never return/store an invalid value where 'current > maximum']
; however some care must be taken:
;  -> set the MaidLevel before setting or changing MilkCurrent
;  -> refetch MilkCurrent after setting/changing it (value may have been truncated to upper limit)
;  -> refetch MilkMaximum after milking             (level may have increased and new limit applies)

function initializeActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered initializeActor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBase", getBreastNodeScale(akActor))
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod", 0)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", 0)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.WeightBase", akActor.GetLeveledActorBase().GetWeight())
endfunction

function deregisterActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered deregisterActor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBase")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.MilkCount")
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

float function getMilkCurrent(actor akActor) global
	Debug.Trace("MME_Storage: Triggered getMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float MilkCur = StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.MilkCount")
	float MilkMax = getMilkMaximum(akActor)
	if MilkCur <= MilkMax
		return MilkCur
	else
		; may trigger if the maid level has been decreased (e.g. via debug options)
		Debug.Trace("MME_Storage.getMilkCurrent(): " + akActor.GetLeveledActorBase().GetName() + " -> " + MilkCur + ">" + MilkMax)
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", MilkMax)
		return MilkMax
	endif
endfunction

function setMilkCurrent(actor akActor, float Value) global
	Debug.Trace("MME_Storage: Triggered setMilkCurrent() for actor " + akActor.GetLeveledActorBase().GetName())
	float MilkMax = getMilkMaximum(akActor)
	if Value <= MilkMax
		StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.MilkCount", Value)
	else
		Debug.Trace("MME_Storage.setMilkCurrent(): " + akActor.GetLeveledActorBase().GetName() + " -> " + Value + ">" + MilkMax)
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
	return (StorageUtil.GetFloatValue(akActor, "MME.MilkMaid.Level") + 2) * 2
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
