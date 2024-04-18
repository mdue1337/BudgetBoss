extends Node2D

var rng = RandomNumberGenerator.new();
var Income : int;
var Expense : int;
var exProfit : int;


func _ready():
	rng.randomize()
	Income = rng.randi_range(1000,10000)
	rng.randomize()
	Expense = rng.randi_range(1000,10000)
	exProfit = Income - Expense;
	
	get_node("Income").text = str(Income)
	get_node("Expenses").text = str(Expense)

func _on_Submit_pressed():
	var profit = int(get_node("ProfitLabel/Profit").text)
	print("Expected Profit: " + str(exProfit))
	print("Calculated Profit: " + str(profit))
	if profit == exProfit:
		get_node("GameWin").visible = true
		print("win")
	else:
		get_node("Error").visible = true
		print("wrong")

func _on_GameWin_confirmed():
	Gs.hasWorkedToday = true;
	Gs.emit_signal("workpay", 2)
	Gs.emit_signal("hungerCounter", -3)
	Gs.workCount += 1
	print(Gs.workCount)
	if Gs.workCount == 1:
		Gs.achievementDB = 1
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
		yield(get_tree().create_timer(3), "timeout")
		get_tree().change_scene("res://Scenes/Camp.tscn")
	if Gs.workCount == 10:
		Gs.achievementDB = 4
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
		yield(get_tree().create_timer(3), "timeout")
		get_tree().change_scene("res://Scenes/Camp.tscn")
	if Gs.workCount == 25:
		Gs.achievementDB = 5
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
		yield(get_tree().create_timer(3), "timeout")
		get_tree().change_scene("res://Scenes/Camp.tscn")
	if Gs.workCount == 50:
		Gs.achievementDB = 6
		Gs.emit_signal("add_user_achievement")
		var achievement = get_node("AchievementPopUp") 
		achievement.call("write_label", Gs.achievementDB)
		achievement.visible = true
		yield(get_tree().create_timer(3), "timeout")
		get_tree().change_scene("res://Scenes/Camp.tscn")
	else:
		get_tree().change_scene("res://Scenes/Camp.tscn")
