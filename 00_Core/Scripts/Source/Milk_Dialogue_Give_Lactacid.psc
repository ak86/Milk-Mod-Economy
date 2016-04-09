;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname Milk_Dialogue_Give_Lactacid Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;MilkModEconomy give milkmaid lactacid dialogue script
akSpeaker.EquipItem(MilkQ.MME_Milks.GetAt(0))
MilkQ.PlayerREF.RemoveItem(MilkQ.MME_Milks.GetAt(0), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
