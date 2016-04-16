Scriptname MME_UIE extends Quest

bool Function IsIntegraged ()
	Return True
EndFunction

Function InventWheel(Actor akActor)
	MilkQUEST MilkQ = Quest.GetQuest("MME_MilkQUEST") as MilkQUEST
	int i = 0
	string[] _optionText = new String[8]
	string[] _optionLabelText = new String[8]

	_optionText[0] = ""
	_optionText[1] = ""
	_optionText[2] = ""
	_optionText[3] = ""
	_optionText[4] = ""
	_optionText[5] = ""
	_optionText[6] = ""
	_optionText[7] = ""

	_optionLabelText[0] = ""
	_optionLabelText[1] = ""
	_optionLabelText[2] = ""
	_optionLabelText[3] = ""
	_optionLabelText[4] = ""
	_optionLabelText[5] = ""
	_optionLabelText[6] = ""
	_optionLabelText[7] = ""
	
	While i < 8
		UIExtensions.InitMenu("UIWheelMenu")
		UIExtensions.SetMenuPropertyIndexString("UIWheelMenu", _optionText, i, "Option0")
		UIExtensions.SetMenuPropertyIndexString("UIWheelMenu", _optionLabelText, i, "Option0")
		UIExtensions.SetMenuPropertyIndexBool("UIWheelMenu","optionEnabled",i,"Enabled")
		i = i + 1
	EndWhile
	
	int ret = UIExtensions.OpenMenu("UIWheelMenu")
	Debug.Trace("Option " + ret + " selectioned")
EndFunction
