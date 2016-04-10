scriptname MilkMCM extends SKI_ConfigBase
{MCM Menu script}

MilkQUEST Property MilkQ Auto
MilkECON Property MilkE Auto

int Settings_WeightUpScale_T
int Debug_MM_RemoveMaid_OID

;note to self max states is 128, use oids for spells

; DEBUG MILKMAID
int	Debug_MM_SP_Spell_T
int	Debug_MM_MP_Spell_T
int	Debug_MM_EX_Spell_T
int	Debug_MM_MEX_Spell_T
int	Debug_MM_MC_Spell_T
int	Debug_MM_LFx1_Spell_T
int	Debug_MM_LFx2_Spell_T
int	Debug_MM_LL_Spell_T
int	Debug_MM_UM1_Spell_T
int	Debug_MM_UM2_Spell_T
int	Debug_MM_UM3_Spell_T
int	Debug_MM_UM4_Spell_T
int	Debug_MM_UM5_Spell_T
int	Debug_MM_UM6_Spell_T
int	Debug_MM_UM7_Spell_T
int	Debug_MM_UM8_Spell_T
int	Debug_MM_UM9_Spell_T
int	Debug_MM_UM10_Spell_T
int	Debug_MM_UM11_Spell_T
int	Debug_MM_UM12_Spell_T
int	Debug_MM_UM13_Spell_T
int	Debug_MM_UM14_Spell_T
int	Debug_MM_UM15_Spell_T
int	Debug_MM_UM16_Spell_T
int	Debug_MM_UM17_Spell_T
int	Debug_MM_UM18_Spell_T
int	Debug_MM_UM19_Spell_T
int	Debug_MM_UM20_Spell_T
int	Debug_MM_UM21_Spell_T
int	Debug_MM_UM22_Spell_T
int	Debug_MM_UM23_Spell_T
int	Debug_MM_UM24_Spell_T
int	Debug_MM_UM25_Spell_T
int	Debug_MM_WM1_Spell_T
int	Debug_MM_WM2_Spell_T
int	Debug_MM_WM3_Spell_T
int	Debug_MM_WM4_Spell_T
int	Debug_MM_WM5_Spell_T
int	Debug_MM_WM6_Spell_T
int	Debug_MM_WM7_Spell_T
int	Debug_MM_WM8_Spell_T
int	Debug_MM_WM9_Spell_T
int	Debug_MM_WM10_Spell_T
int	Debug_MM_WM11_Spell_T
int	Debug_MM_WM12_Spell_T
int	Debug_MM_WM13_Spell_T
int	Debug_MM_WM14_Spell_T
int	Debug_MM_WM15_Spell_T
int	Debug_MM_WM16_Spell_T
int	Debug_MM_WM17_Spell_T
int	Debug_MM_WM18_Spell_T
int	Debug_MM_WM19_Spell_T
int	Debug_MM_WM20_Spell_T
int	Debug_MM_WM21_Spell_T
int	Debug_MM_WM22_Spell_T
int	Debug_MM_WM23_Spell_T
int	Debug_MM_WM24_Spell_T
int	Debug_MM_WM25_Spell_T

;Spells configuration
int Exhausion_Debuff_T
int Unmilked_DeBuffs_Skills_T
int Unmilked_DeBuffs_SPMP_T
int Unmilked_DeBuffs_SpeedStamina_T
int SkoomaLactacidEffect_T
int Milk_RaceEffect_T
int Milk_SkillsEffect_T
int Milk_LactacidEffect_T
int Milk_RNDEffect_T

;MCM Variables
string[] Preset
string[] Maidlist
Actor[] MaidlistA
string[] MaidlistMode
string[] ArmorSlotList
string[] Armorlist
String[] Slots
string[] RaceMilk
bool ResetMaids = false
bool MaidRemove = false
bool ResetVar = false
bool uninstall = false
int MaidlistModeIndex = 0
int PresetIndex = 1
int MaidIndex = 0
int ArmorlistIndex = 0
int ArmorSlotListIndex = 0

;----------------------------------------------------------------------------

event OnConfigInit()
    ModName = "Milk Mod"
	RefreshStrings()
endEvent

Function RefreshStrings()
	MaidIndex = 0
	ArmorlistIndex = 0
	ArmorSlotListIndex = 0

	Pages = new string[9]
	Pages[0] = "$MME_MENU_PAGE_Overview"
	Pages[1] = "$MME_MENU_PAGE_Settings"
	Pages[2] = "$MME_MENU_PAGE_Milking_Configuration"
	Pages[3] = "$MME_MENU_PAGE_Milk_Market_Information"
	Pages[4] = "$MME_MENU_PAGE_Debug"
	Pages[5] = "$MME_MENU_PAGE_Debug_Milk_Maid"
	Pages[6] = "$MME_MENU_PAGE_Compatibility_Check"
	Pages[7] = "$MME_MENU_PAGE_Spells_Configuration"
	Pages[8] = "$MME_MENU_PAGE_Armor_Management"
	
	Preset = new string[3]
	Preset[0] = "$MME_MENU_Preset_Hard"
	Preset[1] = "$MME_MENU_Preset_Normal"
	Preset[2] = "$MME_MENU_Preset_Easy"
	
	Armorlist = new string[4]
	Armorlist[0] = "--"
	Armorlist[1] = "Milking equipment"
	Armorlist[2] = "Basic living armor"
	Armorlist[3] = "Parasite living armor(EC+)"

	MaidlistMode = new string[2]
	MaidlistMode[0] = "Maids"
	MaidlistMode[1] = "Slaves"

	int i = 0
	Maidlist = new string[20]
	MaidlistA = new Actor[20]
	while i < MilkQ.MilkMaid.Length
		if MilkQ.MilkMaid[i] != None
			Maidlist[i] = MilkQ.MilkMaid[i].GetLeveledActorBase().GetName()
			MaidlistA[i] = MilkQ.MilkMaid[i]
			MaidIndex = i
		else
			Maidlist[i] = "--"
		endif
		i = i + 1
	endwhile
	
	RaceMilk = new string[12]
	RaceMilk[0] = "$MME_MENU_RaceMilk_Nothing"
	RaceMilk[1] = "$MME_MENU_RaceMilk_Altmer_Milk"
	RaceMilk[2] = "$MME_MENU_RaceMilk_Argonian_Milk"
	RaceMilk[3] = "$MME_MENU_RaceMilk_Bosmer_Milk"
	RaceMilk[4] = "$MME_MENU_RaceMilk_Breton_Milk"
	RaceMilk[5] = "$MME_MENU_RaceMilk_Dunmer_Milk"
	RaceMilk[6] = "$MME_MENU_RaceMilk_Imperial_Milk"
	RaceMilk[7] = "$MME_MENU_RaceMilk_Khajiit_Milk"
	RaceMilk[8] = "$MME_MENU_RaceMilk_Nord_Milk"
	RaceMilk[9] = "$MME_MENU_RaceMilk_Orc_Milk"
	RaceMilk[10] = "$MME_MENU_RaceMilk_Redguard_Milk"
	RaceMilk[11] = "$MME_MENU_RaceMilk_Exotic_Milk"		;Custom race
EndFunction

;PAGES
event OnPageReset(string page)
	if page == ""
		LoadCustomContent("MilkMod/MilkLogo.dds")
		RefreshStrings()
	else
		UnloadCustomContent()
	endif

	if page == "$MME_MENU_PAGE_Overview"
		Page_Overview()
	elseif page == "$MME_MENU_PAGE_Settings"
		Page_Settings()
	elseif page == "$MME_MENU_PAGE_Milking_Configuration"
		Page_Milking_Config()
	elseif page == "$MME_MENU_PAGE_Milk_Market_Information"
		Page_Market()
	elseif page == "$MME_MENU_PAGE_Debug"
		Page_Debug()
	elseif page == "$MME_MENU_PAGE_Debug_Milk_Maid"
		Page_MilkMaidDebug()
	elseif page == "$MME_MENU_PAGE_Compatibility_Check"
		Page_PluginChecks()
	elseif page == "$MME_MENU_PAGE_Spells_Configuration"
		Page_Spell_Constructor()
	elseif page == "$MME_MENU_PAGE_Armor_Management"
		Page_ArmorManagement()
	endif
endEvent

function ArmorRefresh()
		if Slots[2] != "" 
			if MilkQ.MilkingEquipment.find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.find(Slots[2]) == -1
				SetTextOptionValueST("$Add", false, "ArmorSupport_ArmorMode_Toggle")
			elseif MilkQ.MilkingEquipment.find(Slots[2]) == -1
				SetTextOptionValueST("$Remove", false, "ArmorSupport_ArmorMode_Toggle")
			elseif MilkQ.BasicLivingArmor.find(Slots[2]) == -1
				SetTextOptionValueST("$Remove", false, "ArmorSupport_ArmorMode_Toggle")
			elseif MilkQ.ParasiteLivingArmor.find(Slots[2]) == -1
				SetTextOptionValueST("$Remove", false, "ArmorSupport_ArmorMode_Toggle")
			endif
		endif
		
		SetTextOptionValueST(Armorlist[ArmorlistIndex], false, "ArmorSupport_PurgeList_Toggle")

		if ArmorlistIndex == 0
			SetTextOptionValueST("-", false, "ASA1")
			SetTextOptionValueST("-", false, "ASA2")
			SetTextOptionValueST("-", false, "ASA3")
			SetTextOptionValueST("-", false, "ASA4")
			SetTextOptionValueST("-", false, "ASA5")
			SetTextOptionValueST("-", false, "ASA6")
			SetTextOptionValueST("-", false, "ASA7")
			SetTextOptionValueST("-", false, "ASA8")
			SetTextOptionValueST("-", false, "ASA9")
			SetTextOptionValueST("-", false, "ASA10")
		elseif ArmorlistIndex == 1
			SetTextOptionValueST(MilkQ.MilkingEquipment[0], false, "ASA1")
			SetTextOptionValueST(MilkQ.MilkingEquipment[1], false, "ASA2")
			SetTextOptionValueST(MilkQ.MilkingEquipment[2], false, "ASA3")
			SetTextOptionValueST(MilkQ.MilkingEquipment[3], false, "ASA4")
			SetTextOptionValueST(MilkQ.MilkingEquipment[4], false, "ASA5")
			SetTextOptionValueST(MilkQ.MilkingEquipment[5], false, "ASA6")
			SetTextOptionValueST(MilkQ.MilkingEquipment[6], false, "ASA7")
			SetTextOptionValueST(MilkQ.MilkingEquipment[7], false, "ASA8")
			SetTextOptionValueST(MilkQ.MilkingEquipment[8], false, "ASA9")
			SetTextOptionValueST(MilkQ.MilkingEquipment[9], false, "ASA10")
		elseif ArmorlistIndex == 2
			SetTextOptionValueST(MilkQ.BasicLivingArmor[0], false, "ASA1")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[1], false, "ASA2")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[2], false, "ASA3")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[3], false, "ASA4")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[4], false, "ASA5")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[5], false, "ASA6")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[6], false, "ASA7")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[7], false, "ASA8")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[8], false, "ASA9")
			SetTextOptionValueST(MilkQ.BasicLivingArmor[9], false, "ASA10")
		elseif ArmorlistIndex == 3
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[0], false, "ASA1")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[1], false, "ASA2")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[2], false, "ASA3")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[3], false, "ASA4")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[4], false, "ASA5")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[5], false, "ASA6")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[6], false, "ASA7")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[7], false, "ASA8")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[8], false, "ASA9")
			SetTextOptionValueST(MilkQ.ParasiteLivingArmor[9], false, "ASA10")
		endif
endFunction

String[] function FindAllArmor()
	armor[] BipedSlotsFormArray = new armor[32]
	String[] BipedNameArray = new String[32]
	BipedSlotsFormArray[0] = MilkQ.PlayerREF.GetWornForm(1) as armor
	BipedSlotsFormArray[1] = MilkQ.PlayerREF.GetWornForm(2) as armor
	BipedSlotsFormArray[2] = MilkQ.PlayerREF.GetWornForm(4) as armor
	BipedSlotsFormArray[3] = MilkQ.PlayerREF.GetWornForm(8) as armor
	BipedSlotsFormArray[4] = MilkQ.PlayerREF.GetWornForm(16) as armor
	BipedSlotsFormArray[5] = MilkQ.PlayerREF.GetWornForm(32) as armor
	BipedSlotsFormArray[6] = MilkQ.PlayerREF.GetWornForm(64) as armor
	BipedSlotsFormArray[7] = MilkQ.PlayerREF.GetWornForm(128) as armor
	BipedSlotsFormArray[8] = MilkQ.PlayerREF.GetWornForm(256) as armor
	BipedSlotsFormArray[9] = MilkQ.PlayerREF.GetWornForm(512) as armor
	BipedSlotsFormArray[10] = MilkQ.PlayerREF.GetWornForm(1024) as armor
	BipedSlotsFormArray[11] = MilkQ.PlayerREF.GetWornForm(2048) as armor
	BipedSlotsFormArray[12] = MilkQ.PlayerREF.GetWornForm(4096) as armor
	BipedSlotsFormArray[13] = MilkQ.PlayerREF.GetWornForm(8192) as armor
	BipedSlotsFormArray[14] = MilkQ.PlayerREF.GetWornForm(16384) as armor
	BipedSlotsFormArray[15] = MilkQ.PlayerREF.GetWornForm(32768) as armor
	BipedSlotsFormArray[16] = MilkQ.PlayerREF.GetWornForm(65536) as armor
	BipedSlotsFormArray[17] = MilkQ.PlayerREF.GetWornForm(131072) as armor
	BipedSlotsFormArray[18] = MilkQ.PlayerREF.GetWornForm(262144) as armor
	BipedSlotsFormArray[19] = MilkQ.PlayerREF.GetWornForm(524288) as armor
	BipedSlotsFormArray[20] = MilkQ.PlayerREF.GetWornForm(1048576) as armor
	BipedSlotsFormArray[21] = MilkQ.PlayerREF.GetWornForm(2097152) as armor
	BipedSlotsFormArray[22] = MilkQ.PlayerREF.GetWornForm(4194304) as armor
	BipedSlotsFormArray[23] = MilkQ.PlayerREF.GetWornForm(8388608) as armor
	BipedSlotsFormArray[24] = MilkQ.PlayerREF.GetWornForm(16777216) as armor
	BipedSlotsFormArray[25] = MilkQ.PlayerREF.GetWornForm(33554432) as armor
	BipedSlotsFormArray[26] = MilkQ.PlayerREF.GetWornForm(67108864) as armor
	BipedSlotsFormArray[27] = MilkQ.PlayerREF.GetWornForm(134217728) as armor
	BipedSlotsFormArray[28] = MilkQ.PlayerREF.GetWornForm(268435456) as armor
	BipedSlotsFormArray[29] = MilkQ.PlayerREF.GetWornForm(536870912) as armor
	BipedSlotsFormArray[30] = MilkQ.PlayerREF.GetWornForm(1073741824) as armor
	BipedSlotsFormArray[31] = MilkQ.PlayerREF.GetWornForm(-2147483648) as armor
	Int iCount = 0
	while iCount <= 31
		if BipedSlotsFormArray[iCount]
			BipedNameArray[iCount] = BipedSlotsFormArray[iCount].getName()
		endIf
		iCount += 1
	endWhile
	return BipedNameArray
endFunction

function Page_Overview()
	Float MilkLevel = StorageUtil.GetFloatValue(none, "MME.Progression.Level", missing = 0)
	Float MaidLevel

	SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$MME_MENU_PAGE_Overview_Progression_Info_Header")
			AddTextOption("$MME_MENU_Maid_Mastery_Level", MilkLevel as int)
			if MilkLevel < 10
				AddTextOption("$MME_MENU_Times_Milked_(this_level)", StorageUtil.GetFloatValue(none, "MME.Progression.TimesMilked", missing = 0) as int)
			else
				AddTextOption("$MME_MENU_Times_Milked_(this_level)", "--")
			endif
			if MilkLevel < 10
				AddTextOption("$MME_MENU_Next_Level", ((MilkLevel as int + 1) * MilkQ.TimesMilkedMult as int) )
			else
				AddTextOption("$MME_MENU_Next_Level", "MAX")
			endif	
			AddTextOption("$MME_MENU_Times_Milked_(overall)", StorageUtil.GetFloatValue(none, "MME.Progression.TimesMilkedAll", missing = 0) as int)
			AddTextOption("$MME_MENU_Maid_Slots_Unlocked", MilkQ.Milklvl0fix())
	
	SetCursorPosition(1)
		AddHeaderOption("$MME_MENU_PAGE_Overview_Milk_Maids_Header")
			int i = 0
			While i < MilkQ.MilkMaid.Length
				if MilkQ.MilkMaid[i] != None
					MaidLevel = StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.Level", missing = 0)
					AddTextOption(MilkQ.MilkMaid[i].GetLeveledActorBase().GetName(), "")
					AddTextOption("$MME_MENU_PAGE_Overview_Milkmaid_Level" , MaidLevel as int)
					AddTextOption("$MME_MENU_PAGE_Overview_Milkmaid_Times_Milked_(to_level)" , StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.TimesMilked", missing = 0) as int + " (" + ((MaidLevel as int + 1) * MilkQ.TimesMilkedMult as int)+ ")")
					AddTextOption("$MME_MENU_PAGE_Overview_Milkmaid_Lactacid" , MilkQ.ReduceFloat(StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.LactacidCount", missing = 0)))
					AddTextOption("$MME_MENU_PAGE_Overview_Milkmaid_Milk" , MilkQ.ReduceFloat(StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.MilkCount", missing = 0)) + " [" + ((MaidLevel+2)*2) as int + "]")
					AddTextOption("$MME_MENU_PAGE_Overview_Milkmaid_Pain", MilkQ.NState(MilkQ.MilkMaid[i]) + " [" + ((StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.PainCount", missing = 0)/((MaidLevel+2)*2)*100) as int + "%]"))
					AddEmptyOption()
				endif
				i = i + 1
			endWhile
endfunction

function Page_Settings()
	SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$MME_MENU_PAGE_Settings_H1")
			if MilkQ.MilkFlag
				AddTextOptionST("Mod_Status_T", "$MME_MENU_PAGE_Settings_H1_S1", "$MME_MENU_Enabled")
			else
				AddTextOptionST("Mod_Status_T", "$MME_MENU_PAGE_Settings_H1_S1", "$MME_MENU_Disabled")
			endif
			if MilkQ.EconFlag
				AddTextOptionST("Econ_Status_T", "$MME_MENU_PAGE_Settings_Economy", "$MME_MENU_Enabled")
			else
				AddTextOptionST("Econ_Status_T", "$MME_MENU_PAGE_Settings_Economy", "$MME_MENU_Disabled")
			endif
			AddSliderOptionST("Poll_Interval_Slider", "$MME_MENU_PAGE_Settings_H1_S2.1", MilkQ.MilkPoll, "$MME_MENU_PAGE_Settings_H1_S2.2")
			AddToggleOptionST("MaidLvlCap_Toggle", "$MME_MENU_PAGE_Settings_H1_S5", MilkQ.MaidLvlCap)
			if MilkQ.MilkQC.Buffs
				AddTextOptionST("Buff_Toggle", "$MME_MENU_PAGE_Settings_H1_S6", "$MME_MENU_Enabled")
			else
				AddTextOptionST("Buff_Toggle", "$MME_MENU_PAGE_Settings_H1_S6", "$MME_MENU_Disabled")
			endif
			AddSliderOptionST("MilkGenerationValue_Slider", "$MME_MENU_PAGE_Settings_H1_S7", MilkQ.MilkGenValue, "$MME_MENU_PAGE_Settings_H1_S7.1")
			AddSliderOptionST("LactacidDecayRate_Slider", "$MME_MENU_PAGE_Settings_H1_S9", MilkQ.LactacidDecayRate, "{2}")
			;AddToggleOptionST("Settings_WeightUpScale_Toggle", "$MME_MENU_PAGE_Settings_H1_S8", MilkQ.WeightUpScale)

		AddHeaderOption("$MME_MENU_PAGE_Settings_H2")
			if MilkQ.BreastScale == 3
				AddTextOptionST("BreastScale_Toggle", "$MME_MENU_PAGE_Settings_H2_S6", "OFF")
			elseif MilkQ.BreastScale == 2
				AddTextOptionST("BreastScale_Toggle", "$MME_MENU_PAGE_Settings_H2_S6", "NetImmerse")
			elseif MilkQ.BreastScale == 0
				AddTextOptionST("BreastScale_Toggle", "$MME_MENU_PAGE_Settings_H2_S6", "NiOverride")
			endif
			AddToggleOptionST("BreastScaleLimit_Toggle", "$MME_MENU_PAGE_Settings_H2_S7", MilkQ.BreastScaleLimit)
			AddSliderOptionST("BreastScaleMax_Slider", "$MME_MENU_PAGE_Settings_H2_S1", MilkQ.BoobMAX, "{2}")
			AddSliderOptionST("BreastCurve_Slider", "$MME_MENU_PAGE_Settings_H2_S2", MilkQ.BreastCurve, "{2}")
			AddSliderOptionST("BreastIncrease_Slider", "$MME_MENU_PAGE_Settings_H2_S3", MilkQ.BoobIncr, "{2}")
			AddSliderOptionST("BreastIncreasePerLvl_Slider", "$MME_MENU_PAGE_Settings_H2_S4", MilkQ.BoobPerLvl, "{2}")
			AddToggleOptionST("BreastUpScale_Toggle", "$MME_MENU_PAGE_Settings_H2_S5", MilkQ.BreastUpScale)

		AddHeaderOption("$MME_MENU_PAGE_Settings_H3")
			AddToggleOptionST("Notification_Messages_Toggle", "$MME_MENU_PAGE_Settings_H3_S1", MilkQ.MilkMsgs)
			AddToggleOptionST("Milk_Count_Notification_Messages_Toggle", "$MME_MENU_PAGE_Settings_H3_S7", MilkQ.MilkCntMsgs)
			AddToggleOptionST("Notification_Economy_Messages_Toggle", "$MME_MENU_PAGE_Settings_H3_S6", MilkQ.MilkEMsgs)
			AddToggleOptionST("Milk_Stories_Toggle", "$MME_MENU_PAGE_Settings_H3_S2", MilkQ.MilkStory)
			AddSliderOptionST("NPCComments_Chance_Slider", "$MME_MENU_PAGE_Settings_H3_S3", MilkQ.MME_NPCComments.GetValue(), "{2}%")
			AddToggleOptionST("DialogueMilking_Toggle", "$MME_MENU_PAGE_Settings_H3_S4", MilkQ.MilkQC.MME_DialogueMilking)
			AddToggleOptionST("DialogueForceMilkSlave_Toggle", "$MME_MENU_PAGE_Settings_H3_S8", MilkQ.DialogueForceMilkSlave)
			AddKeyMapOptionST("Hotkey", "$MME_MENU_PAGE_Settings_H3_S5", MilkQ.NotificationKey)
			if MilkQ.HotkeyMode == 1
;				AddTextOptionST("Hotkey_Toggle", "$MME_MENU_PAGE_Settings_H3_S9", "UI extension")
			else
;				AddTextOptionST("Hotkey_Toggle", "$MME_MENU_PAGE_Settings_H3_S9", "Classic")
			endif
		
	SetCursorPosition(1)
		AddHeaderOption("$MME_MENU_PAGE_Settings_H4")
			AddMenuOptionST("Difficulty_Menu", "", Preset[PresetIndex])
			int i = 1
			while i <= 10
				AddTextOption("Times milked for level " + i + ":", i*MilkQ.TimesMilkedMult as int, OPTION_FLAG_DISABLED)	
				i = i +1
			endwhile
endfunction	

function Page_Milking_Config()
	SetCursorFillMode(TOP_TO_BOTTOM)
			AddToggleOptionST("SimpleMilk_Toggle", "$MME_MENU_PAGE_Milking_H3_S13", MilkQ.MilkQC.MME_SimpleMilkPotions)
			AddSliderOptionST("Milking_Duration_Slider", "$MME_MENU_PAGE_Milking_H3_S7.1", MilkQ.Milking_Duration, "$MME_MENU_PAGE_Milking_H3_S7.2")
			AddSliderOptionST("Milking_GushPct_Slider", "$MME_MENU_PAGE_Milking_H3_S16", MilkQ.GushPct, "{2}" + "%")
			if MilkQ.MilkNaked
				AddTextOptionST("Milking_MilkWithZaZMoMSuctionCups_Toggle", "$MME_MENU_PAGE_Milking_H3_S5", "$MME_MENU_PAGE_Milking_H3_S5.1")
			elseif MilkQ.MilkWithZaZMoMSuctionCups
				AddTextOptionST("Milking_MilkWithZaZMoMSuctionCups_Toggle", "$MME_MENU_PAGE_Milking_H3_S5", "$MME_MENU_PAGE_Milking_H3_S5.2")
			else
				AddTextOptionST("Milking_MilkWithZaZMoMSuctionCups_Toggle", "$MME_MENU_PAGE_Milking_H3_S5", "$MME_MENU_PAGE_Milking_H3_S5.3")
			endif
			AddToggleOptionST("Feeding_Toggle", "$MME_MENU_PAGE_Milking_H3_S8", MilkQ.Feeding)
			AddToggleOptionST("ForcedFeeding_Toggle", "$MME_MENU_PAGE_Milking_H3_S14", MilkQ.ForcedFeeding)
			AddSliderOptionST("Feeding_Duration_Slider", "$MME_MENU_PAGE_Milking_H3_S9.1", MilkQ.Feeding_Duration, "$MME_MENU_PAGE_Milking_H3_S9.2")
			if MilkQ.Feeding_Sound == 0
				AddTextOptionST("Feeding_Sound_Toggle", "$MME_MENU_PAGE_Milking_H3_S12", "$MME_MENU_PAGE_Milking_H3_S12.1")
			elseif MilkQ.Feeding_Sound == 1
				AddTextOptionST("Feeding_Sound_Toggle", "$MME_MENU_PAGE_Milking_H3_S12", "$MME_MENU_PAGE_Milking_H3_S12.2")
			elseif MilkQ.Feeding_Sound == 2
				AddTextOptionST("Feeding_Sound_Toggle", "$MME_MENU_PAGE_Milking_H3_S12", "$MME_MENU_PAGE_Milking_H3_S12.3")
			endif
			AddToggleOptionST("FuckMachine_Toggle", "$MME_MENU_PAGE_Milking_H3_S10", MilkQ.FuckMachine)
			AddSliderOptionST("FuckMachine_Duration_Slider", "$MME_MENU_PAGE_Milking_H3_S11.1", MilkQ.FuckMachine_Duration, "$MME_MENU_PAGE_Milking_H3_S11.2")

	SetCursorPosition(1)
			AddToggleOptionST("PainSystem_Toggle", "$MME_MENU_PAGE_Milking_Pain_System", MilkQ.PainSystem)
			AddToggleOptionST("PainHurts_Toggle", "$MME_MENU_PAGE_Milking_Pain_Hurts", MilkQ.PainKills)
			AddToggleOptionST("MilkingDrainsSP_Toggle", "$MME_MENU_PAGE_Milking_MilkingDrainsSP", MilkQ.MilkingDrainsSP)
			AddToggleOptionST("MilkingDrainsMP_Toggle", "$MME_MENU_PAGE_Milking_MilkingDrainsMP", MilkQ.MilkingDrainsMP)
			AddEmptyOption()

		AddHeaderOption("$MME_MENU_PAGE_Milking_EstrusChaurus_Header")
			AddToggleOptionST("ECTrigger_Toggle", "$MME_MENU_PAGE_Milking_EC_Event", MilkQ.ECTrigger)
			AddToggleOptionST("ECCrowdControl_Toggle", "$MME_MENU_PAGE_Milking_EC_CC", MilkQ.ECCrowdControl)
			AddSliderOptionST("ECRange_Slider", "$MME_MENU_PAGE_Milking_EC_Range", MilkQ.ECRange, "{0}")
endfunction	

function Page_Market()
	SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption(MilkQ.MilkE.locWhiterun.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoWhiterun, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandWhiterun], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption(MilkQ.MilkE.locMarkarth.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoMarkarth, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandMarkarth], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption(MilkQ.MilkE.locSolitude.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoSolitude, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandSolitude], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption(MilkQ.MilkE.locDawnstar.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoDawnstar, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandDawnstar], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption(MilkQ.MilkE.locWindhelm.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoWindhelm, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandWindhelm], OPTION_FLAG_DISABLED)

	SetCursorPosition(1)
		AddHeaderOption(MilkQ.MilkE.locRiften.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoRiften, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandRiften], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption(MilkQ.MilkE.locFalkreath.GetName())
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoFalkreath, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandFalkreath], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption("$MME_MENU_PAGE_Milk_Market_Information_Orcish_Strongholds")
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoOrc, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandOrc], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption("$MME_MENU_PAGE_Milk_Market_Information_Khajiit_Caravaneers")
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoCaravan, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandCaravan], OPTION_FLAG_DISABLED)
			AddEmptyOption()
		AddHeaderOption("$MME_MENU_PAGE_Milk_Market_Information_Solstheim")
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Market", MilkE.MilkEcoMorrowind, OPTION_FLAG_DISABLED)
			AddTextOption("$MME_MENU_PAGE_Milk_Market_Information_Demand", RaceMilk[MilkE.MilkDemandMorrowind], OPTION_FLAG_DISABLED)
endfunction

function Page_Debug()
	SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$MME_MENU_PAGE_Debug_H1")
			AddSliderOptionST("Debug_Mastery_Slider", "$MME_MENU_Maid_Mastery_Level", StorageUtil.GetFloatValue(none, "MME.Progression.Level", missing = 0))
			AddSliderOptionST("Debug_TimesMilked_Slider", "$MME_MENU_Times_Milked_(this_level)", StorageUtil.GetFloatValue(none, "MME.Progression.TimesMilked", missing = 0))
			AddSliderOptionST("Debug_TimesMilked_Overall_Slider", "$MME_MENU_Times_Milked_(overall)", StorageUtil.GetFloatValue(none, "MME.Progression.TimesMilkedAll", missing = 0))
			;AddToggleOptionST("Debug_Zaz_Milkpump_Toggle", "$MME_MENU_PAGE_Settings_H1_S11", MilkQ.ZazPumps)
			AddToggleOptionST("Debug_PC_Pregnancy_Toggle", "$MME_MENU_PAGE_Settings_H1_S10", MilkQ.PlayerCantBeMilkmaid)
			AddToggleOptionST("Debug_SexLab_Orgasm_Toggle", "$MME_MENU_PAGE_Settings_H1_S3", MilkQ.SexLabOrgasm)
			AddToggleOptionST("Debug_SexLab_3jBreastfeeding_Animation_Toggle", "$MME_MENU_PAGE_Settings_H1_S4", MilkQ.SexLab3jBreastfeeding)
			AddToggleOptionST("Debug_MilkLeak_Particles_Toggle", "$MME_MENU_PAGE_Debug_H1_S5", MilkQ.MilkLeakToggle)
			AddToggleOptionST("Debug_MilkLeak_Particles_Through_Clothes_Toggle", "$MME_MENU_PAGE_Debug_H1_S6", MilkQ.MilkLeakWearArm)
			AddToggleOptionST("Debug_MilkLeak_Textures_Toggle", "$MME_MENU_PAGE_Debug_H1_S7", MilkQ.MilkLeakTextures)
			
		AddHeaderOption("$MME_MENU_PAGE_Debug_H2")
			AddSliderOptionST("Debug_MilkProductionMod_Slider", "$MME_MENU_PAGE_Debug_H2_S1", MilkQ.MilkProdMod, "{0}%")
			AddSliderOptionST("Debug_MilkPriceMod_Slider", "$MME_MENU_PAGE_Debug_H2_S2", MilkQ.MilkPriceMod, "{0}")
			AddSliderOptionST("Debug_ExhaustionSleepMod_Slider", "$MME_MENU_PAGE_Debug_H2_S6", MilkQ.ExhaustionSleepMod, "{0}")
			AddToggleOptionST("Debug_FixedMilkGen_Toggle", "$MME_MENU_PAGE_Debug_H2_S3", MilkQ.FixedMilkGen)
			AddToggleOptionST("Debug_FixedMilkGen4Followers_Toggle", "$MME_MENU_PAGE_Debug_H2_S4", MilkQ.FixedMilkGen4Followers)
			AddToggleOptionST("Debug_CuirassSellsMilk_Toggle", "$MME_MENU_PAGE_Debug_H2_S5", MilkQ.CuirassSellsMilk)
			AddToggleOptionST("Debug_MilkAsMaidTimesMilked_Toggle", "$MME_MENU_PAGE_Debug_H2_S7", MilkQ.MilkAsMaidTimesMilked)

		AddHeaderOption("$MME_MENU_PAGE_Debug_Maintenance_Header")
			AddTextOptionST("Debug_ResetMaids_Toggle", "$MME_MENU_PAGE_Debug_H3_S1", "")
			AddTextOptionST("Debug_ResetSlaves_Toggle", "$MME_MENU_PAGE_Debug_H3_S4", "")
			AddTextOptionST("Debug_ResetVar_Toggle", "$MME_MENU_PAGE_Debug_H3_S2", "")
			AddTextOptionST("Debug_Uninstall_Toggle", "$MME_MENU_PAGE_Debug_H3_S3", "")

	SetCursorPosition(1)
		AddHeaderOption("$MME_MENU_PAGE_Debug_Spells_Management_Header")
			AddToggleOptionST("Debug_MilkSuccubusTransform_Toggle", "$MME_MENU_PAGE_Debug_H4_S1", MilkQ.MilkSuccubusTransform)
			AddToggleOptionST("Debug_MilkVampireTransform_Toggle", "$MME_MENU_PAGE_Debug_H4_S2", MilkQ.MilkVampireTransform)
			AddToggleOptionST("Debug_MilkWerewolfTransform_Toggle", "$MME_MENU_PAGE_Debug_H4_S3", MilkQ.MilkWerewolfTransform)
			AddToggleOptionST("Debug_MilkModToggle_Spell_Toggle", MilkQ.MilkModToggle.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MilkModToggle))
			AddToggleOptionST("Debug_MilkModInfo_Spell_Toggle", MilkQ.MilkModInfo.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MilkModInfo))
			AddToggleOptionST("Debug_MilkSelf_Spell_Toggle", MilkQ.MilkSelf.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MilkSelf))
			AddToggleOptionST("Debug_MilkTarget_Spell_Toggle", MilkQ.MilkTarget.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MilkTarget))
			AddToggleOptionST("Debug_MME_MakeMilkmaid_Spell_Toggle", MilkQ.MME_MakeMilkmaid_Spell.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_MakeMilkmaid_Spell))
			AddToggleOptionST("Debug_MME_MakeMilkslave_Spell_Toggle", MilkQ.MME_MakeMilkslave_Spell.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_MakeMilkslave_Spell))
			AddToggleOptionST("Debug_ArmorMnanagement_ME_Spell_Toggle", MilkQ.MME_AM_ME.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_ME))
			AddToggleOptionST("Debug_ArmorMnanagement_BLA_Spell_Toggle", MilkQ.MME_AM_BLA.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_BLA))
			AddToggleOptionST("Debug_ArmorMnanagement_PLA_Spell_Toggle", MilkQ.MME_AM_PLA.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_PLA))
			AddToggleOptionST("Debug_ArmorMnanagement_Purge_Spell_Toggle", MilkQ.MME_AM_Purge.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_Purge))
			AddToggleOptionST("Debug_Debug_Spell_Toggle", MilkQ.MME_DebugSpell.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_DebugSpell))
			AddToggleOptionST("Debug_ResetMaids_Spell_Toggle", MilkQ.MME_ResetMaids.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_ResetMaids))
			AddToggleOptionST("Debug_ResetMod_Spell_Toggle", MilkQ.MME_ResetMod.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_ResetMod))
			AddToggleOptionST("Debug_Uninstall_Spell_Toggle", MilkQ.MME_Uninstall.getname(), MilkQ.PlayerREF.HasSpell(MilkQ.MME_Uninstall))
endfunction	

function Page_MilkMaidDebug()
	Float MaidMilkGen = StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkGen", missing = 0)
	Float MaidLevel = StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.Level", missing = 0)
	Float MaidTimesMilked = StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.TimesMilked", missing = 0)
	Float MilkTick = (StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase", missing = 0) + MaidLevel*StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl", missing = MilkQ.BoobPerLvl) + MaidMilkGen)/3 * (1 + MilkQ.SLA.GetActorArousal(MaidlistA[MaidIndex])/100)

	SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$MME_MENU_PAGE_Debug_Milk_Maid")
			AddMenuOptionST("MaidlistMode_Menu", "List Selection", MaidlistMode[MaidlistModeIndex])
			AddMenuOptionST("Debug_Milk_Maid_Menu", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S2", Maidlist[MaidIndex])
			if MaidlistA[MaidIndex] != none
				AddTextOptionST("Debug_MM_MaidPregnancy", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S4", MilkQ.isPregnant(MaidlistA[MaidIndex]) as String, OPTION_FLAG_DISABLED)	
				AddTextOptionST("Debug_MM_MaidGender", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S5", MilkQ.akActorSex(MaidlistA[MaidIndex]) as String, OPTION_FLAG_DISABLED)	
				AddSliderOptionST("Debug_MM_MaidLevel_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S6", MaidLevel as int)
				AddSliderOptionST("Debug_MM_MaidTimesMilked_Slider", "$MME_MENU_Times_Milked_(this_level)", MaidTimesMilked as int)
				AddTextOptionST("Debug_MM_Maid_MilksToNextLevel", "$MME_MENU_Next_Level", ((MaidLevel+1) * MilkQ.TimesMilkedMult - MaidTimesMilked) as int, OPTION_FLAG_DISABLED)	
				AddSliderOptionST("Debug_MM_Maid_BreastRows_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S21", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastRows", missing = 1))	
				AddSliderOptionST("Debug_MM_Maid_BreastBaseSize_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S9", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase", missing = 1), "{2}")	
				AddSliderOptionST("Debug_MM_Maid_BreastBaseSizeModified_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S10", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBaseMod", missing = 0), "{2}")	
				AddSliderOptionST("Debug_MM_Maid_MaidBoobIncr_Slider", "$MME_MENU_PAGE_Settings_H2_S3", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobIncr", missing = 0), "{2}")	
				AddSliderOptionST("Debug_MM_Maid_MaidBoobPerLvl_Slider", "$MME_MENU_PAGE_Settings_H2_S4", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl", missing = 0), "{2}")	
				AddTextOptionST("Debug_MM_Maid_BreastEffectiveSize", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S11", MilkQ.ReduceFloat(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase", missing = 0) + StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBaseMod", missing = 0) + (StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkCount", missing = 0) * StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobIncr", missing = MilkQ.BoobIncr)) + (MaidLevel + (MaidTimesMilked / ((MaidLevel + 1) * MilkQ.TimesMilkedMult))) * StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl", missing = MilkQ.BoobPerLvl)), OPTION_FLAG_DISABLED)	
				AddSliderOptionST("Debug_MM_LactacidCount_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S12", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.LactacidCount", missing = 0), "{2}")
				AddSliderOptionST("Debug_MM_MilkCount_Slider", "Milk [Max =" + ((MaidLevel+2)*2) as int + "]:", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkCount", missing = 0), "{2}")
				AddSliderOptionST("Debug_MM_MilkGeneration_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S13", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkGen", missing = 0)/3/10, "{2}")
				AddTextOptionST("Debug_MM_Maid_Lactacid_Milk_Production_PH", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S15", MilkQ.ReduceFloat(MilkTick * MilkQ.MilkProdMod/100), OPTION_FLAG_DISABLED)	
				AddTextOptionST("Debug_MM_Maid_Lactacid_Milk_Production_PP", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S16", MilkQ.ReduceFloat(MilkTick * MilkQ.MilkProdMod/100 * MilkQ.MilkPoll), OPTION_FLAG_DISABLED)	
				AddSliderOptionST("Debug_MM_PainCount_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S17", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.PainCount", missing = 0), "{2}")
				AddTextOptionST("Debug_MM_Maid_Pain_Reduction_PH", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S18",  MilkQ.ReduceFloat((MilkTick + ((MaidLevel+2)*2)/10) * MilkQ.MilkProdMod/100), OPTION_FLAG_DISABLED)	
				AddTextOptionST("Debug_MM_Maid_Pain_Reduction_PP", "$MME_MENU_PAGE_Debug_Milk_Maid_H1_S19",  MilkQ.ReduceFloat((MilkTick + ((MaidLevel+2)*2)/10) * MilkQ.MilkProdMod/100 * MilkQ.MilkPoll), OPTION_FLAG_DISABLED)	

				AddSliderOptionST("Debug_MM_MaidContainerCum_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_ContainerCum", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerCumsSUM"))
				AddSliderOptionST("Debug_MM_MaidContainerMilk_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_ContainerMilk", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerMilksSUM"))
				AddSliderOptionST("Debug_MM_MaidContainerLactacid_Slider", "$MME_MENU_PAGE_Debug_Milk_Maid_ContainerLactacid", StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerLactacid"))
				if StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode", missing = 0) == 0
					AddTextOptionST("Debug_MM_Maid_MilkingMode", "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode", "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode.0")
				elseif StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode") == 1
					AddTextOptionST("Debug_MM_Maid_MilkingMode", "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode", "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode.1")
				elseif StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode") == 2
					AddTextOptionST("Debug_MM_Maid_MilkingMode", "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode", "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode.2")
				endif	
				AddToggleOptionST("Debug_MM_Maid_IsSlave", "$MME_MENU_PAGE_Debug_Milk_Maid_IsSlave", StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSlave"))
				AddToggleOptionST("Debug_MM_Maid_IsVampire", "$MME_MENU_PAGE_Debug_Milk_Maid_IsVampire", StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsVampire"))
				AddToggleOptionST("Debug_MM_Maid_IsWerewolf", "$MME_MENU_PAGE_Debug_Milk_Maid_IsWerewolf", StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsWerewolf"))
				AddToggleOptionST("Debug_MM_Maid_IsSuccubus", "$MME_MENU_PAGE_Debug_Milk_Maid_IsSuccubus", StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSuccubus"))
				AddEmptyOption()
				Debug_MM_RemoveMaid_OID = AddToggleOption("$MME_MENU_PAGE_Debug_Milk_Maid_H1_S20", MaidRemove)
			endif
	
	SetCursorPosition(1)
		AddHeaderOption("$MME_MENU_PAGE_Debug_Milk_Maid_Effects_Header")
			if MaidlistA[MaidIndex] != none
				Debug_MM_SP_Spell_T = AddToggleOption(MilkQ.MilkForSprigganPassive.getname(), MaidlistA[MaidIndex].HasSpell(MilkQ.MilkForSprigganPassive))
				Debug_MM_MP_Spell_T = AddToggleOption(MilkQ.BeingMilkedPassive.getname() + " (Hidden in UI)", MaidlistA[MaidIndex].HasSpell(MilkQ.BeingMilkedPassive))
				Debug_MM_EX_Spell_T = AddToggleOption(MilkQ.MilkExhaustion.getname(), MaidlistA[MaidIndex].HasSpell(MilkQ.MilkExhaustion))
				Debug_MM_MEX_Spell_T = AddToggleOption(MilkQ.MilkMentalExhaustion.getname(), MaidlistA[MaidIndex].HasSpell(MilkQ.MilkMentalExhaustion))
				Debug_MM_MC_Spell_T = AddToggleOption(MilkQ.MilkCritical.getname(), MaidlistA[MaidIndex].HasSpell(MilkQ.MilkCritical))
				Debug_MM_LFx1_Spell_T = AddToggleOption(MilkQ.MilkFx1.getname() + " (Hidden in UI)", MaidlistA[MaidIndex].HasSpell(MilkQ.MilkFx1))
				Debug_MM_LFx2_Spell_T = AddToggleOption(MilkQ.MilkFx2.getname() + " (Hidden in UI)", MaidlistA[MaidIndex].HasSpell(MilkQ.MilkFx2))
				Debug_MM_LL_Spell_T = AddToggleOption(MilkQ.MilkLeak.getname() + " (Hidden in UI)", MaidlistA[MaidIndex].HasSpell(MilkQ.MilkLeak))
				Debug_MM_UM1_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[0].getname() + " L1", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[0]))
				Debug_MM_UM2_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[1].getname() + " L2", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[1]))
				Debug_MM_UM3_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[2].getname() + " L3", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[2]))
				Debug_MM_UM4_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[3].getname() + " L4", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[3]))
				Debug_MM_UM5_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[4].getname() + " L5", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[4]))
				Debug_MM_UM6_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[5].getname() + " L6", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[5]))
				Debug_MM_UM7_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[6].getname() + " L7", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[6]))
				Debug_MM_UM8_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[7].getname() + " L8", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[7]))
				Debug_MM_UM9_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[8].getname() + " L9", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[8]))
				Debug_MM_UM10_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[9].getname() + " L10", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[9]))
				Debug_MM_UM11_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[10].getname() + " L11", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[10]))
				Debug_MM_UM12_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[11].getname() + " L12", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[11]))
				Debug_MM_UM13_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[12].getname() + " L13", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[12]))
				Debug_MM_UM14_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[13].getname() + " L14", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[13]))
				Debug_MM_UM15_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[14].getname() + " L15", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[14]))
				Debug_MM_UM16_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[15].getname() + " L16", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[15]))
				Debug_MM_UM17_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[16].getname() + " L17", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[16]))
				Debug_MM_UM18_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[17].getname() + " L18", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[17]))
				Debug_MM_UM19_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[18].getname() + " L19", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[18]))
				Debug_MM_UM20_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[19].getname() + " L20", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[19]))
				Debug_MM_UM21_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[20].getname() + " L21", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[20]))
				Debug_MM_UM22_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[21].getname() + " L22", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[21]))
				Debug_MM_UM23_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[22].getname() + " L23", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[22]))
				Debug_MM_UM24_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[23].getname() + " L24", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[23]))
				Debug_MM_UM25_Spell_T = AddToggleOption(MilkQ.UnmilkedArray[24].getname() + " L25", MaidlistA[MaidIndex].HasSpell(MilkQ.UnmilkedArray[24]))
				Debug_MM_WM1_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[0].getname() + " L1", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[0]))
				Debug_MM_WM2_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[1].getname() + " L2", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[1]))
				Debug_MM_WM3_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[2].getname() + " L3", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[2]))
				Debug_MM_WM4_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[3].getname() + " L4", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[3]))
				Debug_MM_WM5_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[4].getname() + " L5", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[4]))
				Debug_MM_WM6_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[5].getname() + " L6", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[5]))
				Debug_MM_WM7_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[6].getname() + " L7", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[6]))
				Debug_MM_WM8_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[7].getname() + " L8", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[7]))
				Debug_MM_WM9_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[8].getname() + " L9", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[8]))
				Debug_MM_WM10_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[9].getname() + " L10", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[9]))
				Debug_MM_WM11_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[10].getname() + " L11", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[10]))
				Debug_MM_WM12_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[11].getname() + " L12", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[11]))
				Debug_MM_WM13_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[12].getname() + " L13", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[12]))
				Debug_MM_WM14_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[13].getname() + " L14", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[13]))
				Debug_MM_WM15_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[14].getname() + " L15", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[14]))
				Debug_MM_WM16_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[15].getname() + " L16", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[15]))
				Debug_MM_WM17_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[16].getname() + " L17", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[16]))
				Debug_MM_WM18_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[17].getname() + " L18", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[17]))
				Debug_MM_WM19_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[18].getname() + " L19", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[18]))
				Debug_MM_WM20_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[19].getname() + " L20", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[19]))
				Debug_MM_WM21_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[20].getname() + " L21", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[20]))
				Debug_MM_WM22_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[21].getname() + " L22", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[21]))
				Debug_MM_WM23_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[22].getname() + " L23", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[22]))
				Debug_MM_WM24_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[23].getname() + " L24", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[23]))
				Debug_MM_WM25_Spell_T = AddToggleOption(MilkQ.WellMilkedArray[24].getname() + " L25", MaidlistA[MaidIndex].HasSpell(MilkQ.WellMilkedArray[24]))
			endif
endfunction	

function Page_PluginChecks()
	SetCursorFillMode(TOP_TO_BOTTOM)
		AddTextOption("DLC HearthFires", MilkQ.Plugin_HearthFires, OPTION_FLAG_DISABLED)
		AddTextOption("	locHeljarchenHall", MilkQ.MilkE.locHeljarchenHall.getname(), OPTION_FLAG_DISABLED)
		AddTextOption("	locWindstadManor", MilkQ.MilkE.locWindstadManor.getname(), OPTION_FLAG_DISABLED)
		AddTextOption("	locLakeviewManor", MilkQ.MilkE.locLakeviewManor.getname(), OPTION_FLAG_DISABLED)
		AddEmptyOption()

		AddTextOption("DLC Dawnguard", MilkQ.Plugin_Dawnguard, OPTION_FLAG_DISABLED)
		AddTextOption("	locFortDawnguard", MilkQ.MilkE.locFortDawnguard.getname(), OPTION_FLAG_DISABLED)
		AddTextOption("	locDayspringCanyon", MilkQ.MilkE.locDayspringCanyon.getname(), OPTION_FLAG_DISABLED)
		AddEmptyOption()
		
		AddTextOption("DLC Dragonborn", MilkQ.Plugin_Dragonborn, OPTION_FLAG_DISABLED)
		AddTextOption("	locRavenRock", MilkQ.MilkE.locRavenRock.getname(), OPTION_FLAG_DISABLED)
		AddTextOption("	locSkaalVillage", MilkQ.MilkE.locSkaalVillage.getname(), OPTION_FLAG_DISABLED)
		AddTextOption("	locTelMithryn", MilkQ.MilkE.locTelMithryn.getname(), OPTION_FLAG_DISABLED)
		AddEmptyOption()
		
		AddTextOption("SexLab Aroused", MilkQ.Plugin_SLA, OPTION_FLAG_DISABLED)
		AddTextOption("*SLA Integration Script", MilkQ.SLA.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddEmptyOption()

		AddTextOption("ZaZAnimationPack", true, OPTION_FLAG_DISABLED)
		AddTextOption("	zbfWornGag", (Game.GetFormFromFile(0x8a4d , "ZaZAnimationPack.esm") as Keyword).GetString(), OPTION_FLAG_DISABLED)
		AddTextOption("*zbf Integration Script", MilkQ.zbf.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddEmptyOption()

		AddTextOption("Devious Devices - Integration", MilkQ.Plugin_DDI, OPTION_FLAG_DISABLED)
		AddTextOption("*DDi Integration Script", MilkQ.DDi.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddEmptyOption()
			
		AddTextOption("SexLab-StoriesDevious", MilkQ.Plugin_SLSD, OPTION_FLAG_DISABLED)
			if MilkQ.Plugin_SLSD
				AddTextOption("	_SLSD_CowHarness", (Game.GetFormFromFile(0x4395 , "SexLab-StoriesDevious.esp") as Keyword).GetString(), OPTION_FLAG_DISABLED)
				AddTextOption("	_SLSD_CowMilker", (Game.GetFormFromFile(0x18D18 , "SexLab-StoriesDevious.esp") as Keyword).GetString(), OPTION_FLAG_DISABLED)
			endif
		AddTextOption("*SLSD Integration Script", MilkQ.SLSD.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddEmptyOption()

		AddTextOption("*UIE Integration Script", MilkQ.UIE.IsIntegraged(), OPTION_FLAG_DISABLED)

	SetCursorPosition(1)
		AddTextOption("iNeed", MilkQ.Plugin_iNeed, OPTION_FLAG_DISABLED)
		AddTextOption("*iNeed Integration Script", MilkQ.ineed.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddTextOption("RealisticNeedsandDiseases", MilkQ.Plugin_RealisticNeedsandDiseases, OPTION_FLAG_DISABLED)
		AddTextOption("SexLabSkoomaWhore", MilkQ.Plugin_SlSW, OPTION_FLAG_DISABLED)
		AddEmptyOption()

		AddTextOption("Schlongs of Skyrim", MilkQ.Plugin_SOS, OPTION_FLAG_DISABLED)
		AddTextOption("Schlongs of Skyrim - UNP", MilkQ.Plugin_SOS_UNP, OPTION_FLAG_DISABLED)
		AddTextOption("SOS Equipable Schlong", MilkQ.Plugin_SOS_EQUIP, OPTION_FLAG_DISABLED)
			if MilkQ.Plugin_SOS_EQUIP
				AddTextOption("	SOS Equipable Schlong", (Game.GetFormFromFile(0xD62, "SOS Equipable Schlong.esp") as Armor).GetName(), OPTION_FLAG_DISABLED)
			endif
		AddTextOption("*SOS Integration Script", MilkQ.SOS.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddEmptyOption()
		
		AddTextOption("PSQ PlayerSuccubusQuest", MilkQ.Plugin_PSQ, OPTION_FLAG_DISABLED)
			if MilkQ.Plugin_PSQ
				AddTextOption("	SuccubusEnergy", (Game.GetFormFromFile(0x1d89, "PSQ PlayerSuccubusQuest.esm") as GlobalVariable).GetValue(), OPTION_FLAG_DISABLED)
				AddTextOption("	PlayerIsSuccubus", (Game.GetFormFromFile(0x2850, "PSQ PlayerSuccubusQuest.esm") as GlobalVariable).GetValue(), OPTION_FLAG_DISABLED)
				AddTextOption("	FemaleSchlong", (Game.GetFormFromFile(0x6460, "PSQ PlayerSuccubusQuest.esm") as Armor).GetName(), OPTION_FLAG_DISABLED)
			endif
		AddTextOption("*PSQ Integration Script", MilkQ.PSQ.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddTextOption("HentaiPregnancy", MilkQ.Plugin_HentaiPregnancy, OPTION_FLAG_DISABLED)
		AddTextOption("*HP Integration Script", MilkQ.SLHP.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddTextOption("SexLabProcreation", MilkQ.Plugin_SexLabProcreation, OPTION_FLAG_DISABLED)
		AddTextOption("*SLP Integration Script", MilkQ.SLP.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddTextOption("*SGO3 Integration Script", MilkQ.SGO.IsIntegraged(), OPTION_FLAG_DISABLED)
		AddTextOption("EstrusChaurus", MilkQ.Plugin_EstrusChaurus, OPTION_FLAG_DISABLED)
			if MilkQ.Plugin_EstrusChaurus
				AddTextOption("	ChaurusBreeder", (Game.GetFormFromFile(0x19121, "EstrusChaurus.esp") as Spell).GetName(), OPTION_FLAG_DISABLED)
			endif
		AddTextOption("EstrusSpider", MilkQ.Plugin_EstrusSpider, OPTION_FLAG_DISABLED)
			if MilkQ.Plugin_EstrusChaurus
				AddTextOption("	SpiderBreeder", (Game.GetFormFromFile(0x4e255, "EstrusSpider.esp") as Spell).GetName(), OPTION_FLAG_DISABLED)
			endif
		AddTextOption("BeeingFemale", MilkQ.Plugin_BeeingFemale, OPTION_FLAG_DISABLED)
			if MilkQ.Plugin_BeeingFemale
				AddTextOption("	_BFStatePregnant", (Game.GetFormFromFile(0x28a0, "BeeingFemale.esm") as Spell).GetName(), OPTION_FLAG_DISABLED)
			endif
		AddEmptyOption()

endfunction

function Page_Spell_Constructor()
	SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Milk effects configuration")
			Milk_RaceEffect_T = AddToggleOption("$Milk_RaceEffect", MilkQ.MilkQC.Milk_RaceEffect)
			Milk_SkillsEffect_T = AddToggleOption("$Milk_SkillsEffect", MilkQ.MilkQC.Milk_SkillsEffect)
			Milk_LactacidEffect_T = AddToggleOption("$Milk_LactacidEffect", MilkQ.MilkQC.Milk_LactacidEffect)
			Milk_RNDEffect_T = AddToggleOption("$Milk_RNDEffect", MilkQ.MilkQC.Milk_RNDEffect)

	SetCursorPosition(1)
		AddHeaderOption("Debuff effects configuration")
			if MilkQ.MilkQC.ExhaustionMode == 300
				Exhausion_Debuff_T = AddTextOption("$Exhausion_Debuff timer", "5 min")
			else
				Exhausion_Debuff_T = AddTextOption("$Exhausion_Debuff timer", "1 day")
			endif
			Unmilked_DeBuffs_Skills_T = AddToggleOption("$Unmilked_DeBuffs_Skills", MilkQ.MilkQC.Unmilked_DeBuffs_Skills)
			Unmilked_DeBuffs_SPMP_T = AddToggleOption("$Unmilked_DeBuffs_SPMP", MilkQ.MilkQC.Unmilked_DeBuffs_SPMP)
			Unmilked_DeBuffs_SpeedStamina_T = AddToggleOption("$Unmilked_DeBuffs_SpeedStamina", MilkQ.MilkQC.Unmilked_DeBuffs_SpeedStamina)
	
		AddEmptyOption()
			SkoomaLactacidEffect_T = AddToggleOption("$DisableLactacidSkoomaEffect", MilkQ.DisableSkoomaLactacid)
endfunction

function Page_ArmorManagement()
	Slots = new String[32]
	Slots = self.FindAllArmor()
	self.SetCursorFillMode(self.TOP_TO_BOTTOM)
	self.SetCursorPosition(0)
	self.AddHeaderOption("Body Slots: Items", 0)
;	self.AddTextOption("Slot 30 - Head", Slots[0], 0)
;	self.AddTextOption("Slot 31 - Hair", Slots[1], 0)
	self.AddTextOption("Slot 32 - Body", Slots[2], 0)
;	self.AddTextOption("Slot 33 - Hands", Slots[3], 0)
;	self.AddTextOption("Slot 34 - Forearms", Slots[4], 0)
;	self.AddTextOption("Slot 35 - Amulet", Slots[5], 0)
;	self.AddTextOption("Slot 36 - Ring", Slots[6], 0)
;	self.AddTextOption("Slot 37 - Feet", Slots[7], 0)
;	self.AddTextOption("Slot 38 - Calves", Slots[8], 0)
;	self.AddTextOption("Slot 39 - Shield", Slots[9], 0)
;	self.AddTextOption("Slot 40 - Tail", Slots[10], 0)
;	self.AddTextOption("Slot 41 - Long Hair", Slots[11], 0)
;	self.AddTextOption("Slot 42 - Circlet", Slots[12], 0)
;	self.AddTextOption("Slot 43 - Ears", Slots[13], 0)
;	self.AddTextOption("Slot 44 - Face/Mouth", Slots[14], 0)
;	self.AddTextOption("Slot 45 - Neck", Slots[15], 0)
;	self.AddTextOption("Slot 46 - Chest", Slots[16], 0)
;	self.AddTextOption("Slot 47 - Back", Slots[17], 0)
;	self.AddTextOption("Slot 48 - Misc/FX", Slots[18], 0)
;	self.AddTextOption("Slot 49 - Pelvis Primary", Slots[19], 0)
;	self.AddTextOption("Slot 50 - Decapitated Head", Slots[20], 0)
;	self.AddTextOption("Slot 51 - Decapitate", Slots[21], 0)
;	self.AddTextOption("Slot 52 - Pelvis Secondary", Slots[22], 0)
;	self.AddTextOption("Slot 53 - Leg Primary", Slots[23], 0)
;	self.AddTextOption("Slot 54 - Leg Secondary", Slots[24], 0)
;	self.AddTextOption("Slot 55 - Face Jewelry", Slots[25], 0)
;	self.AddTextOption("Slot 56 - Chest Secondary", Slots[26], 0)
;	self.AddTextOption("Slot 57 - Shoulder", Slots[27], 0)
;	self.AddTextOption("Slot 58 - Arm Secondary", Slots[28], 0)
;	self.AddTextOption("Slot 59 - Arm Primary", Slots[29], 0)
;	self.AddTextOption("Slot 60 - Misc/FX", Slots[30], 0)
;	self.AddTextOption("Slot 61 - FX01", Slots[31], 0)
	self.SetCursorPosition(1)

	AddMenuOptionST("ArmorSupport_Armorlist_Menu", "Armor list", Armorlist[ArmorlistIndex])
	if Slots[2] != "" 
		if MilkQ.MilkingEquipment.find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.find(Slots[2]) == -1
			AddTextOptionST("ArmorSupport_ArmorMode_Toggle", "", "$Add")
		elseif MilkQ.MilkingEquipment.find(Slots[2]) == -1
			AddTextOptionST("ArmorSupport_ArmorMode_Toggle", "", "$Remove")
		elseif MilkQ.BasicLivingArmor.find(Slots[2]) == -1
			AddTextOptionST("ArmorSupport_ArmorMode_Toggle", "", "$Remove")
		elseif MilkQ.ParasiteLivingArmor.find(Slots[2]) == -1
			AddTextOptionST("ArmorSupport_ArmorMode_Toggle", "", "$Remove")
		endif
	endif
	
	AddTextOptionST("ArmorSupport_PurgeList_Toggle", "ERASE LIST", Armorlist[ArmorlistIndex])
	AddEmptyOption()
	
	AddHeaderOption("Added armors:", 0)
		AddTextOptionST("ASA1", "1", "")
		AddTextOptionST("ASA2", "2", "")
		AddTextOptionST("ASA3", "3", "")
		AddTextOptionST("ASA4", "4", "")
		AddTextOptionST("ASA5", "5", "")
		AddTextOptionST("ASA6", "6", "")
		AddTextOptionST("ASA7", "7", "")
		AddTextOptionST("ASA8", "8", "")
		AddTextOptionST("ASA9", "9", "")
		AddTextOptionST("ASA10", "10", "")
	
	ArmorRefresh()
endfunction

event OnOptionHighlight(int option)
	if option == Settings_WeightUpScale_T
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S8_Higlight")
	endif
endevent

event OnOptionSelect(int option)
	if option == Settings_WeightUpScale_T
		if !MilkQ.WeightUpScale
			MilkQ.WeightUpScale = true
			SetToggleOptionValue(Settings_WeightUpScale_T, true)
		else
			int i = 0
				while i < MilkQ.MilkMaid.Length
					if MilkQ.MilkMaid[i] != None
						Float NeckDelta = (MilkQ.MILKmaid[i].GetActorBase().GetWeight() / 100) - (StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.WeightBase") / 100)
						MilkQ.MILKmaid[i].GetActorBase().SetWeight(StorageUtil.GetFloatValue(MilkQ.MILKmaid[i],"MME.MilkMaid.WeightBase"))
						MilkQ.MILKmaid[i].UpdateWeight(NeckDelta)
					endif
				i = i + 1
			endwhile
			MilkQ.BreastUpScale = false
			SetToggleOptionValue(Settings_WeightUpScale_T, false)
		endif
	elseif option == Debug_MM_RemoveMaid_OID
			MilkQ.MCMMaidReset(MaidlistModeIndex,MaidIndex)
			SetToggleOptionValue(Debug_MM_RemoveMaid_OID, true)
			MaidRemove = false
	elseif option == Debug_MM_SP_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkForSprigganPassive )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkForSprigganPassive )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkForSprigganPassive )
		endif
			SetToggleOptionValue(Debug_MM_SP_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkForSprigganPassive ))
	elseif option == Debug_MM_MP_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.BeingMilkedPassive )
			MaidlistA[MaidIndex].AddSpell( MilkQ.BeingMilkedPassive )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.BeingMilkedPassive )
		endif
			SetToggleOptionValue(Debug_MM_MP_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.BeingMilkedPassive ))
	elseif option == Debug_MM_EX_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkExhaustion )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkExhaustion )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkExhaustion )
		endif
			SetToggleOptionValue(Debug_MM_EX_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkExhaustion ))
	elseif option == Debug_MM_MEX_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkMentalExhaustion )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkMentalExhaustion )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkMentalExhaustion )
		endif
			SetToggleOptionValue(Debug_MM_MEX_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkMentalExhaustion ))
	elseif option == Debug_MM_MC_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkCritical )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkCritical )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkCritical )
		endif
			SetToggleOptionValue(Debug_MM_MC_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkCritical ))
	elseif option == Debug_MM_LFx1_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkFx1 )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkFx1 )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkFx1 )
		endif
			SetToggleOptionValue(Debug_MM_LFx1_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkFx1 ))
	elseif option == Debug_MM_LFx2_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkFx2 )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkFx2 )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkFx2 )
		endif
			SetToggleOptionValue(Debug_MM_LFx2_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkFx2 ))
	elseif option == Debug_MM_LL_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.MilkLeak )
			MaidlistA[MaidIndex].AddSpell( MilkQ.MilkLeak )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.MilkLeak )
		endif
			SetToggleOptionValue(Debug_MM_LL_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.MilkLeak ))
	elseif option == Debug_MM_UM1_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[0] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[0] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[0] )
		endif
			SetToggleOptionValue(Debug_MM_UM1_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[0] ))
	elseif option == Debug_MM_UM2_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[1] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[1] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[1] )
		endif
			SetToggleOptionValue(Debug_MM_UM2_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[1] ))
	elseif option == Debug_MM_UM3_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[2] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[2] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[2] )
		endif
			SetToggleOptionValue(Debug_MM_UM3_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[2] ))
	elseif option == Debug_MM_UM4_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[3] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[3] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[3] )
		endif
			SetToggleOptionValue(Debug_MM_UM4_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[3] ))
	elseif option == Debug_MM_UM5_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[4] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[4] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[4] )
		endif
			SetToggleOptionValue(Debug_MM_UM5_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[4] ))
	elseif option == Debug_MM_UM6_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[5] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[5] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[5] )
		endif
			SetToggleOptionValue(Debug_MM_UM6_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[5] ))
	elseif option == Debug_MM_UM7_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[6] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[6] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[6] )
		endif
			SetToggleOptionValue(Debug_MM_UM7_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[6] ))
	elseif option == Debug_MM_UM8_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[7] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[7] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[7] )
		endif
			SetToggleOptionValue(Debug_MM_UM8_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[7] ))
	elseif option == Debug_MM_UM9_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[8] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[8] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[8] )
		endif
			SetToggleOptionValue(Debug_MM_UM9_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[8] ))
	elseif option == Debug_MM_UM10_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[9] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[9] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[9] )
		endif
			SetToggleOptionValue(Debug_MM_UM10_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[9] ))
	elseif option == Debug_MM_UM11_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[10] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[10] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[10] )
		endif
			SetToggleOptionValue(Debug_MM_UM11_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[10] ))
	elseif option == Debug_MM_UM12_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[11] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[11] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[11] )
		endif
			SetToggleOptionValue(Debug_MM_UM12_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[11] ))
	elseif option == Debug_MM_UM13_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[12] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[12] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[12] )
		endif
			SetToggleOptionValue(Debug_MM_UM13_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[12] ))
	elseif option == Debug_MM_UM14_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[13] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[13] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[13] )
		endif
			SetToggleOptionValue(Debug_MM_UM14_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[13] ))
	elseif option == Debug_MM_UM15_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[14] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[14] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[14] )
		endif
			SetToggleOptionValue(Debug_MM_UM15_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[14] ))
	elseif option == Debug_MM_UM16_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[15] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[15] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[15] )
		endif
			SetToggleOptionValue(Debug_MM_UM16_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[15] ))
	elseif option == Debug_MM_UM17_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[16] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[16] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[16] )
		endif
			SetToggleOptionValue(Debug_MM_UM17_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[16] ))
	elseif option == Debug_MM_UM18_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[17] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[17] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[17] )
		endif
			SetToggleOptionValue(Debug_MM_UM18_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[17] ))
	elseif option == Debug_MM_UM19_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[18] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[18] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[18] )
		endif
			SetToggleOptionValue(Debug_MM_UM19_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[18] ))
	elseif option == Debug_MM_UM20_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[19] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[19] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[19] )
		endif
			SetToggleOptionValue(Debug_MM_UM20_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[19] ))
	elseif option == Debug_MM_UM21_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[20] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[20] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[20] )
		endif
			SetToggleOptionValue(Debug_MM_UM21_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[20] ))
	elseif option == Debug_MM_UM22_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[21] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[21] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[21] )
		endif
			SetToggleOptionValue(Debug_MM_UM22_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[21] ))
	elseif option == Debug_MM_UM23_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[22] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[22] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[22] )
		endif
			SetToggleOptionValue(Debug_MM_UM23_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[22] ))
	elseif option == Debug_MM_UM24_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[23] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[23] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[23] )
		endif
			SetToggleOptionValue(Debug_MM_UM24_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[23] ))
	elseif option == Debug_MM_UM25_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[24] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.UnmilkedArray[24] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.UnmilkedArray[24] )
		endif
			SetToggleOptionValue(Debug_MM_UM25_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.UnmilkedArray[24] ))
	elseif option == Debug_MM_WM1_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[0] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[0] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[0] )
		endif
			SetToggleOptionValue(Debug_MM_WM1_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[0] ))
	elseif option == Debug_MM_WM2_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[1] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[1] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[1] )
		endif
			SetToggleOptionValue(Debug_MM_WM2_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[1] ))
	elseif option == Debug_MM_WM3_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[2] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[2] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[2] )
		endif
			SetToggleOptionValue(Debug_MM_WM3_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[2] ))
	elseif option == Debug_MM_WM4_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[3] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[3] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[3] )
		endif
			SetToggleOptionValue(Debug_MM_WM4_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[3] ))
	elseif option == Debug_MM_WM5_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[4] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[4] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[4] )
		endif
			SetToggleOptionValue(Debug_MM_WM5_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[4] ))
	elseif option == Debug_MM_WM6_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[5] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[5] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[5] )
		endif
			SetToggleOptionValue(Debug_MM_WM6_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[5] ))
	elseif option == Debug_MM_WM7_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[6] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[6] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[6] )
		endif
			SetToggleOptionValue(Debug_MM_WM7_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[6] ))
	elseif option == Debug_MM_WM8_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[7] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[7] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[7] )
		endif
			SetToggleOptionValue(Debug_MM_WM8_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[7] ))
	elseif option == Debug_MM_WM9_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[8] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[8] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[8] )
		endif
			SetToggleOptionValue(Debug_MM_WM9_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[8] ))
	elseif option == Debug_MM_WM10_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[9] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[9] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[9] )
		endif
			SetToggleOptionValue(Debug_MM_WM10_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[9] ))
	elseif option == Debug_MM_WM11_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[10] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[10] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[10] )
		endif
			SetToggleOptionValue(Debug_MM_WM11_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[10] ))
	elseif option == Debug_MM_WM12_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[11] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[11] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[11] )
		endif
			SetToggleOptionValue(Debug_MM_WM12_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[11] ))
	elseif option == Debug_MM_WM13_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[12] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[12] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[12] )
		endif
			SetToggleOptionValue(Debug_MM_WM13_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[12] ))
	elseif option == Debug_MM_WM14_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[13] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[13] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[13] )
		endif
			SetToggleOptionValue(Debug_MM_WM14_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[13] ))
	elseif option == Debug_MM_WM15_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[14] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[14] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[14] )
		endif
			SetToggleOptionValue(Debug_MM_WM15_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[14] ))
	elseif option == Debug_MM_WM16_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[15] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[15] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[15] )
		endif
			SetToggleOptionValue(Debug_MM_WM16_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[15] ))
	elseif option == Debug_MM_WM17_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[16] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[16] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[16] )
		endif
			SetToggleOptionValue(Debug_MM_WM17_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[16] ))
	elseif option == Debug_MM_WM18_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[17] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[17] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[17] )
		endif
			SetToggleOptionValue(Debug_MM_WM18_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[17] ))
	elseif option == Debug_MM_WM19_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[18] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[18] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[18] )
		endif
			SetToggleOptionValue(Debug_MM_WM19_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[18] ))
	elseif option == Debug_MM_WM20_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[19] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[19] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[19] )
		endif
			SetToggleOptionValue(Debug_MM_WM20_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[19] ))
	elseif option == Debug_MM_WM21_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[20] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[20] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[20] )
		endif
			SetToggleOptionValue(Debug_MM_WM21_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[20] ))
	elseif option == Debug_MM_WM22_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[21] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[21] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[21] )
		endif
			SetToggleOptionValue(Debug_MM_WM22_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[21] ))
	elseif option == Debug_MM_WM23_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[22] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[22] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[22] )
		endif
			SetToggleOptionValue(Debug_MM_WM23_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[22] ))
	elseif option == Debug_MM_WM24_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[23] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[23] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[23] )
		endif
			SetToggleOptionValue(Debug_MM_WM24_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[23] ))
	elseif option == Debug_MM_WM25_Spell_T
		if !MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[24] )
			MaidlistA[MaidIndex].AddSpell( MilkQ.WellMilkedArray[24] )
		else
			MaidlistA[MaidIndex].RemoveSpell( MilkQ.WellMilkedArray[24] )
		endif
			SetToggleOptionValue(Debug_MM_WM25_Spell_T, MaidlistA[MaidIndex].HasSpell( MilkQ.WellMilkedArray[24] ))
	elseif option == Milk_RaceEffect_T
		if !MilkQ.MilkQC.Milk_RaceEffect
			MilkQ.MilkQC.Milk_RaceEffect = true
		else
			MilkQ.MilkQC.Milk_RaceEffect = false
		endif
			SetToggleOptionValue(Milk_RaceEffect_T, MilkQ.MilkQC.Milk_RaceEffect)
	elseif option == Milk_SkillsEffect_T
		if !MilkQ.MilkQC.Milk_SkillsEffect
			MilkQ.MilkQC.Milk_SkillsEffect = true
		else
			MilkQ.MilkQC.Milk_SkillsEffect = false
		endif
			SetToggleOptionValue(Milk_SkillsEffect_T, MilkQ.MilkQC.Milk_SkillsEffect)
	elseif option == Milk_LactacidEffect_T
		if !MilkQ.MilkQC.Milk_LactacidEffect
			MilkQ.MilkQC.Milk_LactacidEffect = true
		else
			MilkQ.MilkQC.Milk_LactacidEffect = false
		endif
			SetToggleOptionValue(Milk_LactacidEffect_T, MilkQ.MilkQC.Milk_LactacidEffect)
	elseif option == Milk_RNDEffect_T
		if !MilkQ.MilkQC.Milk_RNDEffect
			MilkQ.MilkQC.Milk_RNDEffect = true
		else
			MilkQ.MilkQC.Milk_RNDEffect = false
		endif
			SetToggleOptionValue(Milk_RNDEffect_T, MilkQ.MilkQC.Milk_RNDEffect)
	elseif option == Exhausion_Debuff_T
		if !MilkQ.MilkQC.ExhaustionMode == 300
			MilkQ.MilkQC.ExhaustionMode = 0
			SetTextOptionValue(Exhausion_Debuff_T, "1 day")
		else
			MilkQ.MilkQC.ExhaustionMode = 300
			SetTextOptionValue(Exhausion_Debuff_T, "5 min")
		endif
	elseif option == Unmilked_DeBuffs_Skills_T
		if !MilkQ.MilkQC.Unmilked_DeBuffs_Skills
			MilkQ.MilkQC.Unmilked_DeBuffs_Skills = true
		else
			MilkQ.MilkQC.Unmilked_DeBuffs_Skills = false
		endif
			SetToggleOptionValue(Unmilked_DeBuffs_Skills_T, MilkQ.MilkQC.Unmilked_DeBuffs_Skills)
	elseif option == Unmilked_DeBuffs_SPMP_T
		if !MilkQ.MilkQC.Unmilked_DeBuffs_SPMP
			MilkQ.MilkQC.Unmilked_DeBuffs_SPMP = true
		else
			MilkQ.MilkQC.Unmilked_DeBuffs_SPMP = false
		endif
			SetToggleOptionValue(Unmilked_DeBuffs_SPMP_T, MilkQ.MilkQC.Unmilked_DeBuffs_SPMP)
	elseif option == Unmilked_DeBuffs_SpeedStamina_T
		if !MilkQ.MilkQC.Unmilked_DeBuffs_SpeedStamina
			MilkQ.MilkQC.Unmilked_DeBuffs_SpeedStamina = true
		else
			MilkQ.MilkQC.Unmilked_DeBuffs_SpeedStamina = false
		endif
			SetToggleOptionValue(Unmilked_DeBuffs_SpeedStamina_T, MilkQ.MilkQC.Unmilked_DeBuffs_SpeedStamina)
			
	elseif option == SkoomaLactacidEffect_T
		if !MilkQ.DisableSkoomaLactacid
			MilkQ.DisableSkoomaLactacid = true
		else
			MilkQ.DisableSkoomaLactacid = false
		endif
			SetToggleOptionValue(SkoomaLactacidEffect_T, MilkQ.DisableSkoomaLactacid)
	endif
endevent

state ArmorSupport_ArmorMode_Toggle
	event OnSelectST()
		string toggleVal
		If Slots[2] != "" 
			If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
				MilkQ.Armor_Purge()
			EndIf
		
			if ArmorlistIndex == 1
				if MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1
					MilkQ.MilkingEquipment[MilkQ.MilkingEquipment.Find("Empty")] = Slots[2]
				elseif MilkQ.MilkingEquipment.Find(Slots[2]) != -1
					MilkQ.MilkingEquipment[MilkQ.MilkingEquipment.Find(Slots[2])] = "Empty"
				endif
				
			elseif ArmorlistIndex == 2
				if MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1
					MilkQ.BasicLivingArmor[MilkQ.BasicLivingArmor.Find("Empty")] = Slots[2]
				elseif MilkQ.BasicLivingArmor.Find(Slots[2]) != -1
					MilkQ.BasicLivingArmor[MilkQ.BasicLivingArmor.Find(Slots[2])] = "Empty"
				endif

			elseif ArmorlistIndex == 3
				if MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1
					MilkQ.ParasiteLivingArmor[MilkQ.ParasiteLivingArmor.Find("Empty")] = Slots[2]
				elseif MilkQ.ParasiteLivingArmor.Find(Slots[2]) != -1
					MilkQ.ParasiteLivingArmor[MilkQ.ParasiteLivingArmor.Find(Slots[2])] = "Empty"
				endif
			endif
		endif
		ArmorRefresh()
	endEvent
endState

state ArmorSupport_PurgeList_Toggle
	event OnSelectST()
		string toggleVal

		int i = 0
		if ArmorlistIndex == 0
			MilkQ.Armor_Purge()
		elseif ArmorlistIndex == 1
			MilkQ.MilkingEquipment = new string[10]
			while ( i < MilkQ.MilkingEquipment.Length )
				MilkQ.MilkingEquipment[i] = "Empty"
				i = i + 1
			endWhile
		elseif ArmorlistIndex == 2
			MilkQ.BasicLivingArmor = new string[10]
			while ( i < MilkQ.BasicLivingArmor.Length )
				MilkQ.BasicLivingArmor[i] = "Empty"
				i = i + 1
			endWhile
		elseif ArmorlistIndex == 3
			MilkQ.ParasiteLivingArmor = new string[10]
			while ( i < MilkQ.ParasiteLivingArmor.Length )
				MilkQ.ParasiteLivingArmor[i] = "Empty"
				i = i + 1
			endWhile
		endif
		toggleVal = Armorlist[ArmorlistIndex] as string + " ERASED"
		SetTextOptionValueST(toggleVal)
		Utility.WaitMenuMode(1)
		ArmorRefresh()
	endEvent
	
	event OnHighlightST()
		SetInfoText(" -- ERASES ALL LISTS")
	endEvent
endState

state Mod_Status_T
	event OnSelectST()
		string toggleVal

		if !MilkQ.MilkFlag
			toggleVal = "$MME_MENU_Enabled"
		else
			toggleVal = "$MME_MENU_Disabled"
		endif
		MilkQ.Modtoggle()
		SetTextOptionValueST(toggleVal)
	endEvent
endState

state Econ_Status_T
	event OnSelectST()
		string toggleVal

		if !MilkQ.EconFlag
			toggleVal = "$MME_MENU_Enabled"
			MilkQ.EconFlag = true
			MilkQ.MilkE.RegisterForSingleUpdateGameTime (1)
		else
			toggleVal = "$MME_MENU_Disabled"
			MilkQ.EconFlag = false
			MilkQ.MilkE.RegisterForSingleUpdateGameTime (1)
		endif
		SetTextOptionValueST(toggleVal)
	endEvent
endState

state Debug_Zaz_Milkpump_Toggle
	event OnSelectST()
		if !MilkQ.ZazPumps
			MilkQ.ZazPumps = true
		else
			MilkQ.ZazPumps = false
		endif
		SetToggleOptionValueST(MilkQ.ZazPumps)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S11_Higlight")
	endEvent
endState

state Debug_PC_Pregnancy_Toggle
	event OnSelectST()
		if !MilkQ.PlayerCantBeMilkmaid
			MilkQ.PlayerCantBeMilkmaid = true
		else
			MilkQ.PlayerCantBeMilkmaid = false
		endif
		SetToggleOptionValueST(MilkQ.PlayerCantBeMilkmaid)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S10_Higlight")
	endEvent
endState

state Debug_SexLab_3jBreastfeeding_Animation_Toggle
	event OnSelectST()
		if !MilkQ.SexLab3jBreastfeeding
			MilkQ.SexLab3jBreastfeeding = true
		else
			MilkQ.SexLab3jBreastfeeding = false
		endif
		SetToggleOptionValueST(MilkQ.SexLab3jBreastfeeding)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S4_Higlight")
	endEvent
endState

state Debug_SexLab_Orgasm_Toggle
	event OnSelectST()
		if !MilkQ.SexLabOrgasm
			MilkQ.SexLabOrgasm = true
		else
			MilkQ.SexLabOrgasm = false
		endif
		SetToggleOptionValueST(MilkQ.SexLabOrgasm)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S3_Higlight")
	endEvent
endState

state MaidLvlCap_Toggle
	event OnSelectST()
		if !MilkQ.MaidLvlCap
			MilkQ.MaidLvlCap = true
		else
			MilkQ.MaidLvlCap = false
		endif
		SetToggleOptionValueST(MilkQ.MaidLvlCap)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S5_Higlight")
	endEvent
endState


state BreastScale_Toggle
	event OnSelectST()
		string toggleVal
		if MilkQ.BreastScale == 2 
			MilkQ.BreastScale = 3
			toggleVal = "Off"
		elseif MilkQ.BreastScale != 0 && SKSE.GetPluginVersion("NiOverride") >= 3 && NiOverride.GetScriptVersion() >= 2
			MilkQ.BreastScale = 0
			toggleVal = "NiOverride"
		else
			MilkQ.BreastScale = 2
			toggleVal = "NetImmerse"
		endif
		
		Actor akActor
		int i
		i = 0
		while i < MilkQ.MilkMaid.Length
			if MilkQ.MilkMaid[i] != None
				akActor = MilkQ.MilkMaid[i]
				If SKSE.GetPluginVersion("NiOverride") >= 3 && NiOverride.GetScriptVersion() >= 2 && MilkQ.BreastScale != 0
					Float BreastBase = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastBase", missing = MilkQ.GetNodeScale(akActor, "NPC L Breast"))
						MilkQ.SetNodeScale(akActor, "NPC L Breast", 1)
						MilkQ.SetNodeScale(akActor, "NPC R Breast", 1)
					; Curve fix
						MilkQ.SetNodeScale(akActor, "NPC L Breast01", 1)
						MilkQ.SetNodeScale(akActor, "NPC R Breast01", 1)
				endif
				MilkQ.CurrentSize(akActor)
			endif
			i = i + 1
		endwhile
		
		i = 0
		while i < MilkQ.MILKSlave.Length
			if MilkQ.MILKSlave[i] != None
				akActor = MilkQ.MILKSlave[i]
				If SKSE.GetPluginVersion("NiOverride") >= 3 && NiOverride.GetScriptVersion() >= 2 && MilkQ.BreastScale != 0
					Float BreastBase = StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastBase", missing = MilkQ.GetNodeScale(akActor, "NPC L Breast"))
						MilkQ.SetNodeScale(akActor, "NPC L Breast", 1)
						MilkQ.SetNodeScale(akActor, "NPC R Breast", 1)
					; Curve fix
						MilkQ.SetNodeScale(akActor, "NPC L Breast01", 1)
						MilkQ.SetNodeScale(akActor, "NPC R Breast01", 1)
				endif
				MilkQ.CurrentSize(akActor)
			endif
			i = i + 1
		endwhile
		SetTextOptionValueST(toggleVal)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S6_Higlight")
	endEvent
endState

state Hotkey_Toggle
	event OnSelectST()
		string toggleVal
		if MilkQ.HotkeyMode == 1 
			MilkQ.HotkeyMode = 0
			toggleVal = "Classic"
		else
			MilkQ.BreastScale = 1
			toggleVal = "UI extension"
		endif
		SetTextOptionValueST(toggleVal)
	endEvent
endState

state BreastScaleLimit_Toggle
	event OnSelectST()
		if !MilkQ.BreastScaleLimit
			MilkQ.BreastScaleLimit = true
		else
			MilkQ.BreastScaleLimit = false
		endif
		SetToggleOptionValueST(MilkQ.BreastScaleLimit)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S7_Higlight")
	endEvent
endState

state BreastUpScale_Toggle
	event OnSelectST()
		if !MilkQ.BreastUpScale
			MilkQ.BreastUpScale = true
		else
			MilkQ.BreastUpScale = false
		endif
		SetToggleOptionValueST(MilkQ.BreastUpScale)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S5_Higlight")
	endEvent
endState

state Notification_Messages_Toggle
	event OnSelectST()
		if !MilkQ.MilkMsgs
			MilkQ.MilkMsgs = true
		else
			MilkQ.MilkMsgs = false
		endif
		SetToggleOptionValueST(MilkQ.MilkMsgs)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S1_Higlight")
	endEvent
endState

state Milk_Count_Notification_Messages_Toggle
	event OnSelectST()
		if !MilkQ.MilkCntMsgs
			MilkQ.MilkCntMsgs = true
		else
			MilkQ.MilkCntMsgs = false
		endif
		SetToggleOptionValueST(MilkQ.MilkCntMsgs)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S7_Higlight")
	endEvent
endState

state Notification_Economy_Messages_Toggle
	event OnSelectST()
		if !MilkQ.MilkEMsgs
			MilkQ.MilkEMsgs = true
		else
			MilkQ.MilkEMsgs = false
		endif
		SetToggleOptionValueST(MilkQ.MilkEMsgs)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S6_Higlight")
	endEvent
endState

state Milk_Stories_Toggle
	event OnSelectST()
		if !MilkQ.MilkStory
			MilkQ.MilkStory = true
		else
			MilkQ.MilkStory = false
		endif
		SetToggleOptionValueST(MilkQ.MilkStory)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S2_Higlight")
	endEvent
endState

state DialogueMilking_Toggle
	event OnSelectST()
		if !MilkQ.MilkQC.MME_DialogueMilking
			MilkQ.MilkQC.MME_DialogueMilking = True
		else
			MilkQ.MilkQC.MME_DialogueMilking = False
		endif
		SetToggleOptionValueST(MilkQ.MilkQC.MME_DialogueMilking)
	endEvent
endState

state DialogueForceMilkSlave_Toggle
	event OnSelectST()
		if !MilkQ.DialogueForceMilkSlave
			MilkQ.DialogueForceMilkSlave = True
		else
			MilkQ.DialogueForceMilkSlave = False
		endif
		SetToggleOptionValueST(MilkQ.DialogueForceMilkSlave)
	endEvent
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S8_Higlight")
	endEvent
endState

state Buff_Toggle
	event OnSelectST()
		string toggleVal
		int i = 0
		if !MilkQ.MilkQC.Buffs
			MilkQ.MilkQC.Buffs = true
			toggleVal = "$MME_MENU_Enabled"
		else
			MilkQ.MilkQC.Buffs = false
			toggleVal = "$MME_MENU_Disabled"
		endif
		while i < MilkQ.MilkMaid.Length
			if MilkQ.MilkMaid[i] != None
				MilkQ.PostMilk(MilkQ.MilkMaid[i])
			endif
			i = i + 1
		endwhile
		SetTextOptionValueST(toggleVal)
	endEvent
endState

state Debug_MilkLeak_Particles_Toggle
	event OnSelectST()
		if !MilkQ.MilkLeakToggle
			MilkQ.MilkLeakToggle = true
		else
			MilkQ.MilkLeakToggle = false
		endif
		SetToggleOptionValueST(MilkQ.MilkLeakToggle)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H1_S5_Higlight")
	endEvent
endState

state Debug_MilkLeak_Particles_Through_Clothes_Toggle
	event OnSelectST()
		if !MilkQ.MilkLeakWearArm
			MilkQ.MilkLeakWearArm = true
		else
			MilkQ.MilkLeakWearArm = false
		endif
		SetToggleOptionValueST(MilkQ.MilkLeakWearArm)
	endEvent
endState

state Debug_MilkLeak_Textures_Toggle
	event OnSelectST()
		if !MilkQ.MilkLeakTextures
			MilkQ.MilkLeakTextures = true
		else
			MilkQ.MilkLeakTextures = false
		endif
		SetToggleOptionValueST(MilkQ.MilkLeakTextures)
	endEvent
endState
		
state Debug_FixedMilkGen_Toggle
	event OnSelectST()
		if !MilkQ.FixedMilkGen
			MilkQ.FixedMilkGen = true
		else
			MilkQ.FixedMilkGen = false
		endif
		SetToggleOptionValueST(MilkQ.FixedMilkGen)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H2_S3_Higlight")
	endEvent
endState

state Debug_FixedMilkGen4Followers_Toggle
	event OnSelectST()
		if !MilkQ.FixedMilkGen4Followers
			MilkQ.FixedMilkGen4Followers = true
		else
			MilkQ.FixedMilkGen4Followers = false
		endif
		SetToggleOptionValueST(MilkQ.FixedMilkGen4Followers)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H2_S4_Higlight")
	endEvent
endState

state Debug_CuirassSellsMilk_Toggle
	event OnSelectST()
		if !MilkQ.CuirassSellsMilk
			MilkQ.CuirassSellsMilk = true
		else
			MilkQ.CuirassSellsMilk = false
		endif
		SetToggleOptionValueST(MilkQ.CuirassSellsMilk)
	endEvent
endState

state Debug_MilkAsMaidTimesMilked_Toggle
	event OnSelectST()
		if !MilkQ.MilkAsMaidTimesMilked
			MilkQ.MilkAsMaidTimesMilked = true
		else
			MilkQ.MilkAsMaidTimesMilked = false
		endif
		SetToggleOptionValueST(MilkQ.MilkAsMaidTimesMilked)
	endEvent
endState

state Debug_ResetMaids_Toggle
	event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED, true, "Debug_ResetMaids_Toggle")
		MilkQ.MaidReset()
	endEvent
endState

state Debug_ResetSlaves_Toggle
	event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED, true, "Debug_ResetSlaves_Toggle")
		MilkQ.SlaveReset()
	endEvent
	event OnHighlightST()
		SetInfoText("Milk salves are added by other mods, you probably should not reset this.")
	endEvent
endState

state Debug_ResetVar_Toggle
	event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED, true, "Debug_ResetVar_Toggle")
		MilkQ.VarSetup()
	endEvent
endState

state Debug_Uninstall_Toggle
	event OnSelectST()
		SetOptionFlagsST(OPTION_FLAG_DISABLED, true, "Debug_Uninstall_Toggle")
		MilkQ.UNINSTALL()
	endEvent
endState

state Debug_MilkSuccubusTransform_Toggle
	event OnSelectST()
		if !MilkQ.MilkSuccubusTransform
			MilkQ.MilkSuccubusTransform = true
		else
			MilkQ.MilkSuccubusTransform = false
		endif
		SetToggleOptionValueST(MilkQ.MilkSuccubusTransform)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H4_S1_Higlight")
	endEvent
endState

state Debug_MilkVampireTransform_Toggle
	event OnSelectST()
		if !MilkQ.MilkVampireTransform
			MilkQ.MilkVampireTransform = true
		else
			MilkQ.MilkVampireTransform = false
		endif
		SetToggleOptionValueST(MilkQ.MilkVampireTransform)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H4_S2_Higlight")
	endEvent
endState

state Debug_MilkWerewolfTransform_Toggle
	event OnSelectST()
		if !MilkQ.MilkWerewolfTransform
			MilkQ.MilkWerewolfTransform = true
		else
			MilkQ.MilkWerewolfTransform = false
		endif
		SetToggleOptionValueST(MilkQ.MilkWerewolfTransform)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H4_S3_Higlight")
	endEvent
endState

state Debug_MilkModToggle_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MilkModToggle)
			MilkQ.PlayerREF.AddSpell(MilkQ.MilkModToggle)
		else
			MilkQ.PlayerREF.RemoveSpell( MilkQ.MilkModToggle )
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MilkModToggle))
	endEvent
endState
		
state Debug_MilkModInfo_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MilkModInfo)
			MilkQ.PlayerREF.AddSpell(MilkQ.MilkModInfo)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MilkModInfo)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MilkModInfo))
	endEvent
endState

state Debug_MilkSelf_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MilkSelf)
			MilkQ.PlayerREF.AddSpell(MilkQ.MilkSelf)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MilkSelf)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MilkSelf))
	endEvent
endState

state Debug_MilkTarget_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MilkTarget)
			MilkQ.PlayerREF.AddSpell(MilkQ.MilkTarget)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MilkTarget)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MilkTarget))
	endEvent
endState

state Debug_ResetMaids_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_ResetMaids)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_ResetMaids)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_ResetMaids)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_ResetMaids))
	endEvent
endState

state Debug_ResetMod_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_ResetMod)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_ResetMod)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_ResetMod)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_ResetMod))
	endEvent
endState

state Debug_Uninstall_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_Uninstall)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_Uninstall)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_Uninstall)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_Uninstall))
	endEvent
endState

state Debug_MM_Maid_IsSlave
	event OnSelectST()
		if StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSlave") == 0
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSlave", 1)
		else
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSlave", 0)
		endif
		SetToggleOptionValueST(StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSlave"))
	endEvent
endState

state Debug_MM_Maid_IsVampire
	event OnSelectST()
		if StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsVampire") == 0
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsVampire", 1)
		else
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsVampire", 0)
		endif
		SetToggleOptionValueST(StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsVampire"))
	endEvent
endState

state Debug_MM_Maid_IsWerewolf
	event OnSelectST()
		if StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsWerewolf") == 0
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsWerewolf", 1)
		else
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsWerewolf", 0)
		endif
		SetToggleOptionValueST(StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsWerewolf"))
	endEvent
endState

state Debug_MM_Maid_IsSuccubus
	event OnSelectST()
		if StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSuccubus") == 0
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSuccubus", 1)
		else
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSuccubus", 0)
		endif
		SetToggleOptionValueST(StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.IsSuccubus"))
	endEvent
endState

state Debug_Debug_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_DebugSpell)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_DebugSpell)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_DebugSpell)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_DebugSpell))
	endEvent
endState

state Debug_MME_MakeMilkmaid_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_MakeMilkmaid_Spell)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_MakeMilkmaid_Spell)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_MakeMilkmaid_Spell)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_MakeMilkmaid_Spell))
	endEvent
endState

state Debug_MME_MakeMilkslave_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_MakeMilkslave_Spell)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_MakeMilkslave_Spell)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_MakeMilkslave_Spell)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_MakeMilkslave_Spell))
	endEvent
endState

state Debug_ArmorMnanagement_ME_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_ME)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_AM_ME)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_AM_ME)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_ME))
	endEvent
endState

state Debug_ArmorMnanagement_BLA_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_BLA)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_AM_BLA)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_AM_BLA)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_BLA))
	endEvent
endState

state Debug_ArmorMnanagement_PLA_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_PLA)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_AM_PLA)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_AM_PLA)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_PLA))
	endEvent
endState

state Debug_ArmorMnanagement_Purge_Spell_Toggle
	event OnSelectST()
		if !MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_Purge)
			MilkQ.PlayerREF.AddSpell(MilkQ.MME_AM_Purge)
		else
			MilkQ.PlayerREF.RemoveSpell(MilkQ.MME_AM_Purge)
		endif
		SetToggleOptionValueST(MilkQ.PlayerREF.HasSpell(MilkQ.MME_AM_Purge))
	endEvent
endState

state ASA1
	event OnSelectST()
		int i = 0
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA2
	event OnSelectST()
		int i = 1
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA3
	event OnSelectST()
		int i = 2
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA4
	event OnSelectST()
		int i = 3
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA5
	event OnSelectST()
		int i = 4
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA6
	event OnSelectST()
		int i = 5
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA7
	event OnSelectST()
		int i = 6
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA8
	event OnSelectST()
		int i = 7
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA9
	event OnSelectST()
		int i = 8
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state ASA10
	event OnSelectST()
		int i = 9
		If MilkQ.MilkingEquipment.Find("") != -1 || MilkQ.MilkingEquipment.Length < 10 || MilkQ.BasicLivingArmor.Find("") != -1 || MilkQ.BasicLivingArmor.Length < 10 || MilkQ.ParasiteLivingArmor.Find("") != -1 || MilkQ.ParasiteLivingArmor.Length < 10
			MilkQ.Armor_Purge()
		EndIf
		if ArmorlistIndex == 1 
			if MilkQ.MilkingEquipment[i] == Slots[2]
				MilkQ.MilkingEquipment[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.MilkingEquipment[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 2
			if MilkQ.BasicLivingArmor[i] == Slots[2]
				MilkQ.BasicLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.BasicLivingArmor[i] = Slots[2]
			endif
		elseif ArmorlistIndex == 3
			if MilkQ.ParasiteLivingArmor[i] == Slots[2]
				MilkQ.ParasiteLivingArmor[i] = "Empty"
			elseif MilkQ.MilkingEquipment.Find(Slots[2]) == -1 && MilkQ.BasicLivingArmor.Find(Slots[2]) == -1 && MilkQ.ParasiteLivingArmor.Find(Slots[2]) == -1 && Slots[2] != "" 
				MilkQ.ParasiteLivingArmor[i] = Slots[2]
			endif
		endif
		ArmorRefresh()
	endEvent

	event OnHighlightST()
		SetInfoText("Change/Remove armor")
	endEvent
endState

state Poll_Interval_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.MilkPoll)
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(1, 24)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.MilkPoll = value as int
		SetSliderOptionValueST(MilkQ.MilkPoll, "$MME_MENU_PAGE_Settings_H1_S2.2")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S2_Higlight")
	endEvent
endState

state Difficulty_Menu
	event OnMenuOpenST()
		SetMenuDialogStartIndex(PresetIndex)
		SetMenuDialogDefaultIndex(1)
		SetMenuDialogOptions(Preset)
	endEvent

	event OnMenuAcceptST(int index)
		PresetIndex = index
		if PresetIndex == 0
			MilkQ.TimesMilkedMult = 70
		elseif PresetIndex == 1
			MilkQ.TimesMilkedMult = 50
		elseif PresetIndex == 2
			MilkQ.TimesMilkedMult = 10
		endif
		
		SetMenuOptionValueST(Preset[PresetIndex])
		MilkE.InitializeMilkProperties()
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H4_S1_Higlight")
	endEvent
endState

state MaidlistMode_Menu
	event OnMenuOpenST()
		SetMenuDialogStartIndex(MaidlistModeIndex)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(MaidlistMode)
	endEvent

	event OnMenuAcceptST(int index)
		int i = 0
		MaidlistModeIndex = index
		Maidlist = new string[20]
		MaidlistA = new Actor[20]
		if MaidlistModeIndex == 0
			while i < MilkQ.MilkMaid.Length
				if MilkQ.MilkMaid[i] != None
					Maidlist[i] = MilkQ.MilkMaid[i].GetLeveledActorBase().GetName()
					MaidlistA[i] = MilkQ.MilkMaid[i]
					MaidIndex = i
				else
					Maidlist[i] = "--"
				endif
				i = i + 1
			endwhile
		else
			while i < MilkQ.MilkSlave.Length
				if MilkQ.MilkSlave[i] != None
					Maidlist[i] = MilkQ.MilkSlave[i].GetLeveledActorBase().GetName()
					MaidlistA[i] = MilkQ.MilkSlave[i]
					MaidIndex = i
				else
					Maidlist[i] = "--"
				endif
				i = i + 1
			endwhile
		endif
		ForcePageReset()
	endEvent
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_Milk_Maid_H1_S2_Higlight")
	endEvent
endState

state BreastScaleMax_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.BoobMax)
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(0.0, 36.0)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
 		MilkQ.BoobMax = value as float
		int i = 0
			while i < MilkQ.MilkMaid.Length
				if MilkQ.MilkMaid[i] != None
					MilkQ.CurrentSize(MilkQ.MilkMaid[i])
				endif
				i = i + 1
			endwhile
		SetSliderOptionValueST(MilkQ.BoobMax, "{2}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S1_Higlight")
	endEvent
endState

state BreastCurve_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.BreastCurve)
		SetSliderDialogDefaultValue(0.1)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.BreastCurve = value as float
		int i = 0
			while i < MilkQ.MilkMaid.Length
				if MilkQ.MilkMaid[i] != None
					MilkQ.CurrentSize(MilkQ.MilkMaid[i])
				endif
				i = i + 1
			endwhile
		SetSliderOptionValueST(MilkQ.BreastCurve, "{2}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S2_Higlight")
	endEvent
endState

state BreastIncreasePerLvl_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.BoobPerLvl)
		SetSliderDialogDefaultValue(0.07)
		SetSliderDialogRange(0.0, 0.20)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.BoobPerLvl = value
		SetSliderOptionValueST(MilkQ.BoobPerLvl, "{2}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S4_Higlight")
	endEvent
endState

state BreastIncrease_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.BoobIncr)
		SetSliderDialogDefaultValue(0.05)
		SetSliderDialogRange(0.0, 0.30)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.BoobIncr = value
		SetSliderOptionValueST(MilkQ.BoobIncr, "{2}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H2_S3_Higlight")
	endEvent
endState

state LactacidDecayRate_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.LactacidDecayRate)
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(-0.01, 1.0)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.LactacidDecayRate = value
		SetSliderOptionValueST(MilkQ.LactacidDecayRate, "{2}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S9_Higlight")
	endEvent
endState

state MilkGenerationValue_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.MilkGenValue)
		SetSliderDialogDefaultValue(0.06)
		SetSliderDialogRange(0.03, 0.30)
		SetSliderDialogInterval(0.03)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.MilkGenValue = value
		SetSliderOptionValueST(MilkQ.MilkGenValue, "$MME_MENU_PAGE_Settings_H1_S7.1")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H1_S7_Higlight")
	endEvent
endState

state NPCComments_Chance_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.MME_NPCComments.GetValue())
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.MME_NPCComments.SetValue(value)
		SetSliderOptionValueST(MilkQ.MME_NPCComments.GetValue(), "{2}%")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S3_Higlight")
	endEvent
endState

state PainSystem_Toggle
	event OnSelectST()
		if !MilkQ.PainSystem
			MilkQ.PainSystem = true
		else
			MilkQ.PainSystem = false
		endif
		SetToggleOptionValueST(MilkQ.PainSystem)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_Pain_System_Higlight")
	endEvent
endState

state PainHurts_Toggle
	event OnSelectST()
		if !MilkQ.PainKills
			MilkQ.PainKills = true
		else
			MilkQ.PainKills = false
		endif
		SetToggleOptionValueST(MilkQ.PainKills)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_Pain_Hurts_Higlight")
	endEvent
endState

state MilkingDrainsSP_Toggle
	event OnSelectST()
		if !MilkQ.MilkingDrainsSP
			MilkQ.MilkingDrainsSP = true
		else
			MilkQ.MilkingDrainsSP = false
		endif
		SetToggleOptionValueST(MilkQ.MilkingDrainsSP)
	endEvent
endState

state MilkingDrainsMP_Toggle
	event OnSelectST()
		if !MilkQ.MilkingDrainsMP
			MilkQ.MilkingDrainsMP = true
		else
			MilkQ.MilkingDrainsMP = false
		endif
		SetToggleOptionValueST(MilkQ.MilkingDrainsMP)
	endEvent
endState
		
state ECTrigger_Toggle
	event OnSelectST()
		if !MilkQ.ECTrigger
			MilkQ.ECTrigger = true
		else
			MilkQ.ECTrigger = false
		endif
		SetToggleOptionValueST(MilkQ.ECTrigger)
	endEvent
endState

state ECCrowdControl_Toggle
	event OnSelectST()
		if !MilkQ.ECCrowdControl
			MilkQ.ECCrowdControl = true
		else
			MilkQ.ECCrowdControl = false
		endif
		SetToggleOptionValueST(MilkQ.ECCrowdControl)
	endEvent
endState

state SimpleMilk_Toggle
	event OnSelectST()
		if !MilkQ.MilkQC.MME_SimpleMilkPotions
			MilkQ.MilkQC.MME_SimpleMilkPotions = true
		else
			MilkQ.MilkQC.MME_SimpleMilkPotions = false
		endif
		SetToggleOptionValueST(MilkQ.MilkQC.MME_SimpleMilkPotions)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_H3_S13_Higlight")
	endEvent
endState

state Milking_MilkWithZaZMoMSuctionCups_Toggle
	event OnSelectST()
		string toggleVal
		if !MilkQ.MilkNaked && !MilkQ.MilkWithZaZMoMSuctionCups
			MilkQ.MilkNaked = true
			MilkQ.MilkWithZaZMoMSuctionCups = false
			toggleVal = "$MME_MENU_PAGE_Milking_H3_S5.1"
		elseif !MilkQ.MilkWithZaZMoMSuctionCups
			MilkQ.MilkNaked = false
			MilkQ.MilkWithZaZMoMSuctionCups = true
			toggleVal = "$MME_MENU_PAGE_Milking_H3_S5.2"
		else
			MilkQ.MilkNaked = false
			MilkQ.MilkWithZaZMoMSuctionCups = false
			toggleVal = "$MME_MENU_PAGE_Milking_H3_S5.3"
		endif
		SetTextOptionValueST(toggleVal)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_H3_S5_Higlight")
	endEvent
endState

state Feeding_Toggle
	event OnSelectST()
		if !MilkQ.Feeding
			MilkQ.Feeding = true
		else
			MilkQ.Feeding = false
		endif
		SetToggleOptionValueST(MilkQ.Feeding)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_H3_S8_Higlight")
	endEvent
endState

state ForcedFeeding_Toggle
	event OnSelectST()
		if !MilkQ.ForcedFeeding
			MilkQ.ForcedFeeding = true
		else
			MilkQ.ForcedFeeding = false
		endif
		SetToggleOptionValueST(MilkQ.ForcedFeeding)
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_H3_S14_Higlight")
	endEvent
endState

state Feeding_Sound_Toggle
	event OnSelectST()
		string toggleVal
		if MilkQ.Feeding_Sound == 0
			MilkQ.Feeding_Sound = 1
			toggleVal = "$MME_MENU_PAGE_Milking_H3_S12.2"
		elseif MilkQ.Feeding_Sound == 1
			MilkQ.Feeding_Sound = 2
			toggleVal = "$MME_MENU_PAGE_Milking_H3_S12.3"
		elseif MilkQ.Feeding_Sound == 2
			MilkQ.Feeding_Sound = 0
			toggleVal = "$MME_MENU_PAGE_Milking_H3_S12.1"
		endif
		SetTextOptionValueST(toggleVal)
	endEvent
endState

state Debug_MM_Maid_MilkingMode
	event OnSelectST()
		string toggleVal
		if StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode", missing = 0) == 0
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode", 1)
			toggleVal = "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode.1"
		elseif StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode") == 1
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode", 2)
			toggleVal = "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode.2"
		elseif StorageUtil.GetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode") == 2
			StorageUtil.SetIntValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingMode", 0)
			toggleVal = "$MME_MENU_PAGE_Debug_Milk_Maid_MilkingMode.0"
		endif
		SetTextOptionValueST(toggleVal)
	endEvent
endState

state FuckMachine_Toggle
	event OnSelectST()
		if !MilkQ.FuckMachine
			MilkQ.FuckMachine = true
		else
			MilkQ.FuckMachine = false
		endif
		SetToggleOptionValueST(MilkQ.FuckMachine)
	endEvent
endState

state Milking_Duration_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.Milking_Duration)
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(1, 300)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.Milking_Duration = value as int
		SetSliderOptionValueST(MilkQ.Milking_Duration, "$MME_MENU_PAGE_Milking_H3_S7.2")
	endEvent
endState

state Milking_GushPct_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.GushPct)
		SetSliderDialogDefaultValue(10)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(5)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.GushPct = value as Int
		SetSliderOptionValueST(MilkQ.GushPct, "{2}" + "%")
	endEvent
	
	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_H3_S16_Higlight")
	endEvent
endState

state Feeding_Duration_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.Feeding_Duration)
		SetSliderDialogDefaultValue(30)
		SetSliderDialogRange(1, 60)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.Feeding_Duration = value as int
		SetSliderOptionValueST(MilkQ.Feeding_Duration, "$MME_MENU_PAGE_Milking_H3_S9.2")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Milking_H3_S9_Higlight")
	endEvent
endState

state FuckMachine_Duration_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.FuckMachine_Duration)
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(1, 300)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.FuckMachine_Duration = value as int
		SetSliderOptionValueST(MilkQ.FuckMachine_Duration, "$MME_MENU_PAGE_Milking_H3_S11.2")
	endEvent
endState

state ECRange_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.ECRange)
		SetSliderDialogDefaultValue(500)
		SetSliderDialogRange(0, 500)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.ECRange = value as int
		SetSliderOptionValueST(MilkQ.ECRange, "{0}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Settings_H3_S3_Higlight")
	endEvent
endState

state Debug_MilkProductionMod_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.MilkProdMod)
		SetSliderDialogDefaultValue(100)
		SetSliderDialogRange(0, 200)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.MilkProdMod = value as Float
		SetSliderOptionValueST(MilkQ.MilkProdMod, "{0}%")
	endEvent
endState

state Debug_MilkPriceMod_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.MilkPriceMod)
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(1, 10)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.MilkPriceMod = value as int
		SetSliderOptionValueST(MilkQ.MilkPriceMod, "{0}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H2_S2_Higlight")
	endEvent
endState

state Debug_ExhaustionSleepMod_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(MilkQ.ExhaustionSleepMod)
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 5)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		MilkQ.ExhaustionSleepMod = value as int
		SetSliderOptionValueST(MilkQ.ExhaustionSleepMod, "{0}")
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_H2_S6_Higlight")
	endEvent
endState

state Debug_Mastery_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none,"MME.Progression.Level", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 40)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(none,"MME.Progression.Level", value )
		SetSliderOptionValueST(StorageUtil.GetFloatValue(none,"MME.Progression.Level"))
	endEvent
endState

state Debug_TimesMilked_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none,"MME.Progression.TimesMilked", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(none,"MME.Progression.TimesMilked", value )
		SetSliderOptionValueST(StorageUtil.GetFloatValue(none,"MME.Progression.TimesMilked"))
	endEvent
endState

state Debug_TimesMilked_Overall_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(none,"MME.Progression.TimesMilkedAll", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(none,"MME.Progression.TimesMilkedAll", value )
		SetSliderOptionValueST(StorageUtil.GetFloatValue(none,"MME.Progression.TimesMilkedAll"))
	endEvent
endState

state Debug_MM_MaidLevel_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.Level", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.Level", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.Level"))
	endEvent
endState

state Debug_MM_MaidTimesMilked_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.TimesMilked", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 1000)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.TimesMilked", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.TimesMilked"))
	endEvent
endState

state Debug_MM_Maid_BreastBaseSize_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase", missing = 1))
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 3)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase"), "{2}")
	endEvent
endState

state Debug_MM_Maid_BreastRows_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastRows", missing = 1))
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(1, 4)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastRows", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastRows"))
		Form cuirass = MaidlistA[MaidIndex].GetWornForm(Armor.GetMaskForSlot(32))
		if cuirass == (MilkQ.TITS4 || MilkQ.TITS6 || MilkQ.TITS8)
			MaidlistA[MaidIndex].RemoveItem(cuirass)
		endif
		if value != (2 || 3 || 4)
			;do nothing
		elseif value == 2
			MaidlistA[MaidIndex].EquipItem(MilkQ.TITS4,true,true)
		elseif value == 3
			MaidlistA[MaidIndex].EquipItem(MilkQ.TITS6,true,true)
		elseif value == 4
			MaidlistA[MaidIndex].EquipItem(MilkQ.TITS8,true,true)
		endif
	endEvent
endState

state Debug_MM_Maid_MaidBoobIncr_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobIncr", missing = 0))
		SetSliderDialogDefaultValue(0.05)
		SetSliderDialogRange(0.0, 0.3)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		if value != 0
			StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobIncr", value)
		else
			StorageUtil.UnsetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobIncr")
		endif
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobIncr"), "{2}")
	endEvent
endState

state Debug_MM_Maid_MaidBoobPerLvl_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl", missing = 0))
		SetSliderDialogDefaultValue(0.07)
		SetSliderDialogRange(0.0, 0.2)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		if value != 0
			StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl", value)
		else
			StorageUtil.UnsetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl")
		endif
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BoobPerLvl"), "{2}")
	endEvent
endState

state Debug_MM_Maid_BreastBaseSizeModified_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBaseMod", missing = 0))
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 3)
		SetSliderDialogInterval(0.1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.BreastBase"), "{2}")
	endEvent
endState

state Debug_MM_LactacidCount_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.LactacidCount", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.LactacidCount", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.LactacidCount"), "{2}")
	endEvent
endState

state Debug_MM_PainCount_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.PainCount", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.PainCount", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.PainCount"), "{2}")
	endEvent
endState

state Debug_MM_MaidContainerCum_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerCumsSUM", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerCumsSUM", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerCumsSUM"))
	endEvent
endState

state Debug_MM_MaidContainerMilk_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerMilksSUM", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerMilksSUM", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerMilksSUM"))
	endEvent
endState

state Debug_MM_MaidContainerLactacid_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerLactacid", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerLactacid", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkingContainerLactacid"))
	endEvent
endState

state Debug_MM_MilkCount_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkCount", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkCount", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkCount"), "{2}")
	endEvent
endState

state Debug_MM_MilkGeneration_Slider
	event OnSliderOpenST()
		SetSliderDialogStartValue(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkGen", missing = 0))
		SetSliderDialogDefaultValue(0)
		SetSliderDialogRange(0, 25)
		SetSliderDialogInterval(0.01)
	endEvent

	event OnSliderAcceptST(float value)
		StorageUtil.SetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkGen", value)
		SetSliderOptionValueST(StorageUtil.GetFloatValue(MaidlistA[MaidIndex],"MME.MilkMaid.MilkGen")/3/10, "{2}")
	endEvent
endState

state ArmorSupport_Armorlist_Menu
	event OnMenuOpenST()
		SetMenuDialogStartIndex(ArmorlistIndex)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(Armorlist)
	endEvent

	event OnMenuAcceptST(int index)
		ArmorlistIndex = index
		SetMenuOptionValueST(Armorlist[ArmorlistIndex])
		ArmorRefresh()
	endEvent
endState

state ArmorSupport_ArmorSlotList_Menu ; not active
	event OnMenuOpenST()
		SetMenuDialogStartIndex(ArmorSlotListIndex)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(ArmorSlotList)
	endEvent

	event OnMenuAcceptST(int index)
		ArmorSlotListIndex = index
		SetMenuOptionValueST(ArmorSlotList[ArmorSlotListIndex])
	endEvent
endState

state Debug_Milk_Maid_Menu
	event OnMenuOpenST()
		SetMenuDialogStartIndex(MaidIndex)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(Maidlist)
	endEvent

	event OnMenuAcceptST(int index)
		MaidIndex = index
		if MaidIndex != -1
			SetMenuOptionValueST(Maidlist[MaidIndex])
			ForcePageReset()
		else 
			MaidIndex = 0
			SetMenuOptionValueST(Maidlist[MaidIndex])
			ForcePageReset()
		endif
	endEvent

	event OnHighlightST()
		SetInfoText("$MME_MENU_PAGE_Debug_Milk_Maid_H1_S2_Higlight")
	endEvent
endState

state Hotkey
	event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		MilkQ.UnregisterForAllKeys()
		MilkQ.UnregisterForCrosshairRef()
		bool continue = true
 
		; Check for conflict
		if conflictControl != ""
			string msg
			if conflictName != ""
				msg = "This key is already mapped to:\n'" + conflictControl + "'\n(" + conflictName + ")\n\n Are you sure you want to continue?"
			else
				msg = "This key is already mapped to:\n'" + conflictControl + "'\n\n Are you sure you want to continue?"
			endIf
			continue = ShowMessage(msg, true, "Yes", "No")
		endIf

		; Set allowed key change
		if continue
			MilkQ.NotificationKey = newKeyCode
			SetKeyMapOptionValueST(newKeyCode)
		endIf
		MilkQ.RegisterForKey(MilkQ.NotificationKey)
		MilkQ.RegisterForCrosshairRef()
	endEvent

	event OnHighlightST()
		SetInfoText("Key ID " + MilkQ.NotificationKey + "\n Shows information about player/target milk maid: Milk, Pain, Lactacid amount. \n Holding Notification Key for 2 seconds toggles self/target milking OR pressing Notification Key with L/R Shift. \n If hold during milking - returns control to player. \n If pressed during milking and both shifts - aborts milking.")
	endEvent
endState