extends Control

func _ready():
	print("script loaded hello ")
	Gs.connect("hungerCounter", self, "updateHunger")
	displayHunger()
	
func updateHunger(count : int): ## -4
	print("Gs before " + str(Gs.hunger))
	Gs.hunger += count;
	print("Gs after " + str(Gs.hunger))
	if (Gs.hunger > 10):
		Gs.hunger = 10
	elif Gs.hunger < -1:
		get_tree().change_scene("res://Scenes/GameLose.tscn")
	displayHunger()

func displayHunger():
	$Label.text = "Hunger: " + str(Gs.hunger) + "/10"
