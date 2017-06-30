Scriptname MME_UIE extends Quest Hidden

Event OnInit()
	StorageUtil.SetIntValue(none,"MME.PluginsCheck.uie",2)
EndEvent

bool Function IsIntegraged ()
	Return True
EndFunction