Scriptname MME_PSQ extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.psq",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

Function AddEnergy ()
	playersuccubusquestscript PSQ = Quest.GetQuest("PlayerSuccubusQuest") as playersuccubusquestscript
	Float MaxEnergy = PSQ.MaxEnergy
	
	if PSQ.SuccubusEnergy.GetValue() + MaxEnergy * 0.1 <= MaxEnergy
		PSQ.SuccubusEnergy.SetValue(PSQ.SuccubusEnergy.GetValue() + MaxEnergy * 0.1)
	else 
		PSQ.SuccubusEnergy.SetValue(MaxEnergy)
	endif
EndFunction

Function BecomeSuccubus ()
	playersuccubusquestscript PSQ = Quest.GetQuest("PlayerSuccubusQuest") as playersuccubusquestscript
	PSQ.BecomeSuccubus()
EndFunction