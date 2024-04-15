extends Node2D

func _ready():
	if Gs.hunger == 0:
		print(212002)
		$WARNING.dialog_text = "HUNGER CRITICAL, PLEASE EAT"
		$WARNING.visible = true

func _on_Radio_pressed():
	get_tree().change_scene("res://Scenes/Radio.tscn")

func _on_TextureButton_pressed():
	get_node("SleepConfirm").visible = true
	Gs.hasWorkedToday = false;
	Gs.emit_signal("dayCounter")

func _on_Bonfire_pressed():
	get_node("Bonfire/ConfirmationDialog").visible = true
	print("hej martin dum")
