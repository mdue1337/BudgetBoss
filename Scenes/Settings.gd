extends Node2D

var master_bus = AudioServer.get_bus_index("Master")
var music = AudioServer.get_bus_index("Music")


func _on_Volume_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -10:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)



func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(music, value)
	if value == -10:
		AudioServer.set_bus_mute(music, true)
	else:
		AudioServer.set_bus_mute(music, false)
