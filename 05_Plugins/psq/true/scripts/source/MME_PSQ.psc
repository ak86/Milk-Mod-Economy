Scriptname MME_PSQ extends Quest

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