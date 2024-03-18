extends TextureButton

func _on_Map_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")
	print("Going to scnee...")
