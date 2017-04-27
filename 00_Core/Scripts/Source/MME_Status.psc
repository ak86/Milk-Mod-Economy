Scriptname MME_Status extends Quest
{MME check script}
;Doesn't connect to main mod in anyway, only purpose is to check if MME scripts are initiated
;To do this we check MME_Status_Global, which should be set be MME to 1 by maintenance() in MilkPlayerLoadGame script
;by it self this script is run once when mod is installed, should be registered by alias script to run on playerloadgame

GlobalVariable Property MME_Status_Global Auto

int update_interval = 60

Event OnInit()
	RegisterForSingleUpdate(update_interval)
EndEvent

Event OnUpdate()
	if MME_Status_Global.GetValue() != 1
		Debug.Messagebox("MilkModEconomy was not installed correctly, scripts are not running \n this can be false alarm when starting new game but if message keeps repeating, then something is wrong, script will retry check in 60 sec")
		Debug.Trace("MilkModEconomy MilkPlayerLoadGame.Maintenance() script has not set MME_Status_Global to 1, retry check in " + update_interval + " sec")
		MilkPluginsInfo()
		RegisterForSingleUpdate(update_interval)
	else
		Debug.Trace("MilkModEconomy Changed status to 0, shutting down")
		MME_Status_Global.SetValue(0)
	endif
EndEvent

Function MilkPluginsInfo()
	String msg = ""
	String Status = ""
	int i = 0
	String [] name = new string[10]
	Int[] value = new int[10]
	bool ErrorsFound = False

	;individual check to see if scripts working at all
	;stop quest
	;reset quest (so that scripts run OnInit() during quest start)
	;start quest (OnInit() sends StorageUtil values if script has launched)
	Quest.GetQuest("MME_SLA").stop()
	Quest.GetQuest("MME_SLA").reset()
	Quest.GetQuest("MME_SLA").start()
	Quest.GetQuest("MME_DDi").stop()
	Quest.GetQuest("MME_DDi").reset()
	Quest.GetQuest("MME_DDi").start()
	Quest.GetQuest("MME_zbf").stop()
	Quest.GetQuest("MME_zbf").reset()
	Quest.GetQuest("MME_zbf").start()
	Quest.GetQuest("MME_SLHP").stop()
	Quest.GetQuest("MME_SLHP").reset()
	Quest.GetQuest("MME_SLHP").start()
	Quest.GetQuest("MME_SLP").stop()
	Quest.GetQuest("MME_SLP").reset()
	Quest.GetQuest("MME_SLP").start()
	Quest.GetQuest("MME_PSQ").stop()
	Quest.GetQuest("MME_PSQ").reset()
	Quest.GetQuest("MME_PSQ").start()
	Quest.GetQuest("MME_SGO").stop()
	Quest.GetQuest("MME_SGO").reset()
	Quest.GetQuest("MME_SGO").start()
	; these scripts connect to MilkQ and will return error if MilkQ script is broken
	Quest.GetQuest("MME_ineed").stop()
	Quest.GetQuest("MME_ineed").reset()
	Quest.GetQuest("MME_ineed").start()
	Quest.GetQuest("MME_SOS").stop()
	Quest.GetQuest("MME_SOS").reset()
	Quest.GetQuest("MME_SOS").start()
	Quest.GetQuest("MME_UIE").stop()
	Quest.GetQuest("MME_UIE").reset()
	Quest.GetQuest("MME_UIE").start()
	utility.wait(1) ; wait for quests startup and do their OnInit()

	value[0] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.ddi")
	value[1] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.ineed")
	value[2] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.psq")
	value[3] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.sgo")
	value[4] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.sla")
	value[5] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.slhp")
	value[6] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.slp")
	value[7] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.sos")
	value[8] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.uie")
	value[9] = StorageUtil.GetIntValue(none,"MME.PluginsCheck.zbf")

	name[0] = "MME.PluginsCheck.ddi"
	name[1] = "MME.PluginsCheck.ineed"
	name[2] = "MME.PluginsCheck.psq"
	name[3] = "MME.PluginsCheck.sgo"
	name[4] = "MME.PluginsCheck.sla"
	name[5] = "MME.PluginsCheck.slhp"
	name[6] = "MME.PluginsCheck.slp"
	name[7] = "MME.PluginsCheck.sos"
	name[8] = "MME.PluginsCheck.uie"
	name[9] = "MME.PluginsCheck.zbf"

	msg = "Milk Mod Economy plugins check:\n"
	While i < name.Length
		if value[i] == 1
			Status = "off"
		elseif value[i] == 2
			Status = "on"
		else
			Status = "error"
			ErrorsFound = True
		endif

		msg = msg + ("Plugin: " + name[i] + " Status: " + Status + "\n")
		i += 1
	endwhile
	
	if ErrorsFound == True
		Debug.MessageBox(msg)
	endif
	
	;reset StorageUtil for next run
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.ddi")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.ineed")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.psq")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.sgo")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.sla")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.slhp")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.slp")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.sos")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.uie")
	StorageUtil.UnSetIntValue(none,"MME.PluginsCheck.zbf")
EndFunction
