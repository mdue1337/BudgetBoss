extends Node2D

var medicinePrice = 200;

func _on_MedicinButton_pressed():
	if Gs.moneyBank > medicinePrice:
		Gs.emit_signal("bankCounter", -medicinePrice);
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true
