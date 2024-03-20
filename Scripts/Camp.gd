extends Node2D

func _on_Radio_pressed():
	get_tree().change_scene("res://Scenes/Radio.tscn")


func _on_TextureButton_pressed():
	get_node("SleepConfirm").visible = true
	Gs.emit_signal("dayCounter")


func _on_Bonfire_pressed():
	get_node("AcceptDialog").visible = true
	Gs.emit_signal("hungerCounter")

func wait(milliseconds: float) -> void:
	OS.delay_msec(milliseconds)
