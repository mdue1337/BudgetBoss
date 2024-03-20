extends AcceptDialog

func _on_SleepConfirm_confirmed():
	get_tree().change_scene("res://Scenes/Map.tscn")
