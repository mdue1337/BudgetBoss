extends TextureButton

func _on_TextureButton_pressed():
	get_parent().visible = false
	get_tree().change_scene("res://Scenes/Market.tscn")
