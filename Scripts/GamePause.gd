extends Control

func _on_Inventory_pressed():
	get_node("Inventory").visible = true;

func _on_ExitBtn_pressed():
	$CenterContainer/VBoxContainer/ExitBtn/SaveGameConfirm.visible = true

func _on_SaveGame_pressed():
	Gs.emit_signal("save_game")
	Gs.connect("response", self, "temp")
	$CenterContainer/VBoxContainer/SaveGame/popupSave.visible = true

func _on_Continue_pressed():
	visible = false

func temp(response):
	print(response)
