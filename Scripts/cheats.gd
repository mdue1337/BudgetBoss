extends Button




func _on_cheats_pressed():
	Gs.emit_signal("bankCounter", 2000)
	Gs.emit_signal("moneyCounter", 3000)
	Gs.illnessLevel = 2;
	print("AAAAAAAAAAAAA")
