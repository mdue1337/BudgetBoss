extends Control

func _ready():
	Gs.connect("dayCounter", self, "updateDays")
	displayDays()
	
func updateDays():
	Gs.days = Gs.days + 1;
	displayDays()

func displayDays():
	$Label.text = "Days: " + str(Gs.days)
