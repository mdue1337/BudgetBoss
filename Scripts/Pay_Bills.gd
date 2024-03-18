extends TextureButton

func _on_PayAll_pressed():
	if(Gs.moneyBank > Gs.bills):
		Gs.moneyBank -= Gs.bills
		Gs.bills = 0
		$Label2.text = "You paid your bills. \nYou currently have: " + str(Gs.bills) + "$ in bills"
	else:
		$Label2.text = "You don't have sufficient funds. \nHowever, you still have " + str(Gs.bills) + "$ in bills"
