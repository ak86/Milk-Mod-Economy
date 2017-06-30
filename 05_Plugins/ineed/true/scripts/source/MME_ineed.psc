Scriptname MME_ineed extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.ineed",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction

Function iNeedfoodlistaddon()
	_snquestscript ineed = Quest.GetQuest("_SNQuest") as _snquestscript
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	int i = 0
	debug.Trace("MilkModEconomy adding drinks to iNeed.esp")
	i = 0
	While i < MilkQ.MME_Cums.GetSize()
		ineed._SNFood_DrinkNoAlcList.AddForm(MilkQ.MME_Cums.GetAt(i))
		i = i + 1
	EndWhile
	
	i = 0
	While i < MilkQ.MME_Drinks.GetSize()
		ineed._SNFood_DrinkNoAlcList.AddForm(MilkQ.MME_Drinks.GetAt(i))
		i = i + 1
	EndWhile

	debug.Trace("MilkModEconomy adding food to iNeed.esp")
	i = 0
	While i < MilkQ.MME_Foods.GetSize()
		ineed._SNFood_LightList.AddForm(MilkQ.MME_Foods.GetAt(i))
		i = i + 1
	EndWhile
EndFunction