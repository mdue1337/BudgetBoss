extends VideoPlayer

func _ready():
	if Gs.newPLayer == false:
		hide()

func _on_VideoPlayer_finished():
	hide()

func _on_Button_pressed():
	hide()

func hide():
	Gs.newPLayer = false
	get_parent().get_node("VideoPlayer").visible = false
	get_parent().get_node("VideoPlayer").paused = true
