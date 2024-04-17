extends Node2D

var nuts = 5
var bolts = 5

var selected = false

func _process(delta):
	if selected:
		followMouse()

func _input(event):
	if Input.is_action_just_pressed("mouse_left"):
		var l = global_position - get_global_mouse_position()
		if l.length() < 35:
			selected = !selected
			print("selected")
		else:
			selected = false

func followMouse():
	global_position = get_global_mouse_position()

func _on_NutBox_area_entered(area):
	if str(area).begins_with("Nut"):
		area.get_parent().queue_free()

		nuts -= 1
		if nuts < 0:
			nuts = 0
		print("Nuts left: " + str(nuts))
		is_game_won()

func _on_BoltBox_area_entered(area):
	if str(area).begins_with("Bolt"):
		area.get_parent().queue_free()
		bolts -= 1
		if bolts < 0:
			bolts = 0
		print("Bolts left: "+str(bolts))
		is_game_won()


func is_game_won():
	if nuts == 0 and bolts == 0:
		get_node("GameWin").visible = true
	else:
		pass


func _on_GameWin_confirmed():
	Gs.hasWorkedToday = true;
	Gs.workCount += 1
	Gs.emit_signal("workpay",1)
	Gs.emit_signal("hungerCounter", -4)
	yield(get_tree().create_timer(1), "timeout")
	
	if Gs.workCount == 1:
		Gs.achievementDB = 1
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
	if Gs.workCount == 10:
		Gs.achievementDB = 4
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
	if Gs.workCount == 25:
		Gs.achievementDB = 5
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
	if Gs.workCount == 50:
		Gs.achievementDB = 6
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
	get_tree().change_scene("res://Scenes/Camp.tscn")
