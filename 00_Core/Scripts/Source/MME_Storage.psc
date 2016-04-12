Scriptname MME_Storage Hidden

; Variables in StorageUtil
; float
;	MME.MilkMaid.BreastBase
;	MME.MilkMaid.BreastBaseMod
;	MME.MilkMaid.WeightBase

function initializeActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered initializeActor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBase", getBreastNodeScale(akActor))
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod", 0)
	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.WeightBase", akActor.GetLeveledActorBase().GetWeight())
endfunction

function deregisterActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered deregisterActor() for actor " + akActor.GetLeveledActorBase().GetName())
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBase")
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBaseMod")
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
