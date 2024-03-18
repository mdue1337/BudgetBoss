extends TextureButton

func _on_Deposit_pressed():
	get_owner().get_node("Deposit Cash").visible = true
