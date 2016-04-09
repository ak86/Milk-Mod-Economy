;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname Milk_Dialogue_Hello Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;MilkModEconomy milking dialogue script(fill up Milk conditions)
;GetSex(): 0 - male, 1 - female

;MilkQ.MilkQC Dialogue Variables reset
	MilkQ.MilkQC.MME_TargetMilk = 0
	MilkQ.MilkQC.MME_SubjectMilk = 0
	MilkQ.MilkQC.MME_CanbeconvertedfromSlaveToMaid = 0
	MilkQ.MilkQC.MME_CanBeConvertedFromMaidToSlave = 0
	MilkQ.MilkQC.MME_FreeMaidSlots = 0

;checks pc milk
if MilkQ.PlayerREF.GetLeveledActorBase().GetSex() == 1
	MilkQ.MilkQC.MME_TargetMilk = StorageUtil.GetFloatValue(MilkQ.PlayerREF,"MME.MilkMaid.MilkCount", missing = 0)
endif

if akSpeaker.GetLeveledActorBase().GetSex() == 1
;checks if npc has string "Milkslave" or "Milkmaid" in its name and make it milkslave if it is
	if MilkQ.IsNamedMaid(akSpeaker) != 0 && MilkQ.MILKSlave.Find(none) != -1 && MilkQ.MILKSlave.Find(akSpeaker) == -1 && MilkQ.MilkMaid.Find(akSpeaker) == -1 && MilkQ.DialogueForceMilkSlave
		MilkQ.AssignSlotSlave(akSpeaker, 0, Utility.RandomInt(4))
	endif
	
;checks if player have free maidslots
	if MilkQ.MILKmaid.Find(none,1) <= MilkQ.Milklvl0fix() && MilkQ.MILKmaid.Find(none,1) > 0
		MilkQ.MilkQC.MME_FreeMaidSlots = 1
	else
		MilkQ.MilkQC.MME_FreeMaidSlots = 0
	endif

;checks if npc can be transferred from slave to maid
	if MilkQ.MILKSlave.Find(akSpeaker) != -1
		int i = 1
		int count = 0
		While i < MilkQ.MilkMaid.Length && MilkQ.Milklvl0fix() > count
			If MilkQ.MilkMaid[i] == None
				count = count + 1
			EndIf
			i = i + 1
		EndWhile
		If MilkQ.MILKmaid.Find(none,1) != -1 || count == 0
			MilkQ.MilkQC.MME_CanbeconvertedfromSlaveToMaid = 1
		Endif
	endif

;checks if npc can be transferred from maid to slave
	if MilkQ.MilkMaid.Find(akSpeaker) != -1
		If MilkQ.MILKSlave.Find(none,1) != -1
			MilkQ.MilkQC.MME_CanBeConvertedFromMaidToSlave = 1
		Endif
	endif

;checks npc milk
	MilkQ.MilkQC.MME_SubjectMilk = StorageUtil.GetFloatValue(akSpeaker,"MME.MilkMaid.MilkCount", missing = 0)
	
	if MilkQ.IsNamedMaid(akSpeaker) != 0 && MilkQ.MilkQC.MME_SubjectMilk == 0
		MilkQ.MilkQC.MME_SubjectMilk = Utility.RandomInt(4)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
