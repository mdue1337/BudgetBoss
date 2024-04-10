extends Button




func _on_cheats_pressed():
	Gs.emit_signal("bankCounter", 2000)
	Gs.emit_signal("moneyCounter", 3000)
	Gs.medicineCount = 1;
	Gs.illnessLevel = 2;
	print("AAAAAAAAAAAAA")
	Gs.accident = true;
	get_tree().change_scene("res://Scenes/Hospital.tscn")
