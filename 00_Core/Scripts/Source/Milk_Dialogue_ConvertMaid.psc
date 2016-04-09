;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Milk_Dialogue_ConvertMaid Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if MilkQ.MilkQC.MME_CanBeConvertedFromMaidToSlave == 1					;MilkModEconomy transfer from milkmaid to milkslave dialogue script
	MilkQ.AssignSlotMaidToSlave(akSpeaker)
elseif MilkQ.MilkQC.MME_CanbeconvertedfromSlaveToMaid == 1				;MilkModEconomy transfer from milkslave to milkmaid dialogue script
	MilkQ.AssignSlotSlaveToMaid(akSpeaker)
endif

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
