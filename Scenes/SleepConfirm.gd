extends AcceptDialog

func _on_SleepConfirm_confirmed():
	Gs.sleepCount += 1
	
	if Gs.sleepCount == 1:
		Gs.achievementDB = 3
		Gs.emit_signal("add_user_achievement", Gs.achievementDB)
		var main_scene = get_parent()
		
		var achievement = main_scene.get_node("AchievementPopUp") 
		achievement._show_popup()
	get_tree().change_scene("res://Scenes/Map.tscn")
