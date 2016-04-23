;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Milk_Dialogue_TradeMilk_Fence Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
	int i = 1
	int gold = 0
	while i < MilkQ.MME_Milks.GetSize()
		if MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Milks.GetAt(i)) > 0
			gold = gold + MilkQ.MilkE.CalculateBaseTrade(MilkQ.MME_Milks.GetAt(i) as Potion, MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Milks.GetAt(i))) *2
			MilkQ.PlayerREF.removeitem(MilkQ.MME_Milks.GetAt(i), MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Milks.GetAt(i)))
			return
		endif
		i = i + 1
	endwhile
	MilkQ.PlayerREF.additem(MilkQ.MilkE.Gold, gold)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MilkQuest Property MilkQ  Auto  
