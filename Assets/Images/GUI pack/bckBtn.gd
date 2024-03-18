extends TextureButton

func _on_Button_pressed():
	print(1)
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
