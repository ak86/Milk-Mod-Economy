Scriptname MME_DDi extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.ddi",1)
EndEvent

bool Function IsIntegraged ()
	Return False
EndFunction

bool Function IsWearingDDGag (Actor akActor)
	Return False
EndFunction

bool Function IsWearingGag (Actor akActor)
	Return False
EndFunction

bool Function IsWearingBelt (Actor akActor)
	Return False
EndFunction

bool Function IsMilkingBlocked_Bra (Actor akActor)
	Return False
EndFunction

bool Function IsMilkingBlocked_Armbinder (Actor akActor)
	Return False
EndFunction

bool Function IsMilkingBlocked_Yoke (Actor akActor)
	Return False
EndFunction

bool Function IsMilkingBlocked_PiercingsNipple (Actor akActor)
	Return False
EndFunction

bool Function IsMilkingBlocked_Suit (Actor akActor)
	Return False
EndFunction

bool Function IsWearingHarness (Actor akActor)
	Return False
EndFunction

bool Function IsWearingGag_Open (Actor akActor)	;oral permitted
	Return False
EndFunction

bool Function IsWearingBelt_Open (Actor akActor)
	Return False
EndFunction

bool Function IsWearingDDMilker(Actor akActor)
	Return false
EndFunction

;----------------------------------------------------------------------------
;DDI hooks
;----------------------------------------------------------------------------

Event OnVibrateStart(string eventName, string argString, float argNum, form sender)
EndEvent
