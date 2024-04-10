extends Node2D

var medicinePrice = 200;

func _ready():
	print(get_node("."))
	
	$MedicinButton.texture_normal = preload("res://Scenes/Inventory/medicine.png")
	$MedicinButton/Label.text = "Medicine: " + str(medicinePrice)
	
	if Gs.radioParts >= 5:
		$RadioButton.visible = false;
		pass
	else:
		$RadioButton/Label.text = "Radiopart " + str(Gs.radioParts + 1) + ": " + str(Gs.upgradePricesRadio[Gs.radioParts])
		$RadioButton.texture_normal = preload("res://Scenes/Inventory/radiopart.png")
	
	if Gs.work == 3:
		$WorkButton.visible = false;
	else:
		$WorkButton/Label.text = "Upgrade " + str(Gs.work) + ": " + str(Gs.upgradePricesWork[Gs.work - 1])
		if Gs.work == 2:
			$WorkButton.texture_normal = preload("res://Scenes/Inventory/worklevel2.png")
		else:
			$WorkButton.texture_normal = preload("res://Scenes/Inventory/work3level.png")

func _on_MedicinButton_pressed():
	if Gs.moneyBank > medicinePrice:
		Gs.emit_signal("bankCounter", -medicinePrice);
		Gs.medicineCount += 1
		get_tree().change_scene("res://Scenes/Market.tscn")
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true

func _on_WorkButton_pressed():
	if  Gs.moneyBank > Gs.upgradePricesWork[Gs.work - 1]:
		var price : int = Gs.upgradePricesWork[Gs.work - 1]
		Gs.emit_signal("bankCounter", -price);
		Gs.work += 1
		get_tree().change_scene("res://Scenes/Market.tscn")
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true

func _on_RadioButton_pressed():
	if  Gs.moneyBank > Gs.upgradePricesRadio[Gs.radioParts]:
		Gs.emit_signal("bankCounter", -Gs.upgradePricesRadio[Gs.radioParts]);
		Gs.radioParts += 1
		get_tree().change_scene("res://Scenes/Market.tscn")
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true
