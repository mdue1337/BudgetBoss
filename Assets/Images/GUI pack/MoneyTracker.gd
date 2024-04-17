extends Control

func _ready():
	Gs.connect("moneyCounter", self, "updateMoney")
	displayDays()

func updateMoney(amount : int):
	Gs.moneyPerson += amount
	displayDays()
	BackgroundMusic.get_node("coin_sound").play()

func displayDays():
	$Label.text = "Money: " + str(Gs.moneyPerson) + "$"
	print(Gs.moneyPerson)
