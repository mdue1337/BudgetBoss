extends ScrollContainer

var data = [];

func _ready():
	Gs.emit_signal("load_game_five")
	Gs.connect("response", self, "handle_response")

func handle_response(response):
	if response.error == "database_error":
		return
	
	var data_array = response["response"]["data"]
	var n = data_array.size()
	
	for i in range(n):
		data.append(data_array[i - 1])
		
	visualize()

func visualize():
	var vbox = VBoxContainer.new()
	add_child(vbox)

	# Indlæs skrifttypen
	var font = load("res://fonts/poco/Poco.tres")
	var texture = load("res://Assets/Images/GUI pack/Prinbles_GUI_Asset_Silent (1.0.0)/asset/BlankButton.png")

	for data_point in data:
		var textureBtn = TextureButton.new()
		textureBtn.name = data_point["Id"]
		textureBtn.texture_normal = texture
		textureBtn.size_flags_vertical = Control.SIZE_EXPAND_FILL
		textureBtn.rect_min_size = Vector2(800, 150)  # Juster højden efter behov
		textureBtn.expand = true;
		textureBtn.connect("pressed", self, "_on_texture_button_pressed", [textureBtn])
		vbox.add_child(textureBtn)

		# Label for titel
		var title_label = Label.new()
		title_label.text = "               Game Id: " + str(data_point["Id"])
		title_label.align = Label.ALIGN_CENTER
		title_label.valign = Label.VALIGN_CENTER
		title_label.rect_position.y += 20
		title_label.add_font_override("font", font) 
		textureBtn.add_child(title_label)

		# Label for beskrivelse
		var des_label = Label.new()
		des_label.text = "         Days: " + str(data_point["Days"]) + ", Money: " + str(data_point["Money"]) + ", Hunger: " + str(data_point["Hunger"]);
		des_label.align = Label.ALIGN_CENTER
		des_label.valign = Label.VALIGN_CENTER
		des_label.rect_position.y = title_label.rect_size.y + 25  # Juster y-koordinaten for at placere den under title_label
		des_label.add_font_override("font", font)  # Tilføj skrifttypen til labelen
		textureBtn.add_child(des_label)

	set_custom_minimum_size(Vector2(300, 500))

func _on_texture_button_pressed(button):
	print("Button pressed: ", button.name)
	Gs.loadGameId = int(button.name)
	Gs.emit_signal("load_game")
	Gs.connect("response", self, "loadGame")
	
func loadGame(response):
	if response.error != "database_error":
		print(response.response["data"][0])
		Gs.gameId = response.response["data"][0]["Id"]
		Gs.moneyBank = response.response["data"][0]["Money"]
		Gs.days = response.response["data"][0]["Days"]
		Gs.bills = response.response["data"][0]["Bills"]
		Gs.work = response.response["data"][0]["Work"]
		Gs.radioParts = response.response["data"][0]["RadioParts"]
		Gs.hunger = response.response["data"][0]["Hunger"]
		Gs.medicineCount = response.response["data"][0]["MedicineCount"]
		
		## reset local
		Gs.hasHadAccident = false;
		Gs.hasWorkedToday = false;
		Gs.eatCount = 0;
		Gs.workCount = 0;
		Gs.sleepCount = 0;
		Gs.accident = false;
		Gs.newPLayer = true;
		
		get_tree().change_scene("res://Scenes/Map.tscn")
	else:
		get_parent().get_parent().get_node("NoLogin").visible = true
