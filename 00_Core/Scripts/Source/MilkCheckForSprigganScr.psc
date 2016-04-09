Scriptname MilkCheckForSprigganScr extends ReferenceAlias
;script running only on player

MilkQUEST Property MilkQ Auto

;----------------------------------------------------------------------------
Event OnObjectEquipped( Form akBaseObject, ObjectReference akReference)
	Actor PlayerREF = MilkQ.PlayerREF
	if akBaseObject as Armor\
	&& (StringUtil.Find(akBaseObject.getname(), "Spriggan Armor" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Spriggan Host" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Living Arm" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Hermaeus Mora" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "HM Priestess" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Tentacle Parasite" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Tentacle Armor" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Dwemer milking device" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Cow Harness" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Milking Cuirass" ) >= 0\
	|| 	StringUtil.Find(akBaseObject.getname(), "Milker" ) >= 0\
	|| 	MilkQ.MilkingEquipment.find(akBaseObject.getname()) >= 0\
	|| 	MilkQ.BasicLivingArmor.find(akBaseObject.getname()) >= 0\
	|| 	MilkQ.ParasiteLivingArmor.find(akBaseObject.getname()) >= 0)

		If MilkQ.MILKmaid.find(PlayerREF) == -1
			MilkQ.AssignSlot(PlayerREF)
		EndIf

		if PlayerREF.GetActorBase().GetSex() == 1
			If (StringUtil.Find(akBaseObject.getname(), "Spriggan Armor" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Spriggan Host" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Living Arm" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Hermaeus Mora" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "HM Priestess" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Tentacle Parasite" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Tentacle Armor" ) >= 0\
			|| MilkQ.BasicLivingArmor.find(akBaseObject.getname()) >= 0)\
			|| MilkQ.ParasiteLivingArmor.find(akBaseObject.getname()) >= 0
				Debug.Notification(akBaseObject.getname() + " attaches to your breasts")
				PlayerREF.AddSpell( MilkQ.MilkForSprigganPassive, false )
				If StorageUtil.GetFloatValue(PlayerREF,"MME.MilkMaid.LactacidCount", missing = 0) < 1
					StorageUtil.SetFloatValue(PlayerREF,"MME.MilkMaid.LactacidCount", 1)
				EndIf
			Else
				Debug.Notification( "The milking cups attach to your breasts, ready to milk you" )
			EndIf
		EndIf
	EndIf
	if MilkQ.PlayerREF.GetWornForm(Armor.GetMaskForSlot(32)) != None && MilkQ.MilkLeakWearArm == False && MilkQ.PlayerREF.HasSpell(MilkQ.MilkLeak)
		MilkQ.PlayerREF.RemoveSpell(MilkQ.MilkLeak)
	endif
EndEvent

Event OnObjectUnequipped( Form akBaseObject, ObjectReference akReference )
	Actor PlayerREF = MilkQ.PlayerREF
	if PlayerREF.GetActorBase().GetSex() == 1
		if akBaseObject as Armor
			if StringUtil.Find(akBaseObject.getname(), "Spriggan Armor" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Spriggan Host" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Living Arm" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Hermaeus Mora" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "HM Priestess" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Tentacle Parasite" ) >= 0\
			|| StringUtil.Find(akBaseObject.getname(), "Tentacle Armor" ) >= 0\
			|| MilkQ.BasicLivingArmor.find(akBaseObject.getname()) >= 0\
			|| MilkQ.ParasiteLivingArmor.find(akBaseObject.getname()) >= 0
				Debug.Notification( "You are free from " + akBaseObject.getname() )
				PlayerREF.RemoveSpell( MilkQ.MilkForSprigganPassive )
			ElseIf StringUtil.Find(akBaseObject.getname(), "Dwemer milking device" ) >= 0\
				|| StringUtil.Find(akBaseObject.getname(), "Cow Harness" ) >= 0\
				|| StringUtil.Find(akBaseObject.getname(), "Milking Cuirass" ) >= 0\
				|| StringUtil.Find(akBaseObject.getname(), "Milker" ) >= 0\
				|| MilkQ.MilkingEquipment.find(akBaseObject.getname()) >= 0
				Debug.Notification( "The milking cups detach from your breasts" )
			EndIf
		EndIf
	EndIf
EndEvent