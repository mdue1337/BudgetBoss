extends AcceptDialog

func _on_SleepConfirm_confirmed():
	Gs.sleepCount += 1
	
	if Gs.sleepCount == 1:
		Gs.achievementDB = 3
		Gs.emit_signal("add_user_achievement")
		var main_scene = get_parent()
		var achievement = main_scene.get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
		
