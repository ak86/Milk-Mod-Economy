;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Milk_Dialogue_TradeMilk_Alchemy Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MilkQ.PlayerREF.additem(MilkQ.MME_Milks.GetAt(0), 1)
	MilkQ.PlayerREF.removeitem(MilkQ.MilkE.Gold, 100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MilkQUEST Property MilkQ  Auto  
