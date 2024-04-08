extends Node2D

var radioParts = Gs.radioParts

func _ready():
	$Label2.text = str(Gs.radioParts) + " acquired out of 5 parts"

func _on_Radio_pressed():
	if radioParts == 5:
		get_tree().change_scene("res://Scenes/gameWon.tscn")
	else:
		get_node("AcceptDialog").visible = true
	
	
