;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Milk_Dialogue_TradeCum_Alchemy Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
;BEGIN CODE
	Actor akSpeaker = akSpeakerRef as Actor
	int i = 0
	int gold = 0
	if MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)) > 0
		gold = gold + (MilkQ.MME_Cums.GetAt(i) as Potion).GetGoldValue() * MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i))
		MilkQ.PlayerREF.removeitem(MilkQ.MME_Cums.GetAt(i), MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)))
	endif
	i = i + 1
	if MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)) > 0
		gold = gold + (MilkQ.MME_Cums.GetAt(i) as Potion).GetGoldValue() * MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i))
		MilkQ.PlayerREF.removeitem(MilkQ.MME_Cums.GetAt(i), MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)))
	endif
	i = i + 1
	if MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)) > 0
		gold = gold + (MilkQ.MME_Cums.GetAt(i) as Potion).GetGoldValue() * MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)) * 2
		MilkQ.PlayerREF.removeitem(MilkQ.MME_Cums.GetAt(i), MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)))
	endif
	i = i + 1
	if MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)) > 0
		gold = gold + (MilkQ.MME_Cums.GetAt(i) as Potion).GetGoldValue() * MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)) * 2
		MilkQ.PlayerREF.removeitem(MilkQ.MME_Cums.GetAt(i), MilkQ.PlayerREF.GetItemCount(MilkQ.MME_Cums.GetAt(i)))
	endif

	MilkQ.PlayerREF.additem(MilkQ.MilkE.Gold, gold)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MilkQUEST Property MilkQ  Auto  
