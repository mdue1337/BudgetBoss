extends Node2D

onready var popup = get_node("Panel")
onready var timer = get_node("Timer") 
onready var name_label = get_node("Panel/Name")
onready var des_label = get_node("Panel/Description") 

func _ready():
	Gs.emit_signal("get_user_achievements")

func write_label(achievementId : int):
	var name = str(Gs.AchievementsName[achievementId - 1])
	var description = str(Gs.AchievementsDescriptions[achievementId - 1])
	name_label.text = name
	des_label.text = description
	_show_popup()

func _show_popup():
	popup.visible = true 
	timer.start()

func _hide_popup():
	popup.visible = false 

func _on_Timer_timeout():
	_hide_popup()
