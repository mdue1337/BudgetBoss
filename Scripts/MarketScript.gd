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
	if Gs.moneyBank >= medicinePrice:
		Gs.emit_signal("bankCounter", -medicinePrice);
		Gs.medicineCount += 1
		if Gs.medicineCount == 10:
			Gs.achievementDB = 10
			Gs.emit_signal("add_user_achievement")
			var achievement = get_node("AchievementPopUp") 
			achievement.call("write_label", Gs.achievementDB)
			achievement.visible = true
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true

func _on_WorkButton_pressed():
	print("Pressed button to buy new work level")
	if Gs.work>2:
		print("work level too high to buy more")
	
	elif  Gs.moneyBank >= Gs.upgradePricesWork[Gs.work - 1]:
		print("User has enough money")
		var price : int = Gs.upgradePricesWork[Gs.work - 1]
		Gs.emit_signal("bankCounter", -price);
		Gs.work += 1
		print("Work level has been set to: " + str(Gs.work))
		if Gs.work == 2:
			print("Budget Knowledge shown")
			get_node("EconomyKnowledge/Budget").visible = true
			$WorkButton.texture_normal = preload("res://Scenes/Inventory/worklevel2.png")
			$WorkButton/Label.text = "Upgrade " + str(Gs.work) + ": " + str(Gs.upgradePricesWork[Gs.work - 1])
		if Gs.work == 3:
			print("Inflation and Rent knowledge shown")
			get_node("EconomyKnowledge/Inflation").visible = true
			get_node("EconomyKnowledge/Renter").visible = true
			$WorkButton.texture_normal = preload("res://Scenes/Inventory/work3level.png")
			$WorkButton/Label.text = "Upgrade " + str(Gs.work) + ": " + str(Gs.upgradePricesWork[Gs.work - 1])
		else:
			$WorkButton.visible = false;
			Gs.achievementDB = 9
			Gs.emit_signal("add_user_achievement")
			var achievement = get_node("AchievementPopUp") 
			achievement.call("write_label", Gs.achievementDB)
			achievement.visible = true
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true

func _on_RadioButton_pressed():
	if  Gs.moneyBank >= Gs.upgradePricesRadio[Gs.radioParts]:
		Gs.emit_signal("bankCounter", -Gs.upgradePricesRadio[Gs.radioParts]);
		Gs.radioParts += 1
		if Gs.radioParts == 1:
			Gs.achievementDB = 7
			Gs.emit_signal("add_user_achievement")
			var achievement = get_node("AchievementPopUp") 
			achievement.call("write_label", Gs.achievementDB)
			achievement.visible = true
			yield(get_tree().create_timer(3), "timeout")
			get_tree().change_scene("res://Scenes/Market.tscn")
		if Gs.radioParts == 5:
			Gs.achievementDB = 8
			Gs.emit_signal("add_user_achievement")
			var achievement = get_node("AchievementPopUp") 
			achievement.call("write_label", Gs.achievementDB)
			achievement.visible = true
			yield(get_tree().create_timer(3), "timeout")
			get_tree().change_scene("res://Scenes/Market.tscn")
		if Gs.radioParts == 2 or Gs.radioParts == 3 or Gs.radioParts == 4:
			get_tree().change_scene("res://Scenes/Market.tscn")
	else:
		get_node("AcceptDialog").dialog_text = "Du har ikke råd"
		get_node("AcceptDialog").visible = true
