extends Control

func _ready():
	Gs.connect("bankCounter", self, "updateBank")
	displayBank()
	print("BankTracker Loaded...")

func updateBank(count : int):
	Gs.moneyBank = Gs.moneyBank + count
	displayBank()

func displayBank():
	$Label.text = "Bank: " + str(Gs.moneyBank) + "$"
	print("Moneybank now: " + str(Gs.moneyBank))
