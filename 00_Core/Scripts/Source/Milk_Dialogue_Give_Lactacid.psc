;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname Milk_Dialogue_Give_Lactacid Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
;BEGIN CODE
;MilkModEconomy give milkmaid lactacid dialogue script
	Actor akSpeaker = akSpeakerRef as Actor
	akSpeaker.EquipItem(MilkQ.MME_Util_Potions.GetAt(0))
	MilkQ.PlayerREF.RemoveItem(MilkQ.MME_Util_Potions.GetAt(0), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
