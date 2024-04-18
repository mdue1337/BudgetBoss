extends Control

var money : Array;
var days : Array;
var sorted : Array;
var daysUpdated : bool = false;

func _ready():
	Gs.emit_signal("get_leaderboard_days")
	Gs.connect("response", self, "handle_response")

func secondQuery():
	Gs.emit_signal("get_leaderboard_money")

func handle_response(response):
	var data = response.response["data"]
	
	if daysUpdated == true:
		updateMoney(data)
	else:
		updateDays(data)
	
	print(response)

func updateMoney(data):
	var count = data.size()
	
	if(count > 5):
		count = 5;
	
	for i in range (count):
		var label_text = str(data[i].Money) + "$ by: " + str(data[i].Name)
		
		if i == 0:
			$VBoxContainer2/Label.text = label_text
		else:
			$VBoxContainer2/Label.text = $VBoxContainer2/Label.text + "\n\n\n\n" + label_text

func updateDays(data):
	var count = data.size()
	
	if(count > 5):
		count = 5;
	
	for i in range (count):
		var label_text = str(data[i].Days) + " days by: " + str(data[i].Name)
		if i == 0:
			$VBoxContainer3/Label.text = label_text
		else:
			$VBoxContainer3/Label.text = $VBoxContainer3/Label.text + "\n\n\n\n" + label_text
	
	#dynamic show boxes
	if count > 0:
		get_node("TextureRect").visible = true
	if count > 1:
		get_node("TextureRect2").visible = true
	if count > 2:
		get_node("TextureRect3").visible = true
	if count > 3:
		get_node("TextureRect4").visible = true
	if count > 4:
		get_node("TextureRect5").visible = true
	
	daysUpdated = true
	secondQuery()
