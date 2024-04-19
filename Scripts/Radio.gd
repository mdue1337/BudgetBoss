extends Node2D

func _ready():
	$Label2.text = str(Gs.radioParts) + " acquired out of 5 parts"

func _on_Radio_pressed():
	if Gs.radioParts == 5:
		if Gs.bills == 0:
			if Gs.work == 3:
				Gs.emit_signal("save_game")
				yield(get_tree().create_timer(1), "timeout")
				Gs.emit_signal("save_leaderboard")
				get_tree().change_scene("res://Scenes/gameWin.tscn")
			else:
				get_node("AcceptDialog").dialog_text = "Du skal huske at få købt alle bøgerne og lære en masse om økonomi"
				get_node("AcceptDialog").visible = true
		else:
			get_node("AcceptDialog").dialog_text = "Man løber altså ikke fra sine regninger. Betal dine regninger før du kan slutte spillet"
			get_node("AcceptDialog").visible = true
	else:
		get_node("AcceptDialog").dialog_text = "Hmmm... Still doesn't work. We need to find or buy more parts for the radio"
		get_node("AcceptDialog").visible = true
	
	
