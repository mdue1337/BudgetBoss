extends Control

func _ready():
	Gs.connect("bankCounter", self, "updateBank")
	displayBank()

func updateBank(count : int):
	Gs.moneyBank += count
	displayBank()

func displayBank():
	$Label.text = "Bank: " + str(Gs.moneyBank) + "$"
