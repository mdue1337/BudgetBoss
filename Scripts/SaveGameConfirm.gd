extends ConfirmationDialog

func _on_SaveGameConfirm_confirmed():
	print("save")
	Gs.emit_signal("save_game")
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")

func _on_SaveGameConfirm_visibility_changed():
	if visible == false:
		get_tree().change_scene("res://Scenes/Main_Menu.tscn")
