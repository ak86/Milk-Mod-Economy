Scriptname MilkDebugSpellsScr extends activemagiceffect

MilkQUEST Property MilkQ Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MilkModToggle )
		MilkQ.PlayerRef.AddSpell( MilkQ.MilkModToggle, false )
	endif
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MilkModInfo )
		MilkQ.PlayerRef.AddSpell( MilkQ.MilkModInfo, false )
	endif
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MilkSelf )
		MilkQ.PlayerRef.AddSpell( MilkQ.MilkSelf, false )
	endif
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MilkTarget )
		MilkQ.PlayerRef.AddSpell( MilkQ.MilkTarget, false )
	endif
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MME_ResetMaids )
		MilkQ.PlayerRef.AddSpell( MilkQ.MME_ResetMaids, false )
	endif
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MME_ResetMod )
		MilkQ.PlayerRef.AddSpell( MilkQ.MME_ResetMod, false )
	endif
	if !MilkQ.PlayerRef.HasSpell( MilkQ.MME_Uninstall )
		MilkQ.PlayerRef.AddSpell( MilkQ.MME_Uninstall, false )
	endif
EndEvent