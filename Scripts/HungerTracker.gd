extends Control
var hospitalChance : int;

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
	
	hospitalChance = RandomNumberGenerator.new().randi_range(1,10)
	print("her er et tal " + str(hospitalChance));
	if (hospitalChance == 1):
		Gs.accident = true;
		get_tree().change_scene("res://Scenes/Hospital.tscn")
	

func displayHunger():
	$Label.text = "Hunger: " + str(Gs.hunger) + "/10"
