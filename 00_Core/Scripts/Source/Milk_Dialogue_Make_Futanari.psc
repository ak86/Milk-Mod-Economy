;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname Milk_Dialogue_Make_Futanari Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;MilkModEconomy make futanari dialogue script
akSpeaker.EquipItem(MilkQ.MME_Cums.GetAt(3))
MilkQ.PlayerREF.RemoveItem(MilkQ.MME_Cums.GetAt(3), 1)
;END CODE

EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
