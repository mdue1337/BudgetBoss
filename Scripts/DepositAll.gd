extends TextureButton

func _on_DepositAll_pressed():
	if Gs.moneyPerson == 0:
		var popup = get_parent().get_parent().get_node("Win")
		popup.dialog_text = "You need to have more than 0 dollars on you to deposit \n"
		popup.visible = true
	else:
		print("moneyBank:" + str(Gs.moneyBank))
		print("moneyPerson:" + str(Gs.moneyPerson))
		Gs.emit_signal("bankCounter", Gs.moneyPerson)
		Gs.emit_signal("moneyCounter", -Gs.moneyPerson)
		print("transfered")
		print("moneyBank:" + str(Gs.moneyBank))
		print("moneyPerson:" + str(Gs.moneyPerson))
	
