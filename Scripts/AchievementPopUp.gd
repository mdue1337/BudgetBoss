extends Node2D

onready var popup = get_node("A1/Panel")
onready var tween = get_node("A1/Tween")
onready var timer = get_node("A1/Timer")
onready var name_label = get_node("Name")
onready var des_label = get_node("Description")
Gs.connect("", self, "updateMoney")

func _ready():
	Gs.emit_signal("get_user_achievements")
	write_label()

func write_label():
		name_label.text = str(Gs.AchievementsName[i])

func _show_popup():
	popup.show()
	tween.interpolate_property(popup, "rect_position", popup.rect_position, Vector2(-200, 120), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()
	timer.start()

func _hide_popup():
	tween.interpolate_property(popup, "rect_position", popup.rect_position, Vector2(-200, 400), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	popup.hide()

func _on_Timer_timeout():
	_hide_popup()
