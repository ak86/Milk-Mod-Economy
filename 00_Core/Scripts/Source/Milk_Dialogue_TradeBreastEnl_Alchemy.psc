;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Milk_Dialogue_TradeBreastEnl_Alchemy Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
;BEGIN CODE
	Actor akSpeaker = akSpeakerRef as Actor
	MilkQ.PlayerREF.additem(MilkQ.MME_Util_Potions.GetAt(1), 1)
	MilkQ.PlayerREF.removeitem(MilkQ.MilkE.Gold, 1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MilkQUEST Property MilkQ  Auto  
