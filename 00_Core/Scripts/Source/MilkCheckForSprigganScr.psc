Scriptname MilkCheckForSprigganScr extends ReferenceAlias

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
Event OnObjectEquipped( Form akBaseObject, ObjectReference akReference)
	Actor akActor = GetActorRef()
	String akArmorName = akBaseObject.getname()
	if (StringUtil.Find(akArmorName, "Spriggan Armor" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Spriggan Host" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Living Arm" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Hermaeus Mora" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "HM Priestess" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Tentacle Parasite" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Tentacle Armor" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Dwemer milking device" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Cow Harness" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Milking Cuirass" ) >= 0\
	|| 	StringUtil.Find(akArmorName, "Milker" ) >= 0\
	|| 	MilkQ.MilkingEquipment.find(akArmorName) >= 0\
	|| 	MilkQ.BasicLivingArmor.find(akArmorName) >= 0\
	|| 	MilkQ.ParasiteLivingArmor.find(akArmorName) >= 0)

		If MilkQ.MILKmaid.find(akActor) == -1
			MilkQ.AssignSlot(akActor)
		EndIf

		if akActor.GetLeveledActorBase().GetSex() == 1 && MilkQ.MILKmaid.find(akActor) != -1
			If (StringUtil.Find(akArmorName, "Spriggan Armor" ) >= 0\
			|| StringUtil.Find(akArmorName, "Spriggan Host" ) >= 0\
			|| StringUtil.Find(akArmorName, "Living Arm" ) >= 0\
			|| StringUtil.Find(akArmorName, "Hermaeus Mora" ) >= 0\
			|| StringUtil.Find(akArmorName, "HM Priestess" ) >= 0\
			|| StringUtil.Find(akArmorName, "Tentacle Parasite" ) >= 0\
			|| StringUtil.Find(akArmorName, "Tentacle Armor" ) >= 0\
			|| MilkQ.BasicLivingArmor.find(akArmorName) >= 0)\
			|| MilkQ.ParasiteLivingArmor.find(akArmorName) >= 0
				if akActor == MilkQ.PlayerREf && StorageUtil.GetFloatValue(akActor,"MME.MilkMaid.BreastRows", missing = 1) > 1 && akActor.GetWornForm(Armor.GetMaskForSlot(32)) == akBaseObject
					Debug.Notification(akArmorName + " attaches to your breasts, absorbing your additional breast rows")
					StorageUtil.SetFloatValue(akActor,"MME.MilkMaid.BreastRows", 1)
				endif
				if akActor == MilkQ.PlayerREf
					Debug.Notification(akArmorName + " attaches to your breasts")
				endif
				akActor.AddSpell( MilkQ.MilkForSprigganPassive, false )
				If MME_Storage.getLactacidCurrent(akActor) < 1
					MME_Storage.setLactacidCurrent(akActor, 1)
				EndIf
			Else
				if akActor == MilkQ.PlayerREf
					Debug.Notification( "The milking cups attach to your breasts, ready to milk you" )
				endif
			EndIf
		EndIf
	EndIf
	if akActor.GetWornForm(Armor.GetMaskForSlot(32)) != None && MilkQ.MilkLeakWearArm == False && akActor.HasSpell(MilkQ.MilkLeak)
		akActor.RemoveSpell(MilkQ.MilkLeak)
	endif
EndEvent

Event OnObjectUnequipped( Form akBaseObject, ObjectReference akReference )
	Actor akActor = GetActorRef()
	String akArmorName = akBaseObject.getname()
	if MilkQ.MILKmaid.find(akActor) != -1
		if StringUtil.Find(akArmorName, "Spriggan Armor" ) >= 0\
		|| StringUtil.Find(akArmorName, "Spriggan Host" ) >= 0\
		|| StringUtil.Find(akArmorName, "Living Arm" ) >= 0\
		|| StringUtil.Find(akArmorName, "Hermaeus Mora" ) >= 0\
		|| StringUtil.Find(akArmorName, "HM Priestess" ) >= 0\
		|| StringUtil.Find(akArmorName, "Tentacle Parasite" ) >= 0\
		|| StringUtil.Find(akArmorName, "Tentacle Armor" ) >= 0\
		|| MilkQ.BasicLivingArmor.find(akArmorName) >= 0\
		|| MilkQ.ParasiteLivingArmor.find(akArmorName) >= 0
			if akActor == MilkQ.PlayerREf
				Debug.Notification( "You are free from " + akArmorName )
			endif
			akActor.RemoveSpell( MilkQ.MilkForSprigganPassive )
		ElseIf akActor.GetLeveledActorBase().GetSex() == 1 && StringUtil.Find(akArmorName, "Dwemer milking device" ) >= 0\
			|| StringUtil.Find(akArmorName, "Cow Harness" ) >= 0\
			|| StringUtil.Find(akArmorName, "Milking Cuirass" ) >= 0\
			|| StringUtil.Find(akArmorName, "Milker" ) >= 0\
			|| MilkQ.MilkingEquipment.find(akArmorName) >= 0
			if akActor == MilkQ.PlayerREf
				Debug.Notification( "The milking cups detach from your breasts" )
			endif
		EndIf
	EndIf
EndEvent