extends Node2D

var Factory1 = preload("res://Scenes/FactoryScenes/Factory1.tscn")
var Factory2 = preload("res://Scenes/FactoryScenes/Factory2.tscn")
var Factory3 = preload("res://Scenes/FactoryScenes/Factory3.tscn")


func _on_Factory_pressed():
	get_tree().change_scene("res://Scenes/FactoryScenes/Factory1.tscn")

func _on_Factory2_pressed():
	if (Gs.work > 1):
		get_tree().change_scene("res://Scenes/FactoryScenes/Factory2.tscn")
	else:
		get_node("AcceptDialog").visible = true
		print("noaccess")

func _on_Factory3_pressed():
	if (Gs.work > 2):
		get_tree().change_scene("res://Scenes/FactoryScenes/Factory3.tscn")
	else:
		get_node("AcceptDialog").visible = true
		print("noaccess")
