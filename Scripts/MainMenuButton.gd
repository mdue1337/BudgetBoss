extends TextureButton

func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
	print("sendt til Main menu")
