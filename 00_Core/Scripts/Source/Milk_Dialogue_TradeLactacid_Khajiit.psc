;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Milk_Dialogue_TradeLactacid_Khajiit Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
	int i = 1
	while i < MilkQ.MME_Milks.GetSize()
		if MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Milks.GetAt(i)) > 0
			MilkQ.PlayerREF.removeitem(MilkQ.MME_Milks.GetAt(0))
			MilkQ.PlayerREF.additem(MilkQ.MME_Milks.GetAt(0), 1)
			return
		endif
		i = i + 1
	endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MilkQUEST Property MilkQ  Auto  
