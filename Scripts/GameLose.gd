extends Control

func _on_TextureButton2_pressed():
	Gs.loadGameId = Gs.gameId
	Gs.emit_signal("load_game")
	Gs.connect("response", self, "handle_response")

func _on_TextureButton3_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")

func handle_response(response):
	print(response)
	if response.error != "database_error":
		Gs.gameId = response.response["data"][0]["Id"]
		Gs.moneyBank = response.response["data"][0]["Money"]
		Gs.days = response.response["data"][0]["Days"]
		Gs.bills = response.response["data"][0]["Bills"]
		Gs.work = response.response["data"][0]["Work"]
		Gs.radioParts = response.response["data"][0]["RadioParts"]
		Gs.hunger = response.response["data"][0]["Hunger"]
		Gs.medicineCount = response.response["data"][0]["MedicineCount"]
		
		Gs.moneyPerson = 0
		Gs.hasWorkedToday = false;
		Gs.bills = 0;
		Gs.hasHadAccident = false;
		Gs.eatCount = 0;
		Gs.workCount = 0;
		Gs.sleepCount = 0;
		Gs.accident = false;
		Gs.newPLayer = true;
		
		get_tree().change_scene("res://Scenes/Map.tscn")
	else:
		pass
