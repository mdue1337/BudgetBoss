extends Node2D

func _ready():
	$Label2.text = str(Gs.radioParts) + " acquired out of 5 parts"

func _on_Radio_pressed():
	if Gs.radioParts == 5:
		Gs.emit_signal("save_leaderboard")
		get_tree().change_scene("res://Scenes/gameWin.tscn")
	else:
		print(3)
		get_node("AcceptDialog").visible = true
	
	
