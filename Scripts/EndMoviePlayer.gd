extends VideoPlayer

func _on_VideoPlayer_finished():
	get_parent().get_node("VideoPlayer").visible = false
	get_parent().get_node("VideoPlayer").paused = true
	get_parent().get_node("AudioStreamPlayer2D").playing = true


func _on_AudioStreamPlayer2D_finished():
	get_parent().get_node("AudioStreamPlayer2D").playing = false
