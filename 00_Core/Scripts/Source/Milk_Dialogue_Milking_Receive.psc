;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname Milk_Dialogue_Milking_Receive Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;MilkModEconomy milking dialogue script(Player sucked)
;sexActors[]: 0 - actor being sucked, 1 - actor sucking
;GetSex(): 0 - male, 1 - female

actor[] sexActors = new actor[2]
if akSpeaker.GetActorBase().GetSex() == 0 && MilkQ.PlayerREF.GetActorBase().GetSex() == 0
	Debug.Notification("Sorry, there are no gay animations, dividing universe by zero, have a nice day.")
	return
else
	sexActors[0] = MilkQ.PlayerREF
	sexActors[1] = akSpeaker
endif

sslBaseAnimation[] anims
anims = new sslBaseAnimation[1]

if sexActors[1].GetActorBase().GetSex() == 0 || ((MilkQ.akActorSex(sexActors[1]) == "Futa") && Utility.RandomInt(1, 2) == 1)
	anims[0] = MilkQ.SexLab.AnimSlots.GetbyRegistrar("zjBreastFeedingVar")		;Straight
else
	anims[0] = MilkQ.SexLab.AnimSlots.GetbyRegistrar("zjBreastFeeding")			;Lesbian
endif

MilkQ.SexLab.StartSex(sexActors, anims)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
