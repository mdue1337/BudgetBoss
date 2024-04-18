extends TextureButton

var pressed_once = false;

func _on_New_game_pressed():
	if pressed_once:
		Gs.emit_signal("create_game")
		Gs.connect("response", self, "handle_response")
	else:
		print("Player has been warned...");
		get_parent().get_node("GameWarning").visible = true;
		pressed_once = true;

func handle_response(response):
	print(response)
	Gs.gameId = response.response["game_id"]
	print(Gs.gameId)
	Gs.moneyBank = 0
	Gs.days = 0
	Gs.bills = 0
	Gs.work = 1
	Gs.radioParts = 0
	Gs.hunger = 10
	Gs.medicineCount = 0;
	
	## reset all
	Gs.moneyPerson = 0
	Gs.hasHadAccident = false
	Gs.hasWorkedToday = false;
	Gs.eatCount = 0;
	Gs.workCount = 0;
	Gs.sleepCount = 0;
	Gs.accident = false;
	Gs.newPLayer = true;
	
	get_tree().change_scene("res://Scenes/Map.tscn")
