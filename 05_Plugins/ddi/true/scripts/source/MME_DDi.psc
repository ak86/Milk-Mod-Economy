Scriptname MME_DDi extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.ddi",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

bool Function IsWearingDDMilker(Actor akActor)
	form f
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Armor scriptinstance
	int i = akActor.getnumitems()
	While i > 0
		i -= 1
		f = akActor.getnthform(i) as armor							;armor in inventory
		If f != none
			If f.HasKeyword(Libs.zad_InventoryDevice)
				scriptinstance = Libs.GetRenderedDevice(f as armor)		;scriptinstance, has dd keywords
				if akActor.isequipped(f) && (StringUtil.Find(f.getname(), "Milk" ) >= 0 || Libs.HasTag(f as armor, "milk"))
					If  scriptinstance.HasKeyword(Libs.zad_DeviousBra)	;"Milk" Bra
						Return true
					ElseIf  scriptinstance.HasKeyword(Libs.zad_DeviousHarness)	;"Milk" Harness
						Return true
					Endif
				Endif
			EndIf
		EndIf
	endwhile
	Return false
EndFunction

bool Function IsWearingGag (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousGag)
EndFunction

bool Function IsWearingGag_Open (Actor akActor)	;oral permitted
	Bool IsMilkingBlocked = false
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	if akActor.WornHasKeyword(Libs.zad_DeviousGag) && akActor.WornHasKeyword(Libs.zad_PermitOral)
		IsMilkingBlocked = true
	endif
	Return IsMilkingBlocked
EndFunction

bool Function IsWearingBelt (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousBelt)
EndFunction

bool Function IsWearingBelt_Open (Actor akActor)
	Bool IsMilkingBlocked = false
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	if akActor.WornHasKeyword(Libs.zad_DeviousBelt) && akActor.WornHasKeyword(Libs.zad_PermitAnal)
		IsMilkingBlocked = true
	endif
	Return IsMilkingBlocked
EndFunction

bool Function IsMilkingBlocked_Bra (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousBra)
EndFunction

bool Function IsMilkingBlocked_Armbinder (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousArmbinder)
EndFunction

bool Function IsMilkingBlocked_Yoke (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousYoke)
EndFunction

bool Function IsMilkingBlocked_PiercingsNipple (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousPiercingsNipple)
EndFunction

bool Function IsMilkingBlocked_Suit (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousSuit)
EndFunction

bool Function IsWearingHarness (Actor akActor)
	zadLibs Libs = Quest.GetQuest("zadQuest") as zadLibs
	Return akActor.WornHasKeyword(Libs.zad_DeviousHarness)
EndFunction
