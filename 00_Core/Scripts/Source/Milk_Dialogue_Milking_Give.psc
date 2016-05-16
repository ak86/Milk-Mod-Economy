;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname Milk_Dialogue_Milking_Give Extends TopicInfo Hidden
MilkQUEST Property MilkQ Auto

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
;BEGIN CODE
;MilkModEconomy milking dialogue script(Player sucking)
;sexActors[]: 0 - actor being sucked, 1 - actor sucking
;GetSex(): 0 - male, 1 - female
	Actor akSpeaker = akSpeakerRef as Actor
	actor[] sexActors = new actor[2]
	sslBaseAnimation[] anims
	anims = new sslBaseAnimation[1]
	
	if akSpeaker.GetActorBase().GetSex() == 0 && MilkQ.PlayerREF.GetActorBase().GetSex() == 0
		Debug.Notification("Sorry, there are no gay animations, dividing universe by zero, have a nice day.")
		return
	else
		sexActors[0] = akSpeaker
		sexActors[1] = MilkQ.PlayerREF
	endif

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
