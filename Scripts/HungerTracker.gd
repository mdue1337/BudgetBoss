extends Control

func _ready():
	Gs.connect("hungerCounter", self, "updateHunger")
	displayHunger()
	
func updateHunger(count : int):
	Gs.hunger += count;
	if (Gs.hunger > 10):
		Gs.hunger = 10
	displayHunger()
	checkIfDead()

func displayHunger():
	$Label.text = "Hunger: " + str(Gs.hunger) + "/10"

func checkIfDead():
	if Gs.hunger <= 0:
		get_tree().change_scene("res://Seenes/GameLose.tscn")
