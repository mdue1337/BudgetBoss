extends Node2D

var radioParts = Gs.radioParts



func _ready():
	pass # Replace with function body.


#

func _on_Radio_pressed():
	if radioParts == 16:
		get_tree().change_scene("res://Scenes/gameWon.tscn")
	else:
		get_node("AcceptDialog").visible = true
		
		
