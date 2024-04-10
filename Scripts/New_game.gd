extends TextureButton

func _on_New_game_pressed():
	Gs.emit_signal("create_game")
	Gs.connect("response", self, "handle_response")

func handle_response(response):
	Gs.gameId = response.response["game_id"][0]
	Gs.moneyBank = 0
	Gs.days = 0
	Gs.bills = 0
	Gs.work = 1
	Gs.radioParts = 0
	Gs.hunger = 10
	get_tree().change_scene("res://Scenes/Map.tscn")
