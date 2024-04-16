extends VideoPlayer

func _ready():
	if Gs.newPLayer == false:
		hide()
	BackgroundMusic.get_node("AudioStreamPlayer").playing = false

func _on_VideoPlayer_finished():
	hide()

func _on_Button_pressed():
	hide()

func hide():
	Gs.newPLayer = false
	get_parent().get_node("VideoPlayer").visible = false
	get_parent().get_node("VideoPlayer").paused = true
	BackgroundMusic.get_node("AudioStreamPlayer").playing = true
