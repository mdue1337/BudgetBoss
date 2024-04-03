extends Node2D

func _ready():
	$"TextureRect/Welcome".text = "Welcome " + str(Gs.fullName)
