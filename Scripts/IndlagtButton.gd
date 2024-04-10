extends TextureButton

func _ready():
	if (Gs.accident == true):
		print("Accidentaccident")
		get_parent().get_node("Hospital").visible = true
		get_parent().get_node("Node2D2").visible = false
		get_parent().get_node("Accident").visible = true

func _on_Accident_confirmed():
	if (Gs.medicineCount > 0):
		Gs.accident = false;
		Gs.medicineCount -= 1;
		get_tree().change_scene("res://Scenes/Map.tscn");

func _on_Accident_visibility_changed():
		Gs.emit_signal("dayCounter");
		Gs.emit_signal("dayCounter");
		Gs.emit_signal("dayCounter");
		Gs.accident = false;
		Gs.bills += 500;
		get_tree().change_scene("res://Scenes/Hospital.tscn");

func _on_Hospital_pressed():
	pass
	#if (Gs.illnessLevel > 0):
		#get_parent().get_node("Bliv indlagt").visible = true
	#else:
		#get_parent().get_node("AcceptDialog").dialog_text = "Du har ingen sygdomme! brug pængene på en god bog eller spar dem op!"
		#get_parent().get_node("AcceptDialog").visible = true
