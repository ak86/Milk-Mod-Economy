Scriptname MilkResetMaidsScr extends activemagiceffect

MilkQUEST Property MilkQ Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MilkQ.MaidReset()
EndEvent