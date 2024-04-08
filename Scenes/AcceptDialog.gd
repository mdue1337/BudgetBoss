extends AcceptDialog

func _on_AcceptDialog_confirmed():
	get_tree().change_scene("res://Scenes/Camp.tscn")
