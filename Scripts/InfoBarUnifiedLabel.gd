extends Label

func _process(delta):
	var text = get_parent().get_node("HBoxContainer/MoneyCounter/Label").text + "  |  " + get_parent().get_node("HBoxContainer/DayCounter/Label").text + "  |  " + get_parent().get_node("HBoxContainer/HungerTracker/Label").text + "  |  " + get_parent().get_node("HBoxContainer/BankTracker/Label").text
	get_parent().get_node("UniLabel").text = text
