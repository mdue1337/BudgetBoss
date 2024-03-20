extends Node2D

func _ready():
	Gs.moneyBank = 10000
	Gs.moneyPerson =235
	Gs.days = 7
	
	var Cash = get_node("TextureRect/HBoxContainer/Cash");
	var Bank = get_node("TextureRect/HBoxContainer/Bank");
	var Day = get_node("TextureRect/HBoxContainer/Day");
	var Hunger = get_node("TextureRect/HBoxContainer/Hunger");
	
	Cash.text = "Cash: " + str(Gs.moneyPerson)
	Bank.text = "Bank: " + str(Gs.moneyBank)
	Day.text = "Day: " + str(Gs.days)
	Hunger.text = "Hunger: " + str(Gs.hunger)
	
	print(Cash.text)
	print(Bank.text)
	print(Day.text)
	print(Hunger.text)

	# Resize the fields to fit the text
	resize_fields([Cash, Bank, Day, Hunger])
	
	# Move the labels within the HBoxContainer
	move_labels([Cash, Bank, Day, Hunger])

func resize_fields(fields):
	for field in fields:
		field.rect_min_size = field.get_font("default_font").get_string_size(field.text)

func move_labels(labels):
	var position_x = 0
	for label in labels:
		print(label.rect_position.x)
		label.rect_position.x = position_x
		position_x += label.rect_min_size.x + 150;
		print(label.rect_position.x)
		
