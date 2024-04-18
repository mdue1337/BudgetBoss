extends ConfirmationDialog

func _on_ConfirmationDialog_confirmed():
	var nodeInfo = get_parent().get_parent().get_node("AcceptDialog")
	
	if Gs.moneyBank >= 50 && Gs.hunger < 10:
		nodeInfo.dialog_text = "Food was delicious... \n Hunger level has increased!"
		nodeInfo.visible = true;
		Gs.emit_signal("bankCounter", -50)
		Gs.emit_signal("hungerCounter", 5)
		Gs.eatCount += 1
	else:
		nodeInfo.dialog_text = "No food for you"
		nodeInfo.visible = true;
		
	if Gs.eatCount == 1:
		Gs.achievementDB = 2 
		Gs.emit_signal("add_user_achievement")
		var main_scene = get_parent().get_parent()
		var achievement = main_scene.get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
