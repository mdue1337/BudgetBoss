extends ConfirmationDialog

func _on_ConfirmationDialog_confirmed():
	var nodeInfo = get_parent().get_parent().get_node("AcceptDialog")
	if Gs.moneyBank >= 5:
		nodeInfo.dialog_text = "Food was delicious... \n Hunger level has increased!"
		nodeInfo.visible = true;
		Gs.emit_signal("hungerCounter", 5)
	else:
		nodeInfo.dialog_text = "No food for you"
		nodeInfo.visible = true;
