extends Control

func _ready():
	Gs.connect("workpay", self, "getpaid")

func getpaid(worklevel : int):
	print(str(worklevel))
	
	var amount : int;
	if worklevel == 1:
		amount = 400;
	elif worklevel == 2:
		amount = 550;
	elif worklevel == 3:
		amount = 725;
	
	Gs.emit_signal("moneyCounter", amount)
