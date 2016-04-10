Scriptname MME_Storage Hidden

; Varables in StorageUtil
; float
;	MME.MilkMaid.BreastBase

; must NiOverride be considered?
; what happens if there is no such bone? (e.g. wrong skeleton or transformed?)
function initializeActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered initializeActor() for actor " + akActor.GetLeveledActorBase().GetName())

	; <sanity check>
	float BreastL = NetImmerse.GetNodeScale(akActor, "NPC L Breast", false)
	float BreastR = NetImmerse.GetNodeScale(akActor, "NPC R Breast", false)
	if (BreastL != BreastR)
		string ActorName = akActor.GetLeveledActorBase().GetName()
		Debug.Notification("[MilkModEconomy] " + ActorName + " has differently sized left and right breast!")
		Debug.Notification("[MilkModEconomy] Asymetric breasts are not supported!")
	endif
	; </sanity check>

	StorageUtil.SetFloatValue(akActor, "MME.MilkMaid.BreastBase", BreastL)
	;set "MME.MilkMaid.WeightBase" later on
endfunction

function deregisterActor(actor akActor) global
	Debug.Trace("MME_Storage: Triggered deregisterActor() for actor " + akActor.GetLeveledActorBase().GetName())

	; handles just a single value - for now
	StorageUtil.UnsetFloatValue(akActor, "MME.MilkMaid.BreastBase")

	endfunction

; <please review and remove this comment afterwards>
;   there were 3 variations for the default value:
;   in MilkMCM.psc/MilkQUEST.psc:
;     StorageUtil.GetFloatValue(<target>, "MME.MilkMaid.BreastBase", missing = 0)
;     StorageUtil.GetFloatValue(<target>, "MME.MilkMaid.BreastBase", missing = MilkQ.GetNodeScale(akActor, "NPC L Breast"))
;   in MilkMCM.psc;
;     StorageUtil.GetFloatValue(<target>, "MME.MilkMaid.BreastBase", missing = 1)
;
; => using HasFloatValue() to avoid silent initialisation
;    ~may~ be unnecessary (but it could help to avoid strange issues with faulty initialisations)
;    ~may~ incur a performance hit - not tested/benchmarked
; => must NiOverride be considered when determining default value?
; </please review and remove this comment afterwards>
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
