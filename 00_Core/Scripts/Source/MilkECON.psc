Scriptname MilkECON extends Quest
{Economy script, contains all MME milks and foods}

MilkQUEST Property MilkQ Auto

MiscObject Property Gold Auto
Message Property MilkTrade Auto

int Property MilkEcoCaravan Auto
int Property MilkEcoDawnstar Auto
int Property MilkEcoFalkreath Auto
int Property MilkEcoMarkarth Auto
int Property MilkEcoOrc Auto
int Property MilkEcoRiften Auto
int Property MilkEcoSolitude Auto
int Property MilkEcoWhiterun Auto
int Property MilkEcoWindhelm Auto
int Property MilkEcoMorrowind Auto

int Property MilkDemandCaravan Auto
int Property MilkDemandDawnstar Auto
int Property MilkDemandFalkreath Auto
int Property MilkDemandMarkarth Auto
int Property MilkDemandOrc Auto
int Property MilkDemandRiften Auto
int Property MilkDemandSolitude Auto
int Property MilkDemandWhiterun Auto
int Property MilkDemandWindhelm Auto
int Property MilkDemandMorrowind Auto

Perk Property Haggling00 Auto
Perk Property Haggling20 Auto
Perk Property Haggling40 Auto
Perk Property Haggling60 Auto
Perk Property Haggling80 Auto

Location Property locDawnstar Auto
Location Property locWindpeakInn Auto
Location Property locDawnstarSanctuary Auto
Location Property locFalkreath Auto
Location Property locDeadMansDrink Auto
Location Property locMarkarth Auto
Location Property locOldHroldan Auto
Location Property locOldHroldanInn Auto
Location Property locMorKhazgur Auto
Location Property locDushnikhYal Auto
Location Property locNarzulbur Auto
Location Property locLargashbur Auto
Location Property locRiften Auto
Location Property locShorsStone Auto
Location Property locSolitude Auto
Location Property locDragonBridge Auto
Location Property locMorthal Auto
Location Property locWhiterun Auto
Location Property locRiverwood Auto
Location Property locSleepingGiantInn Auto
Location Property locRorikstead Auto
Location Property locWindhelm Auto
Location Property locWinterhold Auto
Location Property locTheFrozenHearth Auto
Location Property locCollegeofWinterhold Auto
Location Property locFourShieldsTavern Auto
Location Property locFrostfruitInn Auto
Location Property locKynesgrove Auto
Location Property locKarthwasten Auto
;HF DLC
Location Property locHeljarchenHall Auto
Location Property locWindstadManor Auto
Location Property locLakeviewManor Auto
;Dawnguard
Location Property locFortDawnguard Auto
Location Property locDayspringCanyon Auto
;Dragonborn DLC
Location Property locRavenRock Auto
Location Property locSkaalVillage Auto
Location Property locTelMithryn Auto
;Empty DLC placeholder
Location Property locMMEEmpty Auto			

Potion Property OverMilkingEff Auto
Potion Property MilkpumpFeedingBottle Auto

FormList Property MME_Races Auto

;Length - 10
Int[] PrevMilkEcos
Int[] CurrMilkEcos
String[] Property MarketNames Auto
Int[] MilkDemandCDs
Int[] MilkDemands
Int[] SaturationPenalties

;Length - 12
String[] Property MilkNames Auto

int Property divnull = 10 Auto
int Property Updates = 0 Auto

;---------------------------------------------------------------------------------------------------------------------

bool Function MilkEconMaintenance()
	debug.Trace("MilkModEconomy ECON market names array resetting")
	MarketNames = new String[10]
	MarketNames[0] = "with the Khajiit Caravaneers"
	MarketNames[1] = "in " + locDawnstar.GetName()
	MarketNames[2] = "in " + locFalkreath.GetName()
	MarketNames[3] = "in " + locMarkarth.GetName()
	MarketNames[4] = "with the Orcish Strongholds"
	MarketNames[5] = "in " + locRiften.GetName()
	MarketNames[6] = "in " + locSolitude.GetName()
	MarketNames[7] = "in " + locWhiterun.GetName()
	MarketNames[8] = "in " + locWindhelm.GetName()
	MarketNames[9] = "in the province of Solstheim"
	
	debug.Trace("MilkModEconomy ECON milk names array resetting")
	string milk = " Milk"
	MilkNames = new String[12]
	MilkNames[0] = "Nothing"
	MilkNames[1] = MME_Races.GetAt(0).GetName() + milk
	MilkNames[2] = MME_Races.GetAt(1).GetName() + milk
	MilkNames[3] = MME_Races.GetAt(2).GetName() + milk
	MilkNames[4] = MME_Races.GetAt(3).GetName() + milk
	MilkNames[5] = MME_Races.GetAt(4).GetName() + milk
	MilkNames[6] = MME_Races.GetAt(5).GetName() + milk
	MilkNames[7] = MME_Races.GetAt(6).GetName() + milk
	MilkNames[8] = MME_Races.GetAt(7).GetName() + milk
	MilkNames[9] = MME_Races.GetAt(8).GetName() + milk
	MilkNames[10] = MME_Races.GetAt(9).GetName() + milk
	MilkNames[11] = "Exotic" + milk
	return true
EndFunction

bool Function InitializeMilkProperties()
	MilkEcoCaravan = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoDawnstar = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoFalkreath = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoMarkarth = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoOrc = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoRiften = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoSolitude = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoWhiterun = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoWindhelm = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))
	MilkEcoMorrowind = Utility.RandomInt(0, 1000/(MilkQ.TimesMilkedMult/divnull))

	SaturationPenalties = new Int[10]
	SaturationPenalties[0] = 0
	SaturationPenalties[1] = 200/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[2] = 200/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[3] = 300/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[4] = 300/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[5] = 300/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[6] = 300/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[7] = 425/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[8] = 425/(MilkQ.TimesMilkedMult/divnull)
	SaturationPenalties[9] = 800/(MilkQ.TimesMilkedMult/divnull)

	MilkDemands = new Int[10]
	MilkDemandCDs = new Int[10]

	return true
EndFunction

Event OnUpdateGameTime()
	if MilkQ.EconFlag == True
		RegisterForSingleUpdateGameTimeAt(9.0)
		MilkEcoCycle()
	endif
endEvent

float Function GetCurrentHourOfDay() global
{Returns the current time of day in hours since midnight}
 
	float Time = Utility.GetCurrentGameTime()
	Time -= Math.Floor(Time) ; Remove "previous in-game days passed" bit
	Time *= 24 ; Convert from fraction of a day to number of hours
	Return Time
EndFunction
 
Function RegisterForSingleUpdateGameTimeAt(float GameTime)
{Registers for a single UpdateGameTime event at the next occurrence
of the specified GameTime (in hours since midnight)}
 
	float CurrentTime = GetCurrentHourOfDay()
	If (GameTime <= CurrentTime)
		GameTime += 24
	EndIf
 
	RegisterForSingleUpdateGameTime(GameTime - CurrentTime)
EndFunction

;-----------------------------------\
;----C-Y-C-L-E----F-U-N-C-T-I-O-N-S----\
;---------------------------------------------------------------------------------------------------------------------

Function MilkEcoCycle()
	BeginMilkEcoCycle()
	MilkEcoRestore()
	MilkEcoSaturationEvent()
	MilkEcoDemandEvent()
	EndMilkEcoCycle()
EndFunction

;-----------------------------------\
;----C-O-R-E----F-U-N-C-T-I-O-N-S----\
;---------------------------------------------------------------------------------------------------------------------

; Could be modified to take an actor instead of a race
Function InitiateTrade(int MilkCount, int boobgasmcount, Actor akActor, bool mobilemilking)
	Race maidRace = akActor.GetActorBase().GetRace()
	int marketIndex = GetMarketIndexFromLocation(akActor.GetCurrentLocation())
	int raceIndex = GetRaceIndexFromRace(maidRace)

	Potion NfinalPotion = GetMilkType(milkCount, 0, akActor) as Potion
	int NfinalQty = GetMilkQty(milkCount-boobgasmcount)
	int Nupkeep = GetUpKeepCost(milkCount-boobgasmcount)
	int NbaseTrade = CalculateBaseTrade(NfinalPotion, NfinalQty) * MilkQ.MilkPriceMod
	int NmilkTax = CalculateServiceTax(marketIndex, NbaseTrade)

	Potion BfinalPotion = GetMilkType(boobgasmcount, boobgasmcount, akActor) as Potion
	int BfinalQty = boobgasmcount
	int Bupkeep = GetUpKeepCost(boobgasmcount)
	int BbaseTrade = CalculateBaseTrade(BfinalPotion, BfinalQty) * MilkQ.MilkPriceMod
	int BmilkTax = CalculateServiceTax(marketIndex, BbaseTrade)

	; multiply value of baseTrade after tax is calculated
	if MilkDemands[marketIndex] == raceIndex
		NbaseTrade = NbaseTrade * 3 
		BbaseTrade = BbaseTrade * 3
	endif

	if MilkQ.EconFlag && mobilemilking == false
		int ButtonPressed = (MilkTrade).Show(Nupkeep + Bupkeep, NbaseTrade, NmilkTax, BbaseTrade, BmilkTax)
		if ButtonPressed == 1
			SellMilk(marketIndex, NbaseTrade + BbaseTrade, NmilkTax + BmilkTax, Nupkeep + Bupkeep, akActor)
		elseif ButtonPressed == 2
			SellMilk(marketIndex, NbaseTrade, NmilkTax, Nupkeep, akActor)
			KeepMilk(BfinalPotion, BfinalQty, Bupkeep, akActor)
		elseif ButtonPressed == 3
			SellMilk(marketIndex, BbaseTrade, BmilkTax, Bupkeep, akActor)
			KeepMilk(NfinalPotion, NfinalQty, Nupkeep, akActor)
		else
			KeepMilk(NfinalPotion, NfinalQty, Nupkeep, akActor)
			KeepMilk(BfinalPotion, BfinalQty, Bupkeep, akActor)
		endif
	else
		KeepMilk(NfinalPotion, NfinalQty, NfinalQty * 2, akActor)
		KeepMilk(BfinalPotion, BfinalQty, BfinalQty * 2, akActor)
	endif
endFunction

Function SellMilk(int marketIndex, int baseTrade, int milkTax, int upkeep, Actor akActor)
	UpdateEconomy(marketIndex, baseTrade)

	int finalPayout = baseTrade - milkTax
	if finalPayout < 0
		upkeep = upkeep - finalPayout
		finalPayout = 0
	endif
	if MilkQ.PlayerREF.GetDistance(akActor) < 250
		MilkQ.PlayerREF.AddItem(Gold, finalPayout)
		MilkQ.PlayerREF.RemoveItem(Gold, upkeep, true)
		Debug.Notification("You've made " + finalPayout + " gold. You've been charged " + upkeep + " gold for upkeep.")
	else
		akActor.AddItem(Gold, finalPayout)
		akActor.RemoveItem(Gold, upkeep, true)
	endif
endFunction

Function KeepMilk(Potion finalPotion, int finalQty, int upkeep, Actor akActor)
	if finalQty > 0
		if MilkQ.PlayerREF.GetDistance(akActor) < 250
			MilkQ.PlayerREF.RemoveItem(Gold, upkeep, true)
			MilkQ.PlayerREF.AddItem(finalPotion, finalQty)
			Debug.Notification("You've been charged " + upkeep + " gold for upkeep.")
		else
			akActor.RemoveItem(Gold, upkeep, true)
			akActor.AddItem(finalPotion, finalQty)
		endif
	endif
endFunction

;-----------------------------------\
;----U-T-I-L-I-T-Y----F-U-N-C-T-I-O-N-S----\
;---------------------------------------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------------------
;
; At the end of the milking cycle, use the following variables to inform the user:
; Upkeep     - from GetUpkeepCost(int)
; Milk Type  - from GetMilkType(int, Race)
; Milk Qty   - from GetMilkQty(int)
; Base Trade - from CalculateBaseTrade(Potion, int)
; Tax        - from CalculateServiceTax(Location, int)
;
; If the user sells, call the following function
;    UpdateEconomy(Location, int)
;
; If the user keeps the milk, 
;    just add milk and qty to MilkQ.PlayerREF in the calling script
;
;-----------------------------------------------------------------------------------------------------

int Function GetUpkeepCost(int milkCount)
	return milkCount * 2
endFunction

int Function GetMilkQty(int milkCount)
	int c = milkCount
	
	if c <= 4
		return c
	elseif c <= 12
		return ((c - 3) / 2) + 4
	else
		return ((c - 6) / 3) + 6
	endif
EndFunction

Form Function GetMilkType(int milkCount, int boobgasmcount, Actor milkMaid)
	Race maidRace = milkMaid.GetActorBase().GetRace()
	int i = MilkQ.MilkMaid.Find(milkMaid)
	Float MaidLevel = MME_Storage.getMaidLevel(MilkQ.MILKmaid[i])
	Float MilkMax = MME_Storage.getMilkMaximum(MilkQ.MILKmaid[i])

	if MilkQ.MilkQC.MME_SimpleMilkPotions
		if MilkQ.isSuccubus(milkMaid) || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsSuccubus") == 1
			return MilkQ.MME_Milk_Succubus.GetAt(0)
		elseif MilkQ.isVampire(milkMaid) || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsVampire") == 1
			return MilkQ.MME_Milk_Vampire.GetAt(0)
		elseif MilkQ.isWerewolf(milkMaid) || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsWerewolf") == 1
			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;drugs and alcohol
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.Skooma") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.LeafSkooma") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.Mead") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.BBMead") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)

		elseif maidRace == MME_Races.GetAt(0)
			return MilkQ.MME_Milk_Altmer.GetAt(0)
		elseif maidRace == MME_Races.GetAt(1)
			return MilkQ.MME_Milk_Argonian.GetAt(0)
		elseif maidRace == MME_Races.GetAt(2)
			return MilkQ.MME_Milk_Bosmer.GetAt(0)
		elseif maidRace == MME_Races.GetAt(3)
			return MilkQ.MME_Milk_Breton.GetAt(0)
		elseif maidRace == MME_Races.GetAt(4)
			return MilkQ.MME_Milk_Dunmer.GetAt(0)
		elseif maidRace == MME_Races.GetAt(5)
			return MilkQ.MME_Milk_Imperial.GetAt(0)
		elseif maidRace == MME_Races.GetAt(6)
			return MilkQ.MME_Milk_Khajiit.GetAt(0)
		elseif maidRace == MME_Races.GetAt(7)
			return MilkQ.MME_Milk_Nord.GetAt(0)
		elseif maidRace == MME_Races.GetAt(8)
			return MilkQ.MME_Milk_Orc.GetAt(0)
		elseif maidRace == MME_Races.GetAt(9)
			return MilkQ.MME_Milk_Redguard.GetAt(0)
		else 	;maidRace = CustomRace
			return MilkQ.MME_Milk_Exotic.GetAt(0)
		endif
		
	elseif boobgasmcount == 0
		if milkCount == 0
			return None
		elseif milkCount <= MilkMax * 0.25
			return MilkQ.MME_Milk_Basic.GetAt(0)
		elseif milkCount <= MilkMax * 0.50
			return MilkQ.MME_Milk_Basic.GetAt(1)
		elseif milkCount <= MilkMax * 0.75
			return MilkQ.MME_Milk_Basic.GetAt(2)
		elseif milkCount > MilkMax * 0.75
			return MilkQ.MME_Milk_Basic.GetAt(3)
		endif
	else
		if MilkQ.isSuccubus(milkMaid) || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsSuccubus") == 1
			return MilkQ.MME_Milk_Succubus.GetAt(1)
		elseif MilkQ.isVampire(milkMaid) || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsVampire") == 1
			return MilkQ.MME_Milk_Vampire.GetAt(1)
		elseif MilkQ.isWerewolf(milkMaid) || StorageUtil.GetIntValue(milkMaid,"MME.MilkMaid.IsWerewolf") == 1
			return MilkQ.MME_Milk_Werewolf.GetAt(1)

;drugs and alcohol
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.Skooma") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.LeafSkooma") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.Mead") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)
;		elseif StorageUtil.GetFloatValue(milkMaid,"MME.MilkMaid.BBMead") > 0
;			return MilkQ.MME_Milk_Werewolf.GetAt(0)

		elseif maidRace == MME_Races.GetAt(0)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Altmer, MaidLevel)
		elseif maidRace == MME_Races.GetAt(1)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Argonian, MaidLevel)
		elseif maidRace == MME_Races.GetAt(2)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Bosmer, MaidLevel)
		elseif maidRace == MME_Races.GetAt(3)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Breton, MaidLevel)
		elseif maidRace == MME_Races.GetAt(4)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Dunmer, MaidLevel)
		elseif maidRace == MME_Races.GetAt(5)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Imperial, MaidLevel)
		elseif maidRace == MME_Races.GetAt(6)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Khajiit, MaidLevel)
		elseif maidRace == MME_Races.GetAt(7)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Nord, MaidLevel)
		elseif maidRace == MME_Races.GetAt(8)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Orc, MaidLevel)
		elseif maidRace == MME_Races.GetAt(9)
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Redguard, MaidLevel)
		else 	;maidRace = Custom Race
			return GetMilkTypeHelper(boobgasmcount, MilkQ.MME_Milk_Exotic, MaidLevel)
		endif
	endif
EndFunction

Form Function GetMilkTypeHelper(int milkCount, Formlist FLST, float MaidLevel)
	if MaidLevel < 3
		return FLST.GetAt(1)
	elseif MaidLevel < 6
		return FLST.GetAt(2)
	elseif MaidLevel < 9
		return FLST.GetAt(3)
	else
		return FLST.GetAt(4)
	endif
EndFunction

int Function CalculateBaseTrade(Potion finalPotion, int finalQty)
	if finalPotion == none || finalQty == 0
		return 0
	endif
	int baseTrade = finalPotion.GetGoldValue() * finalQty
	Float Level = StorageUtil.GetFloatValue(none,"MME.Progression.Level")

	; Formula below kind of conforms to the way selling does in game, ignoring potions/enchants
	float priceFactor
	if MilkQ.PlayerREF.GetActorValue("Speechcraft") >= 100
		priceFactor = 2 
	else
		priceFactor = 3.3 - (1.3 * MilkQ.PlayerREF.GetActorValue("Speechcraft") / 100)
	endif
	
	float hagglingSkill = 0
	if MilkQ.PlayerREF.HasPerk(Haggling80)
		hagglingSkill = 0.3
	elseif MilkQ.PlayerREF.HasPerk(Haggling60)
		hagglingSkill = 0.25
	elseif MilkQ.PlayerREF.HasPerk(Haggling40)
		hagglingSkill = 0.2
	elseif MilkQ.PlayerREF.HasPerk(Haggling20)
		hagglingSkill = 0.15
	elseif MilkQ.PlayerREF.HasPerk(Haggling00)
		hagglingSkill = 0.1
	endif

	float goodCustomerModifier = Level / MilkQ.TimesMilkedMult
	float sellPriceModifier = (1 + hagglingSkill) * (1 + goodCustomerModifier) ;* 1.25
	baseTrade = (baseTrade / priceFactor * sellPriceModifier) as int

	return baseTrade
EndFunction

int Function CalculateServiceTax(int marketIndex, int basePayout)
	int fee = 0

	if marketIndex == 0
		fee = CalculateServiceTaxHelper(MilkEcoCaravan, basePayout)
	elseif marketIndex == 1
		fee = CalculateServiceTaxHelper(MilkEcoDawnstar, basePayout)
	elseif marketIndex == 2
		fee = CalculateServiceTaxHelper(MilkEcoFalkreath, basePayout)
	elseif marketIndex == 3
		fee = CalculateServiceTaxHelper(MilkEcoMarkarth, basePayout)
	elseif marketIndex == 4
		fee = CalculateServiceTaxHelper(MilkEcoOrc, basePayout)
	elseif marketIndex == 5
		fee = CalculateServiceTaxHelper(MilkEcoRiften, basePayout)
	elseif marketIndex == 6
		fee = CalculateServiceTaxHelper(MilkEcoSolitude, basePayout)
	elseif marketIndex == 7
		fee = CalculateServiceTaxHelper(MilkEcoWhiterun, basePayout)
	elseif marketIndex == 8
		fee = CalculateServiceTaxHelper(MilkEcoWindhelm, basePayout)
	elseif marketIndex == 9
		fee = CalculateServiceTaxHelper(MilkEcoMorrowind, basePayout)
	else
		; Catch all - fee is fixed at 50%
		fee = basePayout / 2
	endif

	return fee
EndFunction

int Function CalculateServiceTaxHelper(int varEco, int basePayout)
	float fBasePayout = basePayout as float
	int fee = 0
	if varEco < 0
		fee = (fBasePayout * 0.8) as int
	elseif varEco < 200/(MilkQ.TimesMilkedMult/divnull)
		fee = (fBasePayout * 0.3) as int
	elseif varEco < 400/(MilkQ.TimesMilkedMult/divnull)
		fee = (fBasePayout * 0.2) as int
	elseif varEco < 600/(MilkQ.TimesMilkedMult/divnull)
		fee = (fBasePayout * 0.1) as int
	endif
	return fee
EndFunction

int Function GetMarketIndexFromLocation(Location marketLocation)
	string locName = marketLocation.GetName()
	if locName == locDawnstar.GetName() || locName == locWindpeakInn.GetName() || locName == locDawnstarSanctuary.GetName()
		return 1
	elseif locName == locFalkreath.GetName() || locName == locWindpeakInn.GetName()
		return 2
	elseif locName == locMarkarth.GetName() || locName == locOldHroldan.GetName() || locName == locOldHroldanInn.GetName() || locName == locKarthwasten.GetName()
		return 3
	elseif locName == locMorKhazgur.GetName() || locName == locDushnikhYal.GetName() || locName == locNarzulbur.GetName() || locName == locLargashbur.GetName()
		return 4
	elseif locName == locRiften.GetName() || locName == locShorsStone.GetName()
		return 5
	elseif locName == locSolitude.GetName() || locName == locDragonBridge.GetName() || locName == locFourShieldsTavern.GetName() || locName == locMorthal.GetName()
		return 6
	elseif locName == locWhiterun.GetName() || locName == locRiverwood.GetName() || locName == locSleepingGiantInn.GetName() || locName == locRorikstead.GetName() || locName == locFrostfruitInn.GetName()
		return 7
	elseif locName == locWindhelm.GetName() || locName == locWinterhold.GetName() || locName == locTheFrozenHearth.GetName() || locName == locCollegeofWinterhold.GetName() || locName == locKynesgrove.GetName()
		return 8
		
	;DLC
	elseif locName == locHeljarchenHall.GetName() || locName == locWindstadManor.GetName()										;MilkQ.Plugin_HearthFires
		return 1
	elseif locName == locLakeviewManor.GetName() ; MilkQ.Plugin_HearthFires && 
		return 2
	elseif locName == locFortDawnguard.GetName() || locName == locDayspringCanyon.GetName()										;MilkQ.Plugin_Dawnguard
		return 5
	elseif locName == locRavenRock.GetName() || locName == locSkaalVillage.GetName() || locName == locTelMithryn.GetName()		;MilkQ.Plugin_Dragonborn
		return 9

	;none of above, returning khajit caravan
	else
		return 0
	endif
EndFunction

int Function GetRaceIndexFromRace(Race maidRace)

	if maidRace == MME_Races.GetAt(0)
		return 1
	elseif maidRace == MME_Races.GetAt(1)
		return 2
	elseif maidRace == MME_Races.GetAt(2)
		return 3
	elseif maidRace == MME_Races.GetAt(3)
		return 4
	elseif maidRace == MME_Races.GetAt(4)
		return 5
	elseif maidRace == MME_Races.GetAt(5)
		return 6
	elseif maidRace == MME_Races.GetAt(6)
		return 7
	elseif maidRace == MME_Races.GetAt(7)
		return 8
	elseif maidRace == MME_Races.GetAt(8)
		return 9
	elseif maidRace == MME_Races.GetAt(9)
		return 10
	else 				;maidRace == CustomRace
		return 11
	endif
EndFunction

Function UpdateEconomy(int marketIndex, int basePayout)
	int newValue = 0
	; Cannot count on the arrays
	
	if marketIndex == 0
		newValue = MilkEcoCaravan - basePayout
	elseif marketIndex == 1
		newValue = MilkEcoDawnstar - basePayout
	elseif marketIndex == 2
		newValue = MilkEcoFalkreath - basePayout
	elseif marketIndex == 3
		newValue = MilkEcoMarkarth - basePayout
	elseif marketIndex == 4
		newValue = MilkEcoOrc - basePayout
	elseif marketIndex == 5
		newValue = MilkEcoRiften - basePayout
	elseif marketIndex == 6
		newValue = MilkEcoSolitude - basePayout
	elseif marketIndex == 7
		newValue = MilkEcoWhiterun - basePayout
	elseif marketIndex == 8
		newValue = MilkEcoWindhelm - basePayout
	elseif marketIndex == 9
		newValue = MilkEcoMorrowind - basePayout
	endif	

	if newValue < -500/(MilkQ.TimesMilkedMult/divnull)
		newValue = -500/(MilkQ.TimesMilkedMult/divnull)
	endif

	if newValue < 0 && MilkQ.MilkEMsgs
		Debug.Notification("There is no demand for milk " + MarketNames[marketIndex] + "!")
	endif

	if marketIndex == 0
		MilkEcoCaravan = newValue
	elseif marketIndex == 1
		MilkEcoDawnstar = newValue
	elseif marketIndex == 2
		MilkEcoFalkreath= newValue
	elseif marketIndex == 3
		MilkEcoMarkarth = newValue
	elseif marketIndex == 4
		MilkEcoOrc = newValue
	elseif marketIndex == 5
		MilkEcoRiften = newValue
	elseif marketIndex == 6
		MilkEcoSolitude = newValue
	elseif marketIndex == 7
		MilkEcoWhiterun = newValue
	elseif marketIndex == 8
		MilkEcoWindhelm = newValue
	elseif marketIndex == 9
		MilkEcoMorrowind = newValue
	endif
EndFunction

Function BeginMilkEcoCycle()
	PrevMilkEcos = new Int[10]
	CurrMilkEcos = new Int[10]
	
	PrevMilkEcos[0] = MilkEcoCaravan
	PrevMilkEcos[1] = MilkEcoDawnstar
	PrevMilkEcos[2] = MilkEcoFalkreath
	PrevMilkEcos[3] = MilkEcoMarkarth
	PrevMilkEcos[4] = MilkEcoOrc
	PrevMilkEcos[5] = MilkEcoRiften
	PrevMilkEcos[6] = MilkEcoSolitude
	PrevMilkEcos[7] = MilkEcoWhiterun
	PrevMilkEcos[8] = MilkEcoWindhelm
	PrevMilkEcos[9] = MilkEcoMorrowind

	CurrMilkEcos[0] = PrevMilkEcos[0]
	CurrMilkEcos[1] = PrevMilkEcos[1]
	CurrMilkEcos[2] = PrevMilkEcos[2]
	CurrMilkEcos[3] = PrevMilkEcos[3]
	CurrMilkEcos[4] = PrevMilkEcos[4]
	CurrMilkEcos[5] = PrevMilkEcos[5]
	CurrMilkEcos[6] = PrevMilkEcos[6]
	CurrMilkEcos[7] = PrevMilkEcos[7]
	CurrMilkEcos[8] = PrevMilkEcos[8]
	CurrMilkEcos[9] = PrevMilkEcos[9]
EndFunction

Function EndMilkEcoCycle()
	int index = 0
	while index < 10
		if PrevMilkEcos[index] < 1000/(MilkQ.TimesMilkedMult/divnull) && CurrMilkEcos[index] == 1000/(MilkQ.TimesMilkedMult/divnull) && MilkQ.MilkEMsgs
			Debug.Notification("The demand for milk " + MarketNames[index] + " is high!")
		endif
		if PrevMilkEcos[index] <= 0 && CurrMilkEcos[index] > 0 && MilkQ.MilkEMsgs
			Debug.Notification("Milk demand has normalized " + MarketNames[index] + ".")
		endif

		index += 1
	endwhile

	MilkEcoCaravan = CurrMilkEcos[0]
	MilkEcoDawnstar = CurrMilkEcos[1]
	MilkEcoFalkreath = CurrMilkEcos[2]
	MilkEcoMarkarth = CurrMilkEcos[3]
	MilkEcoOrc = CurrMilkEcos[4]
	MilkEcoRiften = CurrMilkEcos[5]
	MilkEcoSolitude = CurrMilkEcos[6]
	MilkEcoWhiterun = CurrMilkEcos[7]
	MilkEcoWindhelm = CurrMilkEcos[8]
	MilkEcoMorrowind = CurrMilkEcos[9]

 	MilkDemandCaravan = MilkDemands[0]
 	MilkDemandDawnstar = MilkDemands[1]
	MilkDemandFalkreath = MilkDemands[2]
	MilkDemandMarkarth = MilkDemands[3]
	MilkDemandOrc = MilkDemands[4]
	MilkDemandRiften = MilkDemands[5]
	MilkDemandSolitude = MilkDemands[6]
	MilkDemandWhiterun = MilkDemands[7]
	MilkDemandWindhelm = MilkDemands[8]
	MilkDemandMorrowind = MilkDemands[9]
EndFunction

Function MilkEcoRestore()
	int index = 0
	while index < 10
		CurrMilkEcos[index] = PrevMilkEcos[index] + 100/(MilkQ.TimesMilkedMult/divnull)
		if CurrMilkEcos[index] > 1000/(MilkQ.TimesMilkedMult/divnull)
			CurrMilkEcos[index] = 1000/(MilkQ.TimesMilkedMult/divnull)
		endif

		index += 1
	endwhile
EndFunction

Function MilkEcoSaturationEvent()
	int[] marketsAtCap = new int[10]
	int j = 0										; count of marketsAtCap
	int i = 0
	while i < 10
		if CurrMilkEcos[i] == 1000/(MilkQ.TimesMilkedMult/divnull)
			marketsAtCap[j] = i
			j += 1
		endif
		i += 1
	endwhile

	; Reduce Market indices if more than 5 markets at cap at the same time.
	if j >= 4
		; Notification("Saturation Event has been hit")
		j -= 1
		while j >= 0
			int k = Utility.RandomInt(0, SaturationPenalties.Length - 1)
			int l = marketsAtCap[j]
			CurrMilkEcos[l] = CurrMilkEcos[l] - SaturationPenalties[k]
			j -= 1
		endwhile
	endif
EndFunction

Function MilkEcoDemandEvent()
	int i = 0
	int j = 0										; count of marketsWithDemand
	int[] marketsWithDemand = new int[10]
	int k = 0										; count of marketsWithoutDemand
	int[] marketsWithoutDemand = new int[10]
	while i < 10
		if MilkDemandCDs[i] > 0
			MilkDemandCDs[i] = MilkDemandCDs[i] - 1
			if MilkDemandCDs[i] == 0
				if MilkQ.MilkEMsgs
					Debug.Notification("Craze for " + MilkNames[MilkDemands[i]] + " " + MarketNames[i] + " has faded.")
				endif
				MilkDemands[i] = 0					; Set demand to nothing
				marketsWithDemand[j] = i			; Exclude most recently retired ones
				j += 1
			else
				marketsWithDemand[j] = i
				j += 1
			endif
		else
			marketsWithoutDemand[k] = i
			k += 1
		endif
		i += 1
	endwhile

	if k > 0
		; The fewer demands going on, the higher chance a demand appears
		int chance = Utility.RandomInt(0, 100 + (j - k) * 5)
		; Notification("Chance is: " + chance)
		if chance <= 49
			int randomMarket = Utility.RandomInt(0, k - 1)
			int marketIndex = marketsWithoutDemand[randomMarket]
			int milkIndex = Utility.RandomInt(1, 10)
			MilkDemands[marketIndex] = milkIndex
			MilkDemandCDs[marketIndex] = 6
			if MilkQ.MilkEMsgs
				Debug.Notification(MilkNames[milkIndex] + " craze has begun " + MarketNames[marketIndex]) 
			endif
			; if demand is poor, immediately raise to an acceptable level
			if CurrMilkEcos[marketIndex] < 750/(MilkQ.TimesMilkedMult/divnull)
				CurrMilkEcos[marketIndex] = 750/(MilkQ.TimesMilkedMult/divnull)
			endif
		endif
	endif
EndFunction