extends Control

func _ready():
	Gs.connect("hungerCounter", self, "updateHunger")
	displayHunger()
	
func updateHunger(count : int):
	Gs.hunger += count;
	if (Gs.hunger > 10):
		Gs.hunger = 10
	displayHunger()

func displayHunger():
	$Label.text = "Hunger: " + str(Gs.hunger) + " out of 10"
