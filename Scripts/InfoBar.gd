extends Node2D

func _ready():
	Gs.moneyBank = 10000
	Gs.moneyPerson =235
	Gs.days = 7
	
	var Cash = get_node("TextureRect/HBoxContainer/Cash");
	var Bank = get_node("TextureRect/HBoxContainer/Bank");
	var Day = get_node("TextureRect/HBoxContainer/Day");
	
	Cash.text = "Cash: " + str(Gs.moneyPerson)
	Bank.text = "Bank: " + str(Gs.moneyBank)
	Day.text = "Day: " + str(Gs.days)
	
	print(Cash.text)
	print(Bank.text)
	print(Day.text)

	# Resize the fields to fit the text
	resize_fields([Cash, Bank, Day])
	
	# Move the labels within the HBoxContainer
	move_labels([Cash, Bank, Day])

func resize_fields(fields):
	for field in fields:
		field.rect_min_size = field.get_font("default_font").get_string_size(field.text)

func move_labels(labels):
	var position_x = 0
	for label in labels:
		print(label.rect_position.x)
		label.rect_position.x = position_x
		position_x += label.rect_min_size.x + 100  # Add some padding between labels
		print(label.rect_position.x)
