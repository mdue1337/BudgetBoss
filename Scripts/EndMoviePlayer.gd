extends VideoPlayer

func _on_VideoPlayer_finished():
	get_parent().get_node("VideoPlayer").visible = false
	get_parent().get_node("VideoPlayer").paused = true
