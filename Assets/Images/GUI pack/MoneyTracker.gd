extends Control

func _ready():
	Gs.connect("moneyCounter", self, "updateMoney")
	displayDays()

func updateMoney():
	Gs.moneyPerson += 1
	displayDays()

func displayDays():
	$Label.text = "Money: " + str(Gs.moneyPerson) + "$"
	print(Gs.moneyPerson)
