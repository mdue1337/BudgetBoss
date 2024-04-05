extends Control

func _ready():
	Gs.connect("workpay", self, "getpaid")

func getpaid(worklevel : int):
	var amount : int;
	if worklevel == 1:
		amount = 325;
	elif worklevel == 2:
		amount == 450;
	elif worklevel == 3:
		amount == 600;
	
	Gs.moneyPerson += amount
