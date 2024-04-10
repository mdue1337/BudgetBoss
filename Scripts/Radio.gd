extends Node2D

func _ready():
	$Label2.text = str(Gs.radioParts) + " acquired out of 5 parts"

func _on_Radio_pressed():
	if Gs.radioParts == 5:
		if Gs.bills == 0:
			Gs.emit_signal("save_leaderboard")
			get_tree().change_scene("res://Scenes/gameWin.tscn")
		else:
			get_node("AcceptDialog").dialog_text = "Man løber altså ikke fra sine regninger. Betal dine regninger før du kan slutte spillet"
			get_node("AcceptDialog").visible = true
	else:
		print(3)
		get_node("AcceptDialog").visible = true
	
	
