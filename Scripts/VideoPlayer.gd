extends VideoPlayer

var cached_level = 0;

func _ready():
	if Gs.newPLayer == false:
		hide()
	else:
		cached_level = BackgroundMusic.get_node("AudioStreamPlayer").volume_db
		print(cached_level)
		BackgroundMusic.get_node("AudioStreamPlayer").volume_db = -80

func _on_VideoPlayer_finished():
	hide()

func _on_Button_pressed():
	hide()

func hide():
	Gs.newPLayer = false
	get_parent().get_node("VideoPlayer").visible = false
	get_parent().get_node("VideoPlayer").paused = true
	BackgroundMusic.get_node("AudioStreamPlayer").volume_db = cached_level
