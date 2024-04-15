extends Node2D

func _ready():
	if (Gs.days > 0):
		get_parent().get_node("TutorialText").visible = false
