extends TextureButton




func _on_Hospital_pressed():
	if (Gs.illnessLevel > 0):
		get_parent().get_node("Bliv indlagt").visible = true
	else:
		get_parent().get_node("AcceptDialog").dialog_text = "Du har ingen sygdomme! brug pængene på en god bog eller spar dem op!"
		get_parent().get_node("AcceptDialog").visible = true
