extends TextureButton

func _on_Bills_pressed():
	get_owner().get_node("Pay Bills").visible = true
	get_owner().get_node("Pay Bills").get_node("PayAll/Label2").text = "You have: " + str(Gs.bills) + "$ in bills"
