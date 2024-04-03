extends TextureButton

func _on_Hospital2_pressed():
	if (Gs.illnessLevel > 0):
		get_parent().get_node("Deposit Cash").visible = true
	else:
		get_parent().get_node("AcceptDialog").visible = true
