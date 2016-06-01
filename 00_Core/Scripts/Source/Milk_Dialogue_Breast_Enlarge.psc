;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname Milk_Dialogue_Breast_Enlarge Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
;BEGIN CODE
	;MilkModEconomy Increase breast size script
	Actor akSpeaker = akSpeakerRef as Actor
	akSpeaker.EquipItem(MilkQ.MME_Util_Potions.GetAt(1))
	MilkQ.PlayerREF.RemoveItem(MilkQ.MME_Util_Potions.GetAt(1), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
