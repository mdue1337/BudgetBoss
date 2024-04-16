extends TextureButton

func _on_PayAll_pressed():
	if(Gs.moneyBank > Gs.bills):
		Gs.emit_signal("bankCounter", -Gs.bills)
		Gs.bills = 0
		$Label2.text = "Du har betalt dine regninger!"
	else:
		$Label2.text = "Det har du ikke råd til \nDu har stadigt " + str(Gs.bills) + "$ i regninger"
