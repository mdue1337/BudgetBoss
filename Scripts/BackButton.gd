extends TextureButton

func _on_TextureButton_pressed():
	get_parent().visible = false
	print("Object hidden: " + str(get_parent().name))
	get_tree().change_scene("res://Scenes/Market.tscn")
