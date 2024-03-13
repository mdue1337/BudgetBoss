extends Control

var money : Array;
var days : Array;

func _ready():
	Gs.emit_signal("get_leaderboard")
	Gs.connect("response", self, "handle_response")

func handle_response(response):
	var data = response.response["data"]
	print(data[0].Money)
	money = bubblesort(data, "Money")
	days = bubblesort(data, "Days")
	print(money)
	print(days)
	updateMoney(money)
	updateDays(days)

func bubblesort(data, param):
	var n = data.size()

	for i in range(n):
		for j in range(n - i - 1):
			if data[j].param > data[j + 1].param:
				# Swap elements if they are in the wrong order
				var temp = data[j]
				data[j] = data[j + 1]
				data[j + 1] = temp
	
	return data

func updateMoney(data):
	for i in range (1): # skal være 5
		var label_text = str(data[i].Money) + "$ by: " + str(data[i].Name)
		
		if i == 0:
			$VBoxContainer/Label.text = label_text
		else:
			var label = Label.new()
			label.text = label_text
			$VBoxContainer.add_child(label)

func updateDays(data):
	for i in range (1): # skal være 5
		var label_text = str(data[i].Days) + " days by: " + str(data[i].Name)
		if i == 0:
			$VBoxContainer2/Label.text = label_text
		else:
			var label = Label.new()
			label.text = label_text
			$VBoxContainer2.add_child(label)
