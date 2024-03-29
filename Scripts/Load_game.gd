extends TextureButton

func _on_Load_game_pressed():
	Gs.emit_signal("load_game")
	Gs.connect("response", self, "handle_response")

func handle_response(response):
	print(response.response["data"][0]["Id"])
	Gs.gameId = response.response["data"][0]["Id"]
	Gs.moneyBank = response.response["data"][0]["Money"]
	Gs.days = response.response["data"][0]["Days"]
	Gs.upgrades = response.response["data"][0]["Upgrades"]
	Gs.bills = response.response["data"][0]["Bills"]
	Gs.work = response.response["data"][0]["Work"]
	Gs.radioParts = response.response["data"][0]["RadioParts"]
	Gs.hunger = response.response["data"][0]["Hunger"]
	get_tree().change_scene("res://Scenes/Map.tscn")
