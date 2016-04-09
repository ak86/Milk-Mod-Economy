Scriptname MilkAddCheeseWedge Extends ActiveMagicEffect  

MilkQUEST Property MilkQ Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.AddItem(MilkQ.MME_Foods.GetAt(0), 7)
EndEvent