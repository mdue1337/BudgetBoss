extends TextureButton

func _on_DepositAll_pressed():
	print("moneyBank:" + str(Gs.moneyBank))
	print("moneyPerson:" + str(Gs.moneyPerson))
	
	Gs.moneyBank = Gs.moneyBank + Gs.moneyPerson
	Gs.moneyPerson = 0
	
	print("transfered")
	print("moneyBank:" + str(Gs.moneyBank))
	print("moneyPerson:" + str(Gs.moneyPerson))
