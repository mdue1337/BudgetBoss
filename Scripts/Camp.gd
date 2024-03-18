extends Node2D

var hunger = 0


func _on_Radio_pressed():
	get_tree().change_scene("res://Scenes/Radio.tscn")


func _on_TextureButton_pressed():
	Gs.emit_signal("dayCounter")
	


func _on_Bonfire_pressed():
	hunger += 50
	get_node("AcceptDialog").visible = true
