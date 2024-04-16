extends VideoPlayer

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	BackgroundMusic.get_node("AudioStreamPlayer").playing = false

func _on_VideoPlayer_finished():
	get_parent().get_node("VideoPlayer").visible = false
	get_parent().get_node("VideoPlayer").paused = true
	get_parent().get_node("AudioStreamPlayer2D").playing = true


func _on_AudioStreamPlayer2D_finished():
	get_parent().get_node("AudioStreamPlayer2D").playing = false
	BackgroundMusic.get_node("AudioStreamPlayer").playing = true
