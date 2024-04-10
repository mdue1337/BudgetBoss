extends Node2D

var rng = RandomNumberGenerator.new()
var Income = rng.randi_range(1000,10000)
var Expense = rng.randi_range(1000,10000)
var exProfit = Income - Expense


func _ready():
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
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Scenes/Camp.tscn")
