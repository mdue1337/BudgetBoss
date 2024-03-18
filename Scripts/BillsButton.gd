extends TextureButton

func _on_Bills_pressed():
	get_owner().get_node("Pay Bills").visible = true
	$Label4.text = "You have: " + str(Gs.bills) + "$ in bills"
